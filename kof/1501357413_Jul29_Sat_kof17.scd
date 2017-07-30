

p.bpm(76);

p.push();
// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=4;
~one.fadeTime=4;
~one={
  var sig = Pulse.ar(~tempo*[4,1.5,2]) * ToggleFF.ar(Impulse.ar(~tempo/16/(1..4)));
  Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

(
~two.ar(2);
~two.clock = p.clock;
~two.quant=[4,1];
~two.fadeTime=4;
~two={
  var sig = Pulse.ar(~tempo*[4,1.5,2]) * WhiteNoise.ar(0.1!3) * ToggleFF.ar(Impulse.ar(~tempo/16/(1..4)));
  Splay.ar(sig,0.5,0.25);
};
~two.play;
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;


(
  s.latency=0.2;
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
