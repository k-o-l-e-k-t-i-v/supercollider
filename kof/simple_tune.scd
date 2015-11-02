

(
  p.clock.tempo_(240/60);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=4;
~one={
  var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.25],inf)) ;
  var sig = VarSaw.ar(4320/([1,1.5,1.333,1.25,2,3]*pi)/mod + SinOsc.ar(4/[1,2,3,4]).range(-4,4)+((1..16)/160)) * LFTri.ar(~tempo.kr/[1,2,3,4]/4).exprange(0.001,1);
  sig = LPF.ar(sig,LFNoise2.kr(4/[1,2,3,4]).range(800,10000));
  sig = AllpassN.ar(sig,1/2,1/2,4);
  Splay.ar(sig,0.5,0.05);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;



// ss synth ///////////////////////////////////////

(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,16,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var mod = Select.kr(PulseCount.kr(imp*hit)/16%4,[1,2,1.25,1.3333]);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.15],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(4320/([1,1.5,1.333,1.25]*pi)/mod,env);
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env * SinOsc.ar([1,2,3,4]);
  sig = AllpassN.ar(sig,1/2,1/2,4);
  Splay.ar(sig,0.75,0.25);
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
  var pat = [1,0,0,0,1,0,0,0,0,0,0,0,1,1,1,1].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(43.2*0.5pi/[1.25,1.33,1.5,1]+(env**100*100));
  sig = sig * env;
  Splay.ar(sig,0.25,0.5);
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
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([0.1,0.2,0.4,0.7]+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~hh.play;
);
~hh.stop(4);
~hh.clear;
~hh.pause;
~hh.resume;
