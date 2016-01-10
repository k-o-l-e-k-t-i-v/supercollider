

(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);


(
  p.clock.tempo_(240/60*2);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);

// iii synth ///////////////////////////////////////

(
~iii.ar(2);
~iii.quant=2;
~iii.fadeTime=4;
~iii={
  var mod = Duty.kr(1/4,0,Dseq([1,2,1.5,1.25],inf)).lag(1/4);
  var mod2 = Duty.kr(4,0,Dseq([1,2,1.5,1.25],inf)).lag(1/4);
  var mod3 = Duty.kr(16,0,Dseq([1,2,1.5,1.25],inf)).lag(1/4);
  var sig = AudioIn.ar([0,1]) ;
  sig = Resonz.ar(sig,14000/[1,1.5,1.25,1.333333,4,1,2,4]/mod/mod2/mod3,0.009,mul:LFNoise2.kr(4!8));
  sig = Normalizer.ar(sig);
  sig = sig * LFSaw.ar(8/(1..8)).exprange(0.001,1) ;
  //sig = CombN.ar(sig,1/4,1/2*mod*mod2*mod3,16);
  sig = BPF.ar(sig,16000/16*(1..16),0.2,mul:LFNoise2.kr(1/4!16));
  sig = Normalizer.ar(sig);
  sig = PitchShift.ar(sig,0.1,0.25*[1,2,4,8]);
  sig =  sig * Pulse.ar([4,3,2,1]);
  sig = GVerb.ar(sig,100,10) ;
  Splay.ar(sig,0.95,0.32,SinOsc.kr(2)*4);
};
~iii.play;
);
~iii.stop(4);
~iii.clear;
~iii.pause;
~iii.resume;


s.scope;


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=0.2;
~one={
  //         |       |       |       |       |  
  var pat = [0,0,1,0,1,1,0,1,1,0,1,0,1,1,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,3.5],[3,-3],curve:'exp'),imp * hit);
  var sig = Phasor.ar(40!2+(env**10*100));
  sig = sig * env;
  Splay.ar(sig,0.15,0.95);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
s.freeAll();

// noise synth ///////////////////////////////////////

(
~noise.ar(2);
~noise.quant=2;
~noise.fadeTime=0.2;
~noise={
  //         |       |       |       |       |  
  var pat = [1,1,0,1,1,0,1,1,0,1,1,0,1,1,1,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[2,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = Dust.ar(10000);
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~noise.play;
);
~noise.stop(4);
~noise.clear;
~noise.pause;
~noise.resume;
