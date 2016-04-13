



(
  p.clock.tempo_(120/60);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);


// ss synth ///////////////////////////////////////

(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=12;
~ss={
  var sig = Formant.ar(43.2/16*{(1..8).choose}!3,4320,432+(1..8).reciprocal) / (1..8);
  sig = Resonz.ar(sig,432/[1,1.5,2,4]/1.5,0.2)*4+sig;
  sig = sig * LFTri.ar(4) * SinOsc.ar(40);
  sig = CompanderD.ar(sig,1/2,1/2,1);
  sig = LPF.ar(GVerb.ar(sig/8,100,30),2900);
  Splay.ar(sig,0.85,0.25);
};
~ss.play;
);
~ss.stop(4);
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
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[4,3,2,1],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[-8,3],curve:'exp'),imp * hit);
  var sig = LFPar.ar(40+(env**20*150));
  sig = sig * env;
  Splay.ar(sig,0.015,0.5);
};
~kick.play;
);
~kick.stop(12);
~kick.clear;
~kick.pause;
~kick.resume;
