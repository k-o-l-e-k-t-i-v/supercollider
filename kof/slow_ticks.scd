


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
  ~time = {LFSaw.ar(tempo*4).range(0,1)};
)




// dusts synth ///////////////////////////////////////

(
~dusts.quant=1;
~dusts.fadeTime=4.02;
~dusts={
  var imp = PulseDivider.kr(~tick.kr,16*[1,2,4],~counter.kr);
  var env = EnvGen.ar(Env([0.001,1,0.001],[3.002,3.05],[3,-6]),imp);
  var sig = Dust.ar(200*env);
  sig = RLPF.ar(sig*100,[80,800,1200]);
  sig = sig * env;
  sig = Limiter.ar(sig);
  sig = GVerb.ar(HPF.ar(sig,800),80)/2 + LPF.ar(sig,800);
  Splay.ar(sig.flat,0.75,0.25);
};
~dusts.play;
);
~dusts.stop(7);
~dusts.clear;


// pulse synth ///////////////////////////////////////

(
~pulse.quant=1;
~pulse.fadeTime=0.02;
~pulse={
  var imp = PulseDivider.kr(~tick.kr,16,~counter.kr);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3]),imp);
  var sig = SinOsc.ar(44*(env**0.01+1)+(env**100*1000)) * ToggleFF.kr(imp);
  sig = Resonz.ar(sig,LFNoise2.kr(1!2).range(44,90),0.2)*4+sig ;
  sig = Limiter.ar(sig);
  Splay.ar(sig,0.25,0.25);
};
~pulse.play;
);
~pulse.stop(7);
~pulse.clear;


// hh synth ///////////////////////////////////////

(
~hh.quant=1;
~hh.fadeTime=0.02;
~hh={
  var imp = PulseDivider.kr(~tick.kr,fib(8,1,2),~counter.kr);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.35],[3,-6]),imp);
  var sig = WhiteNoise.ar(1!4);
  sig = HPF.ar(sig,LFNoise2.kr(4!4).range(100,18000));
  sig = sig * env;
  sig = GVerb.ar(HPF.ar(sig,800),80)/2 + LPF.ar(sig,800);
  Splay.ar(sig.flat,0.25,0.5);
};
~hh.play;
);
~hh.stop(7);
~hh.clear;


