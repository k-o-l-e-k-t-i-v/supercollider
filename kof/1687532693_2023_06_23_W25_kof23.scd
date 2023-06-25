
p.push()
p.bpm(120)
s.latency=0.2;



// pulse synth ///////////////////////////////////////

(
~pulse.ar(2);
~pulse.quant=12;
~pulse.fadeTime=4;
~pulse={
    var sig = Pulse.ar(4/(1..12)) * LFPulse.ar(1/(1..12).nthPrime);
    Splay.ar(sig,1,0.25);
};
~pulse.play;
);
~pulse.stop(4);
~pulse.clear;
~pulse.pause;
~pulse.resume;



// karo synth ///////////////////////////////////////

(
~karo.ar(2);
~karo.quant=24;
~karo.fadeTime=0.2;
~karo={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr % pat.size);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
    var sig = [
    SinOsc.ar(50!2),
    LFSaw.ar(50!2),
    WhiteNoise.ar(0.1!2),
    DC.ar(0!2),
    ];
    sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
    //sig = sig * env;
    Splay.ar(sig,0.75,0.5);
};
~karo.play;
);
~karo.stop(4);
~karo.clear;
~karo.pause;
~karo.resume;
