


s.boot;
p.push();
p.bpm(120);


~temp.quant=16;
~temp = {LFNoise2.kr(1/90/60)};

// engine synth ///////////////////////////////////////

(
~engine.ar(2);
~engine.clock = p.clock;
~engine.quant=16;
~engine.fadeTime=30;
~engine={
  var sig = SinOsc.ar(50,Pulse.ar(~tempo/4));
  Splay.ar(sig,0.005,0.0332);
};
~engine.play;
);
~engine.stop(33.3);
~engine.clear;
~engine.pause;
~engine.resume;

(
  //s.latency=0.2;
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
