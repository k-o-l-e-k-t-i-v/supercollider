
(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);


(
  p.clock.tempo_(2/3);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);


// switch synth ///////////////////////////////////////

(
~switch.ar(2);
~switch.quant=2;
~switch.fadeTime=0.2;
~switch={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,0.25,1,0.001],[0.002,0.5,0.002],[3,3,-3],curve:'exp'),imp * hit);
  var sig = [
    Pulse.ar(8),
    SinOsc.ar(15000) * Pulse.ar(4),
    SinOsc.ar(SinOsc.ar(40).range(100,16000),mul:0.1),
    LFSaw.ar(15000,mul:0.1) * Pulse.ar(8),
    DC.ar(0)
  ];
  sig = Select.ar(PulseCount.kr(hit * imp)%4,sig);
  sig = sig * env;
  Splay.ar(sig,0.15,0.65);
};
~switch.play;
);
~switch.stop(10);
~switch.pause;
~switch.resume;


// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(43.2*1.25+(env**100*100));
  sig = sig * env;
  sig
};
~kick.play;
);
~kick.stop(4);
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
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,0.25,1,0.001],[0.02,0.15,0.02],[3,3,-3],curve:'exp'),imp * hit);
  var sig = [] ++ LFNoise2.ar(16000) ++ WhiteNoise.ar(0.5) ++ BrownNoise.ar(0.5) ++ SinOsc.ar(4000,mul:0.1);
  sig = LPF.ar(sig,4320*[1,2,3,4]);
  sig = sig * env;
  Splay.ar(sig,0.15,0.15);
};
~hh.play;
);
~hh.stop(4);
~hh.pause;
~hh.resume;

(
~voice.quant=2;
~voice.fadeTime=5;
~voice.play;
~voice={SinOsc.ar(43.2*8pi/[1,1.5,1.25,1.125]+SinOsc.ar(4/fib(8)).range(-pi,pi),SinOsc.kr(1/8/fib(8)).range(-pi,pi)) * LFSaw.ar(~tempo/8/fib(8)).exprange(0.00001,0.5)};
)
  ~voice.stop(8);

// ss synth ///////////////////////////////////////

(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.0002,0.05,0.0002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
    LFSaw.ar(4320),
    SinOsc.ar(4320),
    Pulse.ar(4320/2),
    LFNoise2.ar(10000),
    LFPar.ar(432*2)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~ss.play;
);
~ss.stop(10);
~ss.clear;
~ss.pause;
~ss.resume;


// long synth ///////////////////////////////////////

(
~long.ar(2);
~long.quant=2;
~long.fadeTime=0.2;
~long={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.502,2.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(43.2*pi/[1,1.5,1.25,2]+SinOsc.ar(4/[1,2,3,4]).range(-4,4),SinOsc.ar(43.2/2).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~long.play;
);
~long.stop(4);
~long.clear;
~long.pause;
~long.resume;


// laggy synth ///////////////////////////////////////

(
~laggy.ar(2);
~laggy.quant=2;
~laggy.fadeTime=0.2;
~laggy={
  //         |       |       |       |       |  
  var pat = [0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,0.1,1,0.001],[0.002,4,0.0002],[3,6,-3],curve:'exp'),imp * hit);
  var sig = [
    Pulse.ar(43.2)*Pulse.ar(4.32),
    SinOsc.ar(432*8),
    LFSaw.ar(4320*3) * Pulse.ar(LFSaw.ar(4).range(1,432)),
    VarSaw.ar(4320/1.5)
  ];
  sig = PitchShift.ar(sig,0.01,1+(1..16).reciprocal);
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~laggy.play;
);
~laggy.stop(4);
~laggy.clear;
~laggy.pause;
~laggy.resume;

// karma synth ///////////////////////////////////////

(
~karma.ar(2);
~karma.quant=2;
~karma.fadeTime=0.2;
~karma={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,16,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[4.002,0.05],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(432.0*0.5pi/(1+(1..4).reciprocal),SinOsc.ar(4).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~karma.play;
);
~karma.stop(4);
~karma.clear;
~karma.pause;
~karma.resume;
