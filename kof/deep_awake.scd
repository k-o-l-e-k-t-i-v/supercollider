


p.push()

s.latency = 0.2;

p.bpm(119.7/4);


b = Buffer.read(s,Platform.resourceDir ++ "/sounds/mono/stetson.wav");

// player synth ///////////////////////////////////////

(
    ~hob.ar(2);
    ~hob.quant=2;
    ~hob.fadeTime=2.02;
    ~hob={
        var mod = 1;//[4,2,1.5];
        var spread = 0.01;
        var pos = TRand.kr(Impulse.kr(~tempo/[1,2,3]),0.01,1) + LFSaw.ar(1/160/[1,2,3]);
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[3.5,1.005],[-3,-2],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.0001),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);

        sig = sig * env;
        //sig = BPF.ar(sig,[500,250,125],LFTri.ar(~tempo/[1,2,3]).exprange(0.01,0.5)) + (sig/2);
        sig = CompanderD.ar(sig,3/4,1/[1.1,1.5,2],1);
        sig = Compander.ar(sig,~puls.ar,0.1,1,0.1);
        sig = LPF.ar(sig,1500);
        Splay.ar(sig.flat,0.5,0.25);
    };
    ~hob.play;
    ~hob[10] = \filter -> {|sig| DWGReverbC1C3.ar(NumChannels.ar(sig,2),[4000,4010],1/10)/4};

);
~hob.stop(7);
~hob.clear;


// puls synth ///////////////////////////////////////

(
    ~puls.ar(2);
    ~puls.clock = p.clock;
    ~puls.quant=4;
    ~puls.fadeTime=4;
    ~puls={
        var cad = LFNoise0.kr(~tempo/[1,2,3].nthPrime).exprange(4.0001,64).round(4) / 4;
        var sig = LFPulse.ar(15000/[1,1.5,1.333333],mul:0.15) + WhiteNoise.ar(0.015!3) + SinOsc.ar(50*[1,2,3],Pulse.ar(~tempo/[1,2,3].nthPrime*cad),mul:0.02) / 8 * Pulse.ar(~tempo*cad/[1,2,3].nthPrime).softclip;
        sig = HPF.ar(sig,50);
        sig = CombC.ar(sig,~tempo/2,~tempo/2,~tempo);
        sig = Vibrato.ar(sig,[6,7,8],0.2);
        Splay.ar(sig,0.15,0.15,SinOsc.kr(~tempo/[5,6,7]));
    };
    ~puls.play;
);
~puls.stop(4);
~puls.clear;
~puls.pause;
~puls.resume;

// form synth ///////////////////////////////////////

(
    ~form.ar(2);
    ~form.clock = p.clock;
    ~form.quant=2;
    ~form.fadeTime=4;
    ~form={
        var n = 50;
        var env = LFTri.ar(~tempo/[1,2,3]/4) ** 2;
        var sig = VarSaw.ar(n,0,env**0.8) * Formant.ar(n,n*2,n*4) * env;
        Splay.ar(sig,0.5,0.25);
    };
    ~form.play;
);
~form.stop(4);
~form.clear;
~form.pause;
~form.resume;


(
    ~master.quant=8;
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
    s.latency=0.2;
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


(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(60);};});
}.fork;  
)
