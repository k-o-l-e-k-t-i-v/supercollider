

(
    //s.latency=0.2;
    //p.clock.tempo_(120/60);
    p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
    ~tick.kr(1);
    ~tick.quant = 24;
    `~counter.quant = 24;
    ~counter = {PulseCount.kr(~tick.kr);};
    ~tick = { Impulse.kr( ~tempo * 4 ); };
);

// tunelog synth ///////////////////////////////////////

(
    ~tunelog.ar(2);
    ~tunelog.quant=24;
    ~tunelog.fadeTime=4;
    ~tunelog={
        var base = 48.midicps + SinOsc.kr(~tempo/[3,4,5,6],mul:0.1);
        var mod = Duty.kr((1..12).nthPrime/4/~tempo,0,Dseq([1,2,1.5,1.33333],inf)).lag(1/4);
        var f = base*((12/(2..13)).log2[0,3,5,7,12]**2)/mod; 
        var sig = SinOsc.ar(f,SinOsc.ar(f/240)*2pi,mul:0.4) * (LFTri.ar(~tempo/(1..12).nthPrime)**2);
        sig = sig * Decay.ar(Impulse.ar(~tempo*2/[1,2,3]),LFNoise1.kr(~tempo/24/(1..12)).range(0.1,2.0));
        Splay.ar(sig,0.25,0.35);
    };
    ~tunelog.play;
);
~tunelog.stop(4);
~tunelog.clear;
~tunelog.pause;
~tunelog.resume;


// kick synth ///////////////////////////////////////

(
    ~kick.ar(2);
    ~kick.quant=[24,0];
    ~kick.fadeTime=0.02;
    ~kick={
        //  |       |       |       |       |  
        var pat = [
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1,
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.75],[3,-3]),imp * hit);
        var sig = SinOsc.ar(50!2+(env**20*(LFNoise1.kr(~tempo/24/4!4)*1000+10)),env**80*2pi) + BrownNoise.ar(env**40);
        sig = sig * env;
        Splay.ar(sig,0.0,0.15);
    };
    ~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;


// hiss synth ///////////////////////////////////////

(
    ~hiss.ar(2);
    ~hiss.quant=[24,0];
    ~hiss.fadeTime=0.02;
    ~hiss={
        //  |       |       |       |       |  
        var pat = [
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,1,0,
        ].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15],[3,-3]),imp * hit);
        var sig = WhiteNoise.ar(1!4);
        sig = BPF.ar(sig,16000/[1,10,100,1000],LFNoise1.kr(~tempo/24).exprange(0.1,0.9));
        sig = sig * env;
        Splay.ar(sig,0.25,0.75);
    };
    ~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;

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
