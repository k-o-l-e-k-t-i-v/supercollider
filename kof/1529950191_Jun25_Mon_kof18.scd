

p.push();

p.bpm(120);


// bass synth ///////////////////////////////////////

(
    ~bass.ar(2);
    ~bass.clock = p.clock;
    ~bass.quant=16;
    ~bass.fadeTime=4;
    ~bass={
        var mod= Duty.kr(16/~tempo*[1,2,3],0,Dseq([1,2,1.5,1.33333],inf));
        var mod2= Duty.kr(32/~tempo*[1,2,3],0,Dseq([1,2,1.5,1.33333],inf));
        var f = LFSaw.ar(1/64/[1,2,3]).exprange(1.0001,110*[1,2,mod]/mod*.x[1,1.5,mod2]/mod2);
        //var sig = VarSaw.ar([1100,110]/.x[1,2,mod]*mod/[1,1.5,mod2]*mod2,SinOsc.kr(1/16/[1,2,3]).range(0,1),CombN.ar(LFPulse.ar(4).abs,1/2,1/f,1/2));
        var sig = SinOsc.ar([220,330,110]/.x[1,2,mod]*mod/[1,1.5,mod2]*mod2,SinOsc.kr(1/16/[1,2,3]).range(0,1));
        sig = RLPF.ar(sig,LFTri.ar(1/4/[1,2,3]).range(100,1100*[1,2*mod2,4/mod]*mod/mod2),0.2);
        sig = LeakDC.ar(sig) * LFPulse.ar(8);
        sig = Vibrato.ar(sig,[4,5,6],0.2);
        //sig = Compander.ar(CombN.ar(sig,2/f,1/f,1)/2, sig+~kick.ar,0.75,1,0.1);
        sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
        Splay.ar(sig,0.5,0.15);
    };
    ~bass.play;
);
~bass.stop(4);
~bass.clear;
~bass.pause;
~bass.resume;

(3,3.1..4.1)

// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.clock = p.clock;
    ~one.quant=16;
    ~one.fadeTime=4;
    ~one={
        var env = {EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5*LFNoise1.kr(~tempo/32).range(0.5,3)],[6,-3]),Impulse.kr(~tempo)*LFPulse.kr(~tempo/[1,2,3,4]))};
        var sig = SinOsc.ar((41,41.1..51.01)+(5000**LFNoise1.kr(~tempo/4).range(20,80)*env),env**(LFNoise1.kr(~tempo/4).range(20,80))*8pi,mul:0.0333);
        sig = sig * env;
        Splay.ar(sig,0.5,0.25);
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

// kick synth ///////////////////////////////////////

(
    ~kick.ar(2);
    ~kick.clock = p.clock;
    ~kick.quant=[16,0];
    ~kick.fadeTime=0.02;
    ~kick={
        //  |       |       |       |       |  
        var pat = [
            1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
            1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
            1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
            1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
        ].rotate(1);
        var mod = Duty.kr(16/~tempo,0,Dseq([40,400,20,200,150,40],inf));
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3]),imp * hit);
        var sig = SinOsc.ar(45!2+(Pulse.ar(4)*mod),env**40*8pi);
        sig = sig * env;
        Splay.ar(sig,0.75,0.5);
    };
    ~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;

// kickEven synth ///////////////////////////////////////

(
    ~kickEven.ar(2);
    ~kickEven.clock = p.clock;
    ~kickEven.quant=[16,0];
    ~kickEven.fadeTime=0.02;
    ~kickEven={
        //  |       |       |       |       |  
        var pat = [
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        ].rotate(2);
        var mod = Duty.kr(16/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
        var imp = PulseDivider.kr(~tick.kr,4,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.05],[3,-3]),imp * hit);
        var sig = VarSaw.ar(55*[1,1.5,mod]/mod,env**10);

        sig = sig * env;
        Splay.ar(sig,0.75,0.5);
    };
    ~kickEven.play;
);
~kickEven.stop(4);
~kickEven.clear;
~kickEven.pause;
~kickEven.resume;

// hiss synth ///////////////////////////////////////

(
    ~hiss.ar(2);
    ~hiss.clock = p.clock;
    ~hiss.quant=[16,0];
    ~hiss.fadeTime=0.02;
    ~hiss={
        //  |       |       |       |       |  
        var pat = [
            1,0,1,0, 0,0,0,0, 0,0,1,0, 0,0,0,0,
            1,0,1,0, 0,0,0,0, 0,0,1,0, 0,0,0,0,
            1,0,1,0, 0,0,0,0, 0,0,1,0, 0,0,0,0,
            1,0,1,0, 0,0,0,0, 0,0,1,0, 1,1,1,1,
        ].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.05],[3,-3]),imp * hit);
        var sig = WhiteNoise.ar(0.5!2);
        sig = sig * env;
        sig = HPF.ar(sig,env.range(50,5000));
        Splay.ar(sig,0.75,0.25);
    };
    ~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;

(
    s.latency=2/3;
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
