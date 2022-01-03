
p.push();

p.bpm(89.7*2)

(
    ~tick.kr(1);
    ~tick.clock = p.clock;
    ~tick.quant=24;
    ~tick = { Impulse.kr(~tempo * 4); };
    ~counter = {PulseCount.kr(~tick.kr);};
);    


// ok synth ///////////////////////////////////////

(
    ~ok.ar(2);
    ~ok.quant=8;
    ~ok.fadeTime=0.4;
    ~ok={
        var series = Duty.kr([4,1/8,1/24]/~tempo,0,Dseq([60,62,65,67,72,36]+.x[0,-4,7],inf))  ;
        var mod = LFTri.kr(~tempo/3600*[1,2,3],mul:24);
        var note = series.midicps/4*[2,4/3,5/4] + SinOsc.kr(~tempo*8/[1,2,3],mul:0.01);
        var sig = LFSaw.ar(~tempo/4/[1,2,3])*2pi;
        sig = Perlin3.ar((LFSaw.ar(sig[0].cos*~tempo/[2,4,8])+1).cos,LFSaw.ar(note,mul:2pi,add:mod).sin,sig[2].sin);
        sig = LeakDC.ar(sig);
        sig = CombL.ar(sig,~tempo/4,~tempo/16,1);
        Splay.ar(sig,0.95,0.35);
    };
    ~ok.play;
);
~ok.stop(4);
~ok.clear;
~ok.pause;
~ok.resume;



// kick synth ///////////////////////////////////////

(
    ~kick.ar(2);
    ~kick.quant=8;
    ~kick.fadeTime=0.02;
    ~kick={
        //  |       |       |       |       |  
        var pat = [
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,1,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,1,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,1,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1,
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,4,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3]),imp * hit);
        var sig = SinOsc.ar(45!2+(env**10*80),env**70*2pi);
        sig = sig * env;
        Splay.ar(sig,0.95,0.75);
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
    ~hiss.quant=8;
    ~hiss.fadeTime=0.02;
    ~hiss={
        //  |       |       |       |       |  
        var pat = [
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,1,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,1,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,1,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1,
        ].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15],[3,-3]),imp * hit);
        var sig = WhiteNoise.ar(0.6!4);
        sig = sig * env;
        sig = CombL.ar(sig,4/~tempo,LFNoise1.kr(~tempo/4!4).range(0.99,1.01)/[4,3,2,1]/~tempo,1);
        sig = LeakDC.ar(sig);
        Splay.ar(sig,0.15,0.5);
    };
    ~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;

(
    //s.latency=0.2;
    //p.clock.tempo_(120/60);
    p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
    ~tick.kr(1);
    ~tick.quant = 24;
    ~counter.quant = 24;
    ~counter = {PulseCount.kr(~tick.kr);};
    ~tick = { Impulse.kr( ~tempo * 4 ); };
);
~hiss.resume;
