



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
~one.fadeTime=4;
~one={
    var sig = SinOsc.ar(LFNoise2.ar(3000/[1,2,4,16]).range(200,4000/[1,2,4,8]));
    sig = CombN.ar(sig,1/4,1/[40,80,160,320]+LFNoise2.kr(4).range(0.001,0.01),4) * LFSaw.ar(4/[1,2,3,4]).exprange(0.001,1);
    Splay.ar(sig,1,~n1,SinOsc.ar(1/4));
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
