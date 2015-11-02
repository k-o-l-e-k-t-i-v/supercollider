



(
  p.clock.tempo_(240/60/1.5);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);




// oaoa synth ///////////////////////////////////////

(
~oaoa.ar(2);
~oaoa.quant=2;
~oaoa.fadeTime=0.2;
~oaoa={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.25],[3,-3],curve:'exp'),imp * hit);
  var sig = LFNoise2.ar(12000/[1,2,4,8]) + BrownNoise.ar(1!8) + WhiteNoise.ar(0.1!8);
  sig = BPF.ar(sig,SinOsc.kr([4,5,6,7]*env).range(-100,100)+(16000/16*[1,2,4,8]),0.1)*4;
  sig = sig * env;
  Splay.ar(sig,0.75,0.45);
};
~oaoa.play;
);
~oaoa.stop(4);
~oaoa.clear;
~oaoa.pause;
~oaoa.resume;


// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(1.001+(env**[4,4.001]*100),SinOsc.ar(43.2*[1,2,1.5,1.3333])*2pi+(env**4*10));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=0.2;
~one={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(15000),
  SinOsc.ar(15000/1.5),
  LFSaw.ar(15000/1.25),
  VarSaw.ar(15000/1.3333),
  ];
  
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = PitchShift.ar(sig,0.25,0.5*1.333);
  sig = sig * env * LFPulse.ar(4*[1,2,4,8]);
  Splay.ar(sig,0.75,0.75);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
