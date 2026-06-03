s.boot;
p.push();
~tempo={1.2}
p = ProxySpace.push(s);
p=NetProxy()
p.push();
p.bpm(72)
(
~globalScopeListener.clear;
~globalScopeListener.ar(2);
~globalScopeListener = {
    var masterOuts = In.ar(0, 2);
    XYScope.ar(masterOuts[0], masterOuts[1]);
    0.0;
};
~globalScopeListener.play(to:\\end);
)
p.push();
(
    ~tick.kr(1);
    ~tick.clock = p.clock;
    ~tick.quant=4;
    ~tick = { Impulse.kr(~tempo * 4); };
    ~counter = {PulseCount.kr(~tick.kr);};
)

// sw synth ///////////////////////////////////////

(
~sw.ar(3);
~sw.quant=4;
~sw.fadeTime=0.2;
~sw={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,2,~counter.kr % pat.size);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.02,0.5],[3,-3],curve:'exp'),imp * hit);
    var sig = [
    SinOsc.ar([50,600]),
    WhiteNoise.ar(0.4!2),
    Pulse.ar([4,10]),
    LFSaw.ar(16/[1,2,3]),
    LFCub.ar([55,110]),
    Pulse.ar([7,11]),
    LFPulse.ar([50,60]),
    PinkNoise.ar(0.5!2),
    ];
    sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
    //sig = sig * env;
    sig = CompanderD.ar(sig,3/4,1/2,1);
    Splay.ar(sig,1,0.95,SinOsc.kr(1/8));
};
//~sw.play;
);
~sw.stop(4);
~sw.clear;
~sw.pause;
~sw.resume;
// perlin synth ///////////////////////////////////////

(
~perlin.ar(2);
~perlin.quant=4;
~perlin.fadeTime=2;
~perlin={
    var sig = Perlin3.ar(~sw.ar[0],~sw.ar[1],~sw.ar);
    sig = LeakDC.ar(sig);
    sig = LPF.ar(sig,18000);
    sig = CombL.ar(sig,~sw.kr/55,~sw.ar/55+0.1,1);
    //sig = FreeVerb.ar(sig)+sig;
    sig = CompanderD.ar(sig,1,3/4,1);
    Splay.ar(sig,1,0.5,SinOsc.kr(1/7));
};
~perlin.play;
);
~perlin.stop(4);
~perlin.clear;
~perlin.pause;
~perlin.resume;


