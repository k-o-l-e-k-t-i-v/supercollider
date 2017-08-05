




s.reboot;

p.push();

// bang synth ///////////////////////////////////////


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

Tdef(\mel).quant = 4;
Tdef(\mel,{loop{~voice.rebuild;8.wait;}}).play;

(
~voice.ar(2);
~voice.clock = p.clock;
~voice.quant=2;
~voice.fadeTime=2;
~voice={
  var sig = SinOsc.ar(432/{[1,1.5,1.33333,1.66666,1.125,2,4,8].choose}!3+((1..100)*0.01),SinOsc.ar(432/(1..100)/16)*2.5pi) ** SinOsc.ar(1/64/(1..100)).range(0.1,4.9);
  sig = LPF.ar(sig,432*LFNoise2.kr(~tempo/4).range(1,8));
  Splay.ar(sig,0.5,0.5);
};
~voice.play;
);
~voice.stop(4);
~voice.clear;
~voice.pause;
~voice.resume;



// lah synth ///////////////////////////////////////

(
~lah.ar(2);
~lah.clock = p.clock;
~lah.quant=2;
~lah.fadeTime=4;
~lah={
  var sig = SinOsc.ar(50!2);
  Splay.ar(sig,0.5,0.25);
};
~lah.play;
);
~lah.stop(4);
~lah.clear;
~lah.pause;
~lah.resume;
