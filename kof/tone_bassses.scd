


(
  p.clock.tempo_(4/3);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);







// pulsar synth ///////////////////////////////////////

(
~pulsar.ar(2);
~pulsar.quant=2;
~pulsar.fadeTime=4;
~pulsar={
  var sig = LFPulse.ar(40*[1,2,1.5,1.333]).lag(0.0001);
  sig = SinOsc.ar(sig.range(43.2,43.2*32)/[1.5,1.25,2,1.3333]);
  sig = sig * LFSaw.ar(~tempo.kr/16/fib(4)).exprange(0.001,1) ;
  Splay.ar(sig,0.5,0.25);
};
~pulsar.play;
);
~pulsar.stop(4);
~pulsar.clear;
~pulsar.pause;
~pulsar.resume;


// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(43.2*1.5+(env**10*100));
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
~hh.fadeTime=0.2;
~hh={
  //         |       |       |       |       |  
  var pat = [1,0,1,0,1,0,1,0,1,0,1,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,5]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.25/[1,2,3,4]],[3,-3],curve:'exp'),imp * hit);
  var sig = LFNoise1.ar(16000/([1,1.5,1.25,1.3333]*pi));
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~hh.play;
);
~hh.stop(4);
~hh.clear;
~hh.pause;
~hh.resume;

// bass synth ///////////////////////////////////////

(
~bass.ar(2);
~bass.quant=2;
~bass.fadeTime=4;
~bass={
  var sig = SinOsc.ar(4320/1.5/(1.5pi*[1,1.5,1.25,1.3333]),SinOsc.ar(4.32/[1,1.5,1.25,1.333]).range(-pi,pi));
  sig = sig * LFTri.ar(~tempo.kr/fib(8)/8).exprange(0.00001,1);
  Splay.ar(sig,0.5,0.5);
};
~bass.play;
);
~bass.stop(4);
~bass.clear;
~bass.pause;
~bass.resume;
