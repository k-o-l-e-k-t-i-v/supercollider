
(
  p=ProxySpace.push(s.reboot);
);


(
  var tempo = 2/3;
  var offset = (0..7)/8;
  t = TempoClock.new(tempo);
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( tempo / 2 , offset ))};
  
  offset = (0..7)+0.5/8;
  ~tick2.quant = 1;
  ~tick2 = {Mix(Impulse.kr( tempo / 2 , offset ))};
  ~counter = {PulseCount.kr(~tick.kr)};
  ~time = {LFSaw.kr(tempo/4).range(0,1)};
)



// bag synth ///////////////////////////////////////

(
~bag.quant=1;
~bag.fadeTime=0.02;
~bag={
  var imp = PulseDivider.kr(~tick.kr,[1,16,32],~counter.kr);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.75*[1,2,4]],[3,-5]),imp);
  var sig = LFSaw.ar(50*[1,2,4]+(env**10*400*[1,1.5,2]),LFNoise2.kr(50!3)*2pi*env.distort);
  sig = RLPF.ar(sig,80+LFNoise2.kr(4!4).range(1,12000))+sig;
  sig = sig * env.distort;
  Splay.ar(sig,0.75,0.5);
};
~bag.play;
);
~bag.stop(7);
~bag.clear;



// hh synth ///////////////////////////////////////

(
~hh.quant=1;
~hh.fadeTime=0.02;
~hh={
  var imp = PulseDivider.kr(~tick2.kr,[1,2,3,4],~counter.kr);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15/(1..4)],[3,-3]),imp);
  var sig = WhiteNoise.ar(1!4);
  sig = RHPF.ar(sig,LFNoise2.kr(1/4!4).range(1000,12000)*env.distort+100);
  sig = sig * env;
  Splay.ar(sig,0.25,0.5);
};
//      e.addMix(~hh,postVol:true);
~hh.play;
);
~hh.stop(7);
~hh.clear;


// filter synth ///////////////////////////////////////

(
~filter.quant=1;
~filter.fadeTime=0.02;
~filter={
  var sig = ~bag + ~hh + BrownNoise.ar(0.1!2);
  sig = GVerb.ar(HPF.ar(sig,800),40,spread:90,drylevel:0.6) + LPF.ar(sig,800);
  Splay.ar(sig.flat,0.25,0.5);
};
//      e.addMix(~filter,postVol:true);
~filter.play;
);
~filter.stop(7);
~filter.clear;
