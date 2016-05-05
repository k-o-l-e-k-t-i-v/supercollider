
(
  p.clock.tempo_(120/60*2);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=0.2;
~one={
  var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.25],inf));
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[2,3,4,7],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.0002,0.75*[1,2,3,4]],[30,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(100/[1,2,1.5,1.3333]/mod,env**(400/[1,2,40,80])*8pi);
  sig = Resonz.ar(sig,1000*[1,1.5,4,8]/mod,0.4)*16;
  sig = sig * env;
  Splay.ar(sig,0.15,0.75);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


// two synth ///////////////////////////////////////

(
~two.ar(2);
~two.quant=2;
~two.fadeTime=0.2;
~two={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2,env**20*8pi);
  sig = sig * env;
  Splay.ar(sig,0.25,0.95);
};
~two.play;
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;


// hiss synth ///////////////////////////////////////

(
~hiss.ar(2);
~hiss.quant=2;
~hiss.fadeTime=0.2;
~hiss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[2,3,4,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,30],curve:'exp'),imp * hit);
  var sig = WhiteNoise.ar(env**[1,2,3,4]);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;


// one synth ///////////////////////////////////////

(
~four.ar(2);
~four.quant=2;
~four.fadeTime=0.2;
~four={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[4,5,6,7],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(100/[1,2,1.3333,1.5],Pulse.ar(1/[1,2,3,4]));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~four.play;
);
~four.stop(4);
~four.clear;
~four.pause;
~four.resume;
