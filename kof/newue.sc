
p.push();

(
  s.latency=0.4;
  //p.clock.tempo_(120/60);
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
  ~tick.kr(1);
  ~tick.clock = p.clock;
  ~tick.quant = 16;
  ~counter.clock = p.clock;
  ~counter.quant = 16;
  ~counter = {PulseCount.kr(~tick.kr);};
  ~tick = { Impulse.kr( ~tempo * 4 ); };
);



// pulse synth ///////////////////////////////////////

(
~pulse.ar(2);
~pulse.clock = p.clock;
~pulse.quant=2;
~pulse.fadeTime=4;
~pulse={
  var sig =  Pulse.ar(4);
  Splay.ar(sig,0.5,0.25);
};
~pulse.play;
);
~pulse.stop(4);
~pulse.clear;
~pulse.pause;
~pulse.resume;
