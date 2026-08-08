p=NetProxy.push(s);

  p.makeTempoClock;
);
(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);
p.bpm(43.2*2)

(
  ~tick.kr(1);
  ~tick.clock = p.clock;
  ~tick.quant=4;
  ~tick = { Impulse.kr(~tempo * 4); };
  ~counter = {PulseCount.kr(~tick.kr);};
);    

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
  var mod = 1**Duty.kr(4/~tempo,0,Dseq([1,2,1,1.5,1,1.33333],inf))+1;
  var sig = SinOsc.ar(220 * mod);
  sig = sig * LeakDC.ar(1-(LFSaw.ar(8/(1..8))**LFNoise1.kr(1/4!8).exprange(1.1,8.0)));
  Splay.ar(sig,1,0.5);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
