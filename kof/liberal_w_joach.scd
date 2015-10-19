Kolektiv(\kof);
Kolektiv.tempo(8/3);

(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);

(
  p.clock.tempo_(8/3);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);


// mel synth ///////////////////////////////////////

(
~mel.ar(2);
~mel.quant=2;
~mel.fadeTime=4.2;
~mel={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4,5,6,7,8]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5]/4,[3,-3],curve:'exp'),imp * hit);
  var sig = LFSaw.ar(60.midicps*16/([1,1.125,1.5,2,4,1.125].scramble*2pi),SinOsc.ar(1/4/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.15,0.25);
};
~mel.play;
);
~mel.stop(4);
~mel.clear;
~mel.pause;
~mel.resume;


// ss synth ///////////////////////////////////////

(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..8)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000/1.5),
    LFSaw.ar(4000*1.125),
    LFNoise2.ar(4000*4),
    Pulse.ar(40)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  //sig = CombN.ar(sig,1/40,1/40,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);
~ss.stop(10);
~ss.clear;
~ss.pause;
~ss.resume;

// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,1,0,0,1,0,0,0,1,1,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**10*100));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
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
~hh.fadeTime=1.2;
~hh={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = LFNoise2.ar(5000*[1,2,4,8]);
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~hh.play;
);
~hh.stop(4);
~hh.clear;
~hh.pause;
~hh.resume;
