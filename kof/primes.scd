(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);
(
  p.clock.tempo_(120/60*4);
  
  ~offset = {(0..7)/8};
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=5.02;
~one={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4].nthPrime,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.25/[1,2,3,4]],[3,-3],curve:'exp'),imp * hit);
  var f = LFSaw.ar(2/[1,2,3/4]).exprange(30.01,22100);
  var rate = 44100/(1..16).nthPrime;
  var t = PulseCount.ar(Impulse.ar(rate),Impulse.ar(rate/f))/rate * f;
  var sig = Perlin3.ar(t[0,1,2],t[3,4,5],t[6,7,8]) ;//* LFTri.ar(4/[1,2,3,4]);
  //sig =Select.ar(LFPulse.ar(1/4/[1,2,3,4])*16, [] ++ Resonz.ar(sig,50*[1,2,4,8],0.12) ++ sig);
  sig = CombN.ar(sig,1/50,1/50,4)+sig;
  sig = CompanderD.ar(sig,3/4,1/2,1/2);
  sig = sig * env;
  Splay.ar(sig,0.05,0.15);
};
~one.play;
);
~one.stop(15);
~one.clear;
~one.pause;
~one.resume;

// kick synth ///////////////////////////////////////

(
~kick2.ar(2);
~kick2.quant=2;
~kick2.fadeTime=4.2;
~kick2={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,(1..24).nthPrime,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.25],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(5.octcps/100*(1..24).nthPrime,env**8*8pi,mul:0.15);
  //sig = sig * LFTri.ar(1/4/(1..100).nthPrime);
  sig  = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~kick2.play;
);
~kick2.stop(4);
~kick2.clear;
~kick.pause;
~kick.resume;

// kick synth ///////////////////////////////////////
(
(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,(1..24).nthPrime*2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2,env**(1..24).nthPrime*8pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);

// hiss synth ///////////////////////////////////////

(
~hiss.ar(2);
~hiss.quant=2;
~hiss.fadeTime=0.2;
~hiss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,(1..24).nthPrime*2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = LFNoise1.ar(21000/(1..24).nthPrime);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~hiss.play;
);
)
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;


PulseCount.help
