




// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.clock = p.clock;
~kick.quant=2;
~kick.fadeTime=4;
~kick={
  var sig = SinOsc.ar(50!2) * ~kicker.ar;
  Splay.ar(sig,0.5,0.25);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;


p.makeTempoClock;
(
  TempoClock.default = p.clock;
  p.clock.tempo_(127/60);
  p.arProxyNames.do(p[_.asSymbol].rebuild);
)

(
  ~tick.kr(1);
  ~tick.clock = p.clock;
  ~tick.quant=1;
  ~tick = { Impulse.kr(~tempo * 4); };
  ~counter = {PulseCount.kr(~tick.kr);};
);    

// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.clock = p.clock;
~kick.quant=[2,0];
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,1,
    1,0,0,0,1,0,0,0,1,0,1,0,1,0,0,0,1,0,1,0,1,0,0,0,1,0,0,0,1,0,0,0,
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0,1,0,0,0,1,0,0,0,1,0,1,1,
    1,0,0,0,1,0,0,0,1,0,1,0,1,0,0,0,1,0,1,0,1,0,0,0,1,1,1,1,1,1,1,1,
  ];
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.05*[1,2,4,20]],[40,-3]),imp * hit);
  var sig = WhiteNoise.ar(0.7!2);
  sig = Resonz.ar(sig,env**7*18000+1000,0.96);
  sig = sig * env;
  Splay.ar(sig,0.05,0.5);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;
