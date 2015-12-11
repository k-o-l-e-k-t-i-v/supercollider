



(
  p.clock.tempo_(120/60);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=2;
~one={
    var sig = SinOsc.ar(LFNoise2.ar(32/[1,2,4,16]).range(500,2500/[1,2.1,1.5234,1.24]));
    sig = CombN.ar(sig,1/4,1/[40,80,160,320]/250+LFNoise2.kr(8!4).range(0.004,0.018),4) * LFNoise2.ar(LFNoise2.kr(8!2).range(1,10)/[1,2,3,4]).range(0.0001,1);
    Splay.ar(sig,0.75,0.1,SinOsc.ar(1/4));
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
