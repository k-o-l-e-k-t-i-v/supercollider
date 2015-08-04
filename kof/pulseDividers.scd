




(
  p=ProxySpace.push(s.reboot);
  e=ProxySubmix.new(\filter);
);



(
  var tempo = 1/3/4;
  var offset = (0..7)/8;
  t = TempoClock.new(tempo);
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( tempo / 2 , offset ))};
  
  offset = (0..7)+0.5/8;
  ~tick_2.quant = 1;
  ~tick_2 = {Mix(Impulse.kr( tempo / 2 , offset ))};
)




// synth1 synth ///////////////////////////////////////

(
~synth1.quant=1;
~synth1.fadeTime=0.02;
~synth1={
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.75],[3,-6]),~tick.kr);
  var env2 = EnvGen.ar(Env([0.001,1,0.001],[2.002*[1,2,4],0.015],[3,-6]),PulseDivider.kr(~tick_2.kr,[2,4,8]));
  var env3 = EnvGen.ar(Env([0.001,1,0.001],[1.0,10.0],[3,-6]),PulseDivider.kr(~tick.kr,[16,32,64]));
  var sig = SinOsc.ar(70+(env**TExpRand.kr(8.002,80,~tick.kr)*800));

  sig = sig * env;
 
  sig = sig + (Resonz.ar(WhiteNoise.ar(env2**2),env.exprange(10000.01,100)));
  sig = sig + (SinOsc.ar(8000*[1,1.125,1.25],mul:0.08) * env3 * LFPulse.ar(10));

  sig = LPF.ar(sig,800) + (GVerb.ar(HPF.ar(sig,800),40)/8);
  sig = CompanderD.ar(sig,3/4,1/4,1/2);

  Splay.ar(sig.flat,0.25,0.5);
};
~synth1.play;
);
~synth1.stop(7);
~synth1.clear;
