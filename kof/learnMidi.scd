(
  p.clock.tempo_(128/60/2);

  ~offset = (0..7)/8;

  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

  ~counter = {PulseCount.kr(~tick.kr)};
);



(
  c=CCResponder({ |src,chan,num,value|
    [src,chan,num,value].postln;
    p.clock.tempo_(value);
  }
);
c.learn;
)

