p.push();

~tempo = {SinOsc.kr(1/37.5).range(109,111)/60}

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=24;
~one.fadeTime=4;
~one={
    var phase = SinOsc.kr(~tempo/[3,4,2]);
    var detune = SinOsc.kr(~tempo/[7,9,13]/4)*[0.1,0.001];
    var base = [65,67,60].midicps*[40,80,160];
    var frac = 1/[60,50,300];
    var mel = Duty.kr([3,4,2]*[4,24,48]/~tempo,0,Dseq([1,1.5,2,4/3],inf));
    var sig = SinOsc.ar(frac*mel*base+detune,phase) + LFSaw.ar(frac*mel*base-detune) * Pulse.ar(~tempo/[2,3,4]);
    sig = sig.softclip;
    sig = LPF.ar(sig,5000);
    Splay.ar(sig,0.05,0.05);
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
~kick.quant=24;
~kick.fadeTime=0.02;
~kick={
    //  |       |       |       |       |  
    var pat = [
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1,
    ].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.75],[3,-3]),imp * hit);
    var sig = SinOsc.ar(35+(env**40*400),env**10*2pi);
    sig = sig * env;
    Splay.ar(sig,0.0,0.75);
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
        1,0,0,0, 0,0,0,0, 1,0,0,0, 1,0,1,0,
        1,0,0,0, 0,0,0,0, 1,0,0,0, 1,0,1,0,
        1,0,0,0, 0,0,0,0, 1,0,0,0, 1,0,1,0,
        1,0,0,0, 0,0,0,0, 1,0,0,0, 1,0,1,0,
    ].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,[2,3,4],~counter.kr%pat.size);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15],[3,-3]),imp * hit);
    var sig = WhiteNoise.ar(0.1);
    sig = sig * env;
    Splay.ar(sig,0.75,0.85);
};
~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;


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
