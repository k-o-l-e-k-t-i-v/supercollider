


(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);


(
  p.clock.tempo_(140/60*2);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
  ~time = {LFSaw.kr(~tempo/4).range(0,1)};
)


// kick synth ///////////////////////////////////////

(
~kick.quant=4;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.0],[3,-3],curve:'exp'),imp * hit);
  var sig = Mix.fill(16,{|i| SinOsc.ar(50+i+(env**(50+i)*500),i,mul:0.95).tanh + BrownNoise.ar(env**5/16)});
  sig = sig * env;
  sig = CompanderD.ar(sig,3/4,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.5);
};
~kick.play;
);
~kick.stop(7);
~kick.clear;


// hh synth ///////////////////////////////////////

(
~hh.quant=4;
~hh.fadeTime=0.2;
~hh={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = WhiteNoise.ar(1);
  sig = RHPF.ar(sig,[12000,3000]+(env**5*5400),0.4);
  sig = sig * env;
  sig = CompanderD.ar(sig,3/4,1/2,1/2);
  Splay.ar(sig,0.75,0.5);
};
~hh.play;
);
~hh.stop(7);
~hh.clear;
