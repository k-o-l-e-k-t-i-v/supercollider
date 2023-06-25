

s.boot;

p=NetProxy.push();

p.bpm(135)

(
    ~tick.kr(1);
    ~tick.clock = p.clock;
    ~tick.quant=24;
    ~tick = { Impulse.kr(~tempo * 4); };
    ~counter = {PulseCount.kr(~tick.kr);};
);		

// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=4;
~kick.fadeTime=0.02;
~kick={
    //  |       |       |       |       |  
    var pat = [
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,1,0, 1,0,0,0, 1,0,1,0, 1,0,0,0,
        1,0,0,0, 1,0,1,0, 1,0,0,0, 1,0,1,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1,
    ].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3]),imp * hit);
    var sig = SinOsc.ar(40+(env**40*100),env**20*8pi);
    sig = sig * env;
    Splay.ar(sig,1,0.95);
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
~hiss.quant=24;
~hiss.fadeTime=0.02;
~hiss={
    //  |       |       |       |       |  
    var pat = [
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    ].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15],[3,-3]),imp * hit);
    var sig = WhiteNoise.ar(0.3!2);
    sig = sig * env;
   sig = HPF.ar(sig,8000);
    Splay.ar(sig,0.75,0.75);
};
~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;


// perl synth ///////////////////////////////////////

(
~perl.ar(2);
~perl.quant=24;
~perl.fadeTime=0.02;
~perl={
    //  |       |       |       |       |  
    var pat = [
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    ].rotate(1);
    var base = 200;
    var mel = 2**Duty.kr([1,4]/~tempo,0,Dseq([1,5,1,8,1,6,7,1,5,9]/12,inf));
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15],[3,-3]),imp * hit);
    var sig = LFSaw.ar([1/23,1/24,base*mel]) * 2pi;
    sig = Perlin3.ar(sig[0].cos,sig[1].sin,sig[2] / 2pi) + SinOsc.ar(base*mel);
    sig = LeakDC.ar(sig);
    sig = sig * env;
    Splay.ar(sig,0.75,0.5);
};
~perl.play;
);
~perl.stop(4);
~perl.clear;
~perl.pause;
~perl.resume;



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
