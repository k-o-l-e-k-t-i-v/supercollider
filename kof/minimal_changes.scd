

(
~prln.quant=2;
~prln.fadeTime=3.0;
~prln={Mix.ar(Perlin3.ar(LFTri.ar(1/800),LFTri.ar(1/80),LFTri.ar(50)))};
)

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=10.2;
~one={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[2,8],~counter.kr % pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15*[1,2,4,10]],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(50!2),
  SinOsc.ar(500!2+SinOsc.kr(1/3,mul:10),mul:0.1),
  SinOsc.ar(2.octcps/[1,2,1.5,1.3333],mul:0.5),
  SinOsc.ar(750,2),
  SinOsc.ar(15000,mul:0.1),
  LFNoise2.ar(1400),
  LFSaw.ar(3.octcps,mul:0.4),
  Crackle.ar(1+~prln.ar),
  LFPulse.ar(5000),
  SinOsc.ar(50!2,3),
  ];
  sig = sig.scramble;
  sig = SelectX.ar(~prln.ar*sig.size,sig);
  sig = LPF.ar(sig,400) + HPF.ar(sig,16000);
  sig = sig * env + LPF.ar(sig,90,mul:0.015);
  sig = CompanderD.ar(sig,3/4,1/2,1/2);
  Splay.ar(sig,0.25,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


(
  p.clock.tempo_(240/60);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);

// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=2.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2 + (env**40*400));
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;
