
p.push()
p.bpm(88.631)


(
    //s.latency=0.2;
    //p.clock.tempo_(120/60);
    p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
    ~tick.kr(1);
    ~tick.quant = 16;
    ~counter.quant = 16;
    ~counter = {PulseCount.kr(~tick.kr);};
    ~tick = { Impulse.kr( ~tempo * 4 ); };
);

// kick synth ///////////////////////////////////////

(
    ~kick.ar(2);
    ~kick.quant=[16,0];
    ~kick.fadeTime=0.02;
    ~kick={
        //  |       |       |       |       |  
        var pat = [
            1,0,0,0, 1,0,0,0, 1,0,0,1, 1,0,0,0,
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3]),imp * hit);
        var sig = SinOsc.ar(43!2,env**20*8pi);
        sig = sig * env;
        Splay.ar(sig,0.75,0.25);
    };
    ~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;


// hat synth ///////////////////////////////////////

(
    ~hat.ar(2);
    ~hat.quant=[16,0];
    ~hat.fadeTime=0.02;
    ~hat={
        //  |       |       |       |       |  
        var pat = [
            0,0,1,0, 0,0,1,0, 0,0,1,0, 0,1,1,0,
            0,0,1,0, 0,0,1,0, 0,0,1,0, 0,0,1,1,
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15],[3,-3]),imp * hit);
        var sig = WhiteNoise.ar(0.2!2);
        sig = sig * env;
        Splay.ar(sig,0.75,0.5);
    };
    ~hat.play;
);
~hat.stop(4);
~hat.clear;
~hat.pause;
~hat.resume;


// rim synth ///////////////////////////////////////

(
    ~rim.ar(2);
    ~rim.quant=[16,0];
    ~rim.fadeTime=0.02;
    ~rim={
        //  |       |       |       |       |  
        var pat = [
            1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
            1,0,1,0, 1,0,1,0, 1,0,1,0, 1,1,1,1,
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15],[3,-3]),imp * hit);
        var sig = SinOsc.ar(15000!2);
        sig = sig * env;
        Splay.ar(sig,0.75,0.05);
    };
    ~rim.play;
);
~rim.stop(4);
~rim.clear;
~rim.pause;
~rim.resume;

// pentas synth ///////////////////////////////////////

(
    ~pentas.ar(2);
    ~pentas.quant=[16,0];
    ~pentas.fadeTime=0.02;
    ~pentas={
        //  |       |       |       |       |  
        var pat = [
            1,0,0, 1,0,0, 1,0,0, 1,0,0, 1,1,0,0,
            1,1,1, 1,1,1, 1,1,1, 1,1,1, 1,1,1,1,
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15],[3,-3]),imp * hit);
        var sig = SinOsc.ar(5000!2)*BrownNoise.ar(1);
        sig = sig * env;
        Splay.ar(sig,0.75,0.25);
    };
    ~pentas.play;
);
~pentas.stop(4);
~pentas.clear;
~pentas.pause;
~pentas.resume;



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
