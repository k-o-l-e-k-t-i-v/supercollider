




(
  p.clock.tempo_(240/60);

  ~offset = (0..7)/8;

  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

  ~counter = {PulseCount.kr(~tick.kr)};
);


(
  ~x={
    var sig = WhiteNoise.ar(1!16);
    sig = Resonz.ar(sig,16000/16*(1..16),1/(1..16),mul:LFNoise1.kr(8/(1*(1..16))));
    sig = LeakDC.ar(sig) * Pulse.ar(LFNoise2.kr(4!16).range(1/40,4));
    sig = DelayN.ar(sig,1/(1..16),1/(1..16));
    Splay.ar(sig.flat,0.75,0.015);
  };
  ~x.play;
)
~x.stop(7)
