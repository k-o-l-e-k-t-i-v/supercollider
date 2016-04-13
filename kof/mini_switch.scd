

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=4;
~one={
  var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.25],inf));
  var sig = SinOsc.ar(75/mod,LFNoise2.ar([1400,14000],mul:0.08)+(SinOsc.ar([6000,12000],mul:0.08) *LFPulse.ar(4)));
  sig = sig + SinOsc.ar(500+(1..16),mul:0.01);
  sig = Resonz.ar(sig,SinOsc.ar(200).range(40,9000),0.04)/16+sig/2;
  sig = sig + (RHPF.ar(Dust.ar(4),18000)*8) + Dust.ar(4);
  sig = CombN.ar(sig,1/4,1/4,4);
  sig = CompanderD.ar(sig,3/4,1/6,1/2);
  Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;




(
  p.clock.tempo_(60/60);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);  



// one synth ///////////////////////////////////////

(
~two.ar(2);
~two.quant=2;
~two.fadeTime=0.2;
~two={
  //         |       |       |       |       |  
  var pat = [1,0,1,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = [
    Dust.ar(4000),
    LFNoise2.ar(14000),
    DC.ar(0),
    Blip.ar(4000,16,mul:0.2) * Pulse.ar(4),
    DC.ar(0),
    DC.ar(0),
    SinOsc.ar(4) * Pulse.ar(3),
    DC.ar(0),
    Dust.ar(7500,mul:0.5),
    DC.ar(0),
    SinOsc.ar(40,SinOsc.ar(14000)) * Pulse.ar(4),
    DC.ar(0),
  ];
  sig = CombN.ar(sig,1/4,1/40,2)*LFPulse.ar(20)+sig;
  sig = RHPF.ar(sig,4000)*4;
  sig = CompanderD.ar(sig,3/4,1/2,1/2);
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  //sig = sig * env;
  Splay.ar(sig,0.75,0.025);
};
~two.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**10*100));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
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
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[1.002,1.15],[3,-3],curve:'exp'),imp * hit);
  var sig = Dust.ar(16000);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~hh.play;
);
~hh.stop(4);
~hh.clear;
~hh.pause;
~hh.resume;
