

p.makeTempoClock;
(
    TempoClock.default = p.clock;
    p.clock.tempo_(127/60);
    p.arProxyNames.do(p[_.asSymbol].rebuild);
)


(
    ~master.quant=2;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.15,lp=1500,hp=250,len=2,rev = 2|
        var sig = In.ar([0,1]);
        var orig = sig;
        var fx;
        fx = Limiter.ar(sig,0.95);
        //sig = DelayN.ar(sig,(1..8)/8*~tempo,(1..8)/8*~tempo);
        sig = Compander.ar(sig,3/4,1/2,1/3);
        fx = LPF.ar(sig,lp);
        fx = HPF.ar(fx,hp);
        fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
        sig = SelectX.ar(wet,[orig,fx]);
        sig = NumChannels.ar(sig,2);
        ReplaceOut.ar(0,sig);
    };
);
p.moveNodeToTail(\master);

(
    //////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
    {
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
    }.fork;  
)

(
    s.latency=0.5;
    p.clock.tempo_(140/60);
    p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
    ~tick.kr(1);
    ~tick.clock = p.clock;
    ~tick.quant=4;
    ~counter.clock = p.clock;
    ~counter.quant = 4;
    ~counter = {PulseCount.kr(~tick.kr);};
    ~tick = { Impulse.kr(~tempo*4); };
);



(
    //////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
    {
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear;};});
    }.fork;  
)
// dum synth ///////////////////////////////////////

(
    (
        ~modem.ar(2);
        ~modem.clock = p.clock;
        ~modem.quant=[1,0];
        ~modem.fadeTime=16;
        ~modem={
            var mod = Duty.kr(128/~tempo*(1..16),0,Dseq([1,2,1.5,1.33333,4,8,1,1,1,1,1,1],inf));
            var high = 22000/[1,2.0,1.333,1.5]/mod;
            var mad = SinOsc.ar(60*~tempo/(1..16)).range(1,high);
            var sig = SinOsc.ar(mad.range(0.1,5000)) ** (LFSaw.ar(mad).exprange(0.01,2));
            sig = VarSaw.ar(sig.exprange(500.01,high));// * Pulse.ar(~tempo).lag(0.01);

            sig = BBandPass.ar(sig,high/16*(((1..16)/16)**2*16),0.02 + LFNoise0.kr(~tempo/4*((1..16)/16**4)).range(0.0001,0.92)) * LFSaw.kr(~tempo*((1..16)/16**2)).exprange(0.001,4);
            sig = Resonz.ar(sig,high/16*(((1..16)/16)**2*16),0.02 + LFNoise1.kr(~tempo/16*((1..16)/16**5.14)).range(0.0001,0.92)) * LFNoise2.kr(~tempo*((1..16)/16**2)).exprange(0.001,4);
            sig = OnePole.ar(sig,LFNoise2.kr(~tempo/16!16));
            sig = DFM1.ar(sig,high/16*(((1..16)/16)**2*16),0.002 + LFNoise2.kr(~tempo/64*((1..16)**0.54)).range(0.0001,0.92)) * LFNoise2.kr(~tempo*((1..16)/16**2)).exprange(0.001,4);
            sig = CompanderD.ar(sig,3/4,1/4,1/2);
            sig = Normalizer.ar(sig) * LFSaw.ar(~tempo/64*16/(1..16));//  * LFPulse.ar(~tempo*4/(1..16));
            sig = (sig * LFSaw.ar(~tempo/[1,2,3,4,5,6,7,8]*2,0,1/2)/8) +  (sig * Pulse.ar(~tempo/[1,2,3,4,5,6,7,8]*2,1/2)/2) + (sig * LFPulse.ar(~tempo/[1,2,3,4,5,6,7,8]*2)/2);
            Splay.ar(sig,0.95,0.05,SinOsc.kr(1/4/[1,2,3,4]));
        };
        ~modem.play;
    );

    // kick synth ///////////////////////////////////////
    (
        ~kick.ar(2);
        ~kick.clock = p.clock;
        ~kick.quant=[2,0];
        ~kick.fadeTime=16.04;
        ~kick={
            var speed = 1/[1,2,4,3]/4;//TWChoose.kr(Impulse.ar(~tempo/8),[1,2,1/2,1/4,1/8],[8,3,2,1,0.2],1).lag(1);
            var sig = SinOsc.ar(50!2+Pulse.ar(~tempo*speed*4,mul:10),Pulse.ar(~tempo*speed*2)) * LFPulse.ar(~tempo/32*speed,3/4);
            Splay.ar(sig,0.5,0.75);
        };
        ~kick.play;
    );
    (
        ~sell.ar(4);
        // ~sell.quantize(~tick);
        ~sell.mold(4);
        ~sell.clock = p.clock;
        ~sell.quant=[8,0];
        ~sell.fadeTime=4;

        ~sell={var t = LFTri.ar([1/1600,1/1600,[1/4,1/2,1/8,1/16]]*~tempo) * 1/4 + LFSaw.ar(1/4000,mul:2); Perlin3.ar(t[0],t[1],t[2]);};
    );

    // scanner synth ///////////////////////////////////////

    (
        ~scanner.ar(2);
        ~scanner.clock = p.clock;
        ~scanner.quant=[2,1/2];
        ~scanner.fadeTime=0.2;
        ~scanner={
            //         |       |       |       |       |
            var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0];
            var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr % pat.size);
            var hit = Select.kr(PulseCount.kr(imp)*[1,2,8,4]%pat.size,pat);
            var env = Decay2.kr(imp*hit,1/4/[1,2,4,3]*~tempo*LFNoise2.kr(~tempo/64!4).exprange(1.0,4.9),0.0005);
            var sig = [
                SinOsc.ar(60.midicps/4,Pulse.ar(~tempo/[1,2,8,4]*2)),
                LFNoise0.ar(1500*[1,2,4,8]) * Pulse.ar(~tempo/[1,2,8,4]),
                Pulse.ar([4,8,2,1]*~tempo*2) * SinOsc.ar(55,Pulse.ar(~tempo/[1,2,8,4])),
                Crackle.ar(1.5*Pulse.ar(~tempo/[1,2,8,4])) * Pulse.ar(~tempo/[1,2,8,4]);
                Pulse.ar(~tempo*[4,2]) * SinOsc.ar(60.midicps*8/[1,1.5],mul:0.12),
                LFNoise1.ar(15800!2) * Pulse.ar(~tempo/[1,2,8,4]),
            ];
            sig = SelectX.ar(~sell.ar*(sig.size+1) % (sig.size+1),sig);
            sig = Resonz.ar(sig,LFNoise2.kr(1/4/[1,2,3,4] * ~tempo).exprange(100.01,1600),0.2,mul:2)+sig/2;
            sig = HPF.ar(sig,20);
            sig = Limiter.ar(sig,0.995);
            sig = sig * env;
            sig = CompanderD.ar(sig,3/4,1/5,1/20,0.0002,1);
            Splay.ar(sig,0.95,0.15,SinOsc.kr(4.01*~tempo)/1.2);
        };
        ~scanner.play;
    );
)
~kick.stop(4);
~kick.clear(4);
~kick.pause;
~kick.resume;


(
    //////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
    {
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(120);};});
    }.fork;  
)
