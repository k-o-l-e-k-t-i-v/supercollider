
(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);


// dingle synth ///////////////////////////////////////

(
~dingle.ar(2);
~dingle.quant=2;
~dingle.fadeTime=4;
~dingle={
  |
  min = 0,
  max = 1000,
  temp = 4,
  tune = 250
  |
//V
  var mod = Duty.kr(temp,0,Dseq([1,2,1.33333,4],inf));
  var f = LFNoise0.ar(temp/(1..8)).range(min,max).round(tune)/mod;
  var sig = SinOsc.ar(f,mul:f.linexp(min,max,0.7,0.001)) / 2 * Pulse.ar(temp/(1..8))/4;
  sig = CompanderD.ar(sig,3/4,1/2,1/2);
  sig = DWGReverb.ar(LPF.ar(sig,2000),4000)/8+sig;
  sig = CompanderD.ar(sig,3/4,1/2,1/2,0.003);
  Splay.ar(sig,0.75,0.125,SinOsc.kr(temp/4)*2pi);
};
~dingle.play;
);
~dingle.stop(4);
~dingle.clear;
~dingle.pause;
~dingle.resume;


