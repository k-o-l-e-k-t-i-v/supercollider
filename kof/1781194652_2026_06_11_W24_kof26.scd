s.boot;
p=ProxySpace.push();



~tempo={72*2/60}

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
~one.fadeTime=0.02;
~one={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,1,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[12,-3]),imp * hit);
  var sig = SinOsc.ar(50!2, env * 2pi) + BrownNoise.ar(env**10);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
