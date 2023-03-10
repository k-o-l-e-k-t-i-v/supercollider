


p.push();


p.clear


~tempo = {110/60};

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=12;
~one.fadeTime=1;
~one={
    var sig = ~tempo/[1,2,3,4];
    var sig = SinOsc.ar([40,50,60],Pulse.ar(ry))*Pulse.ar(ry);
    sig = CompanderD.ar(sig,1/2,1/2,1);
    sig = GVerb.ar(sig)/8+sig;
    Splay.ar(sig,0.05,0.155);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


// glgl synth ///////////////////////////////////////

(
~glgl.ar(2);
~glgl.quant=24;
~glgl.fadeTime=0.02;
~glgl={
    //  |       |       |       |       |  
    var pat = [
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1,
    ].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3]),imp * hit);
    var sig = SinOsc.ar(40+(env**20*40),env**20*8pi) + LFSaw.ar(40);
    sig = sig * env;
    sig = LPF.ar(sig,LFNoise1.kr(~tempo/24).range(50,1500));
    sig = GVerb.ar(sig)/16+sig;
    Splay.ar(sig,0.05,0.25);
};
~glgl.play;
);
~glgl.stop(500);
~glgl.clear;
~glgl.pause;
~glgl.resume;


(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(120);};});
}.fork;  
)

(
    ~tick.kr(1);
    ~tick.clock = p.clock;
    ~tick.quant=12;
    ~tick = { Impulse.kr(~tempo * 4); };
    ~counter = {PulseCount.kr(~tick.kr);};
);
