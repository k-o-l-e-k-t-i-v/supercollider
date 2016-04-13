



(
  p.clock.tempo_(120/60);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);



// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0,1,0,0,0,1,0,0,0,1,1,0,0,1,0,1,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[4,4,2,1],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.00001,0.99,0.00001],[0.002,1.75],[10,-4],curve:'exp'),imp * hit);
  var sig = SinOsc.ar([44,45,46,47]+(env**20*1000),-pi,mul:env**0.95) + PinkNoise.ar((env**4)!2);
  sig = LPF.ar(sig,LFNoise2.kr(1/4!4).range(1,10000)*(env**2)+200);
  sig = sig * env;
  sig = CompanderD.ar(sig,3/4,1/2,1/2,0.01,0.1);
  Splay.ar(sig,0.15,0.25);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;



// hh synth ///////////////////////////////////////

(
~hh.ar(2);
~hh.quant=2;
~hh.fadeTime=0.2;
~hh={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0,1,0,0,0,1,0,0,0,1,1,0,0,1,0,1,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[2,2,1,1],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.01,1,0.0001],[0.005,0.25],[6,-3],curve:'exp'),imp * hit);
  var sig = LFNoise1.ar(16000/[1,4,8,16]) * Crackle.ar([0.1,0.7,0.4,0.6]+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~hh.play;
);
~hh.stop(4);
~hh.clear;
~hh.pause;
~hh.resume;


