

p=ProxySpace.push();


(
    ~tick.kr(1);
    ~tick.clock = p.clock;
    ~tick.quant=24;
    ~tick = { Impulse.kr(~tempo * 4); };
    ~counter = {PulseCount.kr(~tick.kr);};
);		

~tempo={1}

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=8;
~one.fadeTime=0.4;
~one={
    var mel = Duty.kr(4.125/~tempo/[1,2,3,4],0,Dseq([1,2,1.5,1.33333],inf));
    var sig = SinOsc.ar(35!2,Pulse.ar(4.125/[1,2,3,4])) * LFTri.ar(4.125/[1,2,3,4],LFNoise2.kr(1/4!4));
    sig = CombL.ar(sig,1/4.125,[1,mel/440]/4.125,4);
    sig = LeakDC.ar(sig);
    Splay.ar(sig,0.95,0.05);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;



// noises synth ///////////////////////////////////////

(
~noises.ar(2);
    ~noises.quant=8;
~noises.fadeTime=0.2;
~noises={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr % pat.size);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5*[1,2,3,4]],[3,-3],curve:'exp'),imp * hit)};
    var sig = [
    WhiteNoise.ar(0.1!2),
        LFSaw.ar(35!2,mul:0.2),
        BrownNoise.ar(0.2),
        PinkNoise.ar(0.15)
    ];
    sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
    sig = sig * env;
    sig = CombL.ar(sig,1/4.125,1/4.125,1/4);
    sig = LeakDC.ar(sig);
     Splay.ar(sig,0.75,0.25);
};
~noises.play;
);
~noises.stop(4);
~noises.clear;
~noises.pause;
~noises.resume;


(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
)
