

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
  var f = 432.0/([1,2,4,1.5,4/3,1.25].scramble*[0.5,0.25]*pi)/([1,2,1.5,4/3,4].choose);
  var sig = SinOsc.ar(f,[0,pi]) + LFSaw.ar(f,[0,1]) + Pulse.ar(f) + BrownNoise.ar(0.6);
  sig = sig * LFTri.ar(1/fib(16)).exprange(0.001,1);
  sig = Resonz.ar(sig,f+SinOsc.kr(f/10.001/fib(16).scramble).range(f/1.025,f*1.025),0.005+LFNoise2.kr(1/4!16).exprange(0.001,0.5))*4;
  sig = CombN.ar(sig,1,1.001,4)/4+sig;
  sig = AllpassN.ar(sig,1.1,[2,2.01],4)/4 + sig;
  sig = CompanderD.ar(sig,3/4,1/2,1/2);
  Splay.ar(sig,0.5,0.05);
};
~one.play;
~reb={loop{~one.rebuild;16.wait;}}.fork;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;





