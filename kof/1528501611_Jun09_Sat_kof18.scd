







p.push();
p.bpm(89.97*2)


// oneone synth ///////////////////////////////////////

(
    ~oneone.ar(2);
    ~oneone.clock = p.clock;
    ~oneone.quant=4;
    ~oneone.fadeTime=4;
    ~oneone={
        var env = Pulse.ar(12/[1,2,3,4]);
        var sig = SinOsc.ar(50!2,env**40*8pi);
        Splay.ar(sig,0.5,0.25);
    };
    ~oneone.play;
);
~oneone.stop(4);
~oneone.clear;
~oneone.pause;
~oneone.resume;


// twelve synth ///////////////////////////////////////

31.midicps;

(
    ~twelve.ar(2);
    ~twelve.quant=4;
    ~twelve.fadeTime=0.2;
    ~twelve={
        //         |       |       |       |       |  
        var pat = [
            1,1,1,1,
            0,1,0,1,
            1,1,1,1,
            1,0,1,0,
        ].rotate(1);
        var base = Duty.kr(16/~tempo,0,Dseq([32,36,40,44],inf)).midicps;
        var cents = 2**Duty.kr(16/[1,2]/~tempo,0,Dseq([102,600,804]/1200,inf));
        var imp = PulseDivider.kr(~tick.kr,4,~counter.kr % pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.00337,LFDNoise1.kr(~tempo/15).exprange(0.1,4.5)],[6,-6]*LFNoise2.kr(~tempo/15),curve:'exp'),imp * hit)};
        var sig = [
            SinOsc.ar(base,env**20*8pi),
            HPF.ar(WhiteNoise.ar(0.2),env**4*16000+base),
            VarSaw.ar(base*cents+LFTri.ar(1/16+((100..108).reciprocal)*env),0,env**40),
            HPF.ar(WhiteNoise.ar(0.2*env),env**2*16000+base),
            SinOsc.ar(base,env**60*8pi),
            HPF.ar(WhiteNoise.ar(0.3*env),env**8*16000+base),
            SinOsc.ar(base*8,env**10*2pi,mul:0.2),
            BrownNoise.ar(0.2)
        ];
        sig = BPF.ar(sig,(1..8)/8*20000,0.2) + LPF.ar(sig,1500) + HPF.ar(sig,10000) * LFDNoise1.kr(~tempo/15!8);
        sig = CompanderD.ar(sig,3/4,1/2,1);
        sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);

        //sig = sig * env;
        Splay.ar(sig,0.75,0.5);
    };
    ~twelve.play;
);
~twelve.stop(4);
~twelve.clear;
~twelve.pause;
~twelve.resume;

(
    ~master.quant=2;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.15,lp=3500,hp=250,len=10,rev = 3|
        var sig = In.ar([0,1]);
        var orig = sig;
        var fx;
        //fx = Limiter.ar(sig,0.95);
        sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
        fx = LPF.ar(sig,lp);
        fx = HPF.ar(fx,hp);
        fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
        sig = SelectX.ar(wet,[orig,fx]);
        sig = NumChannels.ar(sig,2);
        ReplaceOut.ar(0,sig);
    };
);
p.moveNodeToTail(\master);

(
    s.latency=1/3;
    //p.clock.tempo_(120/60);
    p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
    ~tick.kr(1);
    ~tick.clock = p.clock;
    ~tick.quant = 16;
    ~counter.clock = p.clock;
    ~counter.quant = 16;
    ~counter = {PulseCount.kr(~tick.kr);};
    ~tick = { Impulse.kr( ~tempo * 4 ); };
);
