
p.push();


~tempo = {110/60}

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=24;
~one.fadeTime=4;
~one={
    var sig = SinOsc.ar(50!2);
    Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


// karousel synth ///////////////////////////////////////

(
~karousel.ar(2);
~karousel.quant=12;
~karousel.fadeTime=0.2;
~karousel={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(0);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr % pat.size);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
    var sig = [
    SinOsc.ar(50!2),
    HPF.ar(WhiteNoise.ar(0.1),5000),
    SinOsc.ar(60!2),
    LPF.ar(WhiteNoise.ar(0.1),5000),
    ];
    sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
    //sig = sig * env;
    Splay.ar(sig,0.75,0.005);
};
~karousel.play;
);
~karousel.stop(4);
~karousel.clear;
~karousel.pause;
~karousel.resume;


(
    //s.latency=0.2;
    //p.clock.tempo_(120/60);
    p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
    ~tick.kr(1);
    ~tick.quant = 12;
    ~counter.quant = 12;
    ~counter = {PulseCount.kr(~tick.kr);};
    ~tick = { Impulse.kr( ~tempo * 4 ); };
);
