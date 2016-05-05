

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
~kick.fadeTime=4.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[1/4,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50*8/[1,1.5,1.3333,4],env**(40/[1,2,10,200])*8pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;


// kick2 synth ///////////////////////////////////////

(
~kick2.ar(2);
~kick2.quant=2;
~kick2.fadeTime=0.2;
~kick2={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2,env**20*8pi);
  sig = sig * env;
  Splay.ar(sig,0.05,0.75);
};
~kick2.play;
);
~kick2.stop(4);
~kick2.clear;
~kick2.pause;
~kick2.resume;
