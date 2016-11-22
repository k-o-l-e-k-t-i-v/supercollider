p = NetProxy.connect();
p.bpm;
p.metro(4);
p.restartClock;
p.bpm(127);

(
  ~tick.kr(1);
  ~tick.clock = p.clock;
  ~tick.quant=1;
  ~tick = { Impulse.kr(~tempo * 4); };
  ~counter = {PulseCount.kr(~tick.kr);};
);    

(
  s.latency=0;
  //p.clock.tempo_(120/60);
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
  ~tick.kr(1);
  ~tick.clock = p.clock;
  ~tick.quant=4;
  ~counter.clock = p.clock;
  ~counter.quant = 4;
  ~counter = {PulseCount.kr(~tick.kr);};
  ~tick = { Impulse.kr(~tempo*4); };
);

(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
)
