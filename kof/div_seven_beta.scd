

p.push;
p.bpm(70);


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

// seventh_wave synth ///////////////////////////////////////

(
~seventh_wave.ar(2);
~seventh_wave.clock = p.clock;
~seventh_wave.quant=7;
~seventh_wave.fadeTime=0.777;
~seventh_wave={
  var note = {((1..100)/7).choose}!7 * [70].midicps;
  var puls = Pulse.ar(~tempo*((1..7)/7));
  var sig = SinOsc.ar(note,mul:SinOsc.kr(~tempo/(1..3)/7));
  Splay.ar(sig,0.5,0.35);
};
~seventh_wave.play;
);
~seventh_wave.stop(4);
~seventh_wave.clear;
~seventh_wave.pause;
~seventh_wave.resume;



(
  p.clock.sched(p.clock.timeToNextBeat(1 * 7),{ 
    Tdef(\th7,{loop{ ~seventh_wave.rebuild; (70/60).wait;  }});
    Tdef(\th7).play;
  });
);
