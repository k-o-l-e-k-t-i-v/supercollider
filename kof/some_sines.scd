


// saw synth ///////////////////////////////////////

(
~saw.ar(2);
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var mod = Duty.kr((1..4),0,Dseq([1,2,1.5,1.25],inf));
  var sig = SinOsc.ar(1432/([1,2,4,8]*0.5pi/mod)+SinOsc.kr(1/4/(1..8),mul:2pi),mul:0.4);
  sig = LPF.ar(sig,4340) * LFTri.ar(1/(1..4)).exprange(0.001,1);
  sig = CompanderD.ar(sig,3/4,1/1.5,1/1.5);
  //sig = BBandPass.ar(sig,12000/12*(1..12),0.42,mul:LFNoise2.kr(1!12));
  sig = GVerb.ar(sig,90,100,0.075,0.15,99,0.5);
  sig = DelayN.ar(sig,1/1000,1/1000/(1..16)*LFNoise2.kr(1!16))+sig;
  sig = CompanderD.ar(sig,3/4,1/3,1/2);
  sig = Limiter.ar(sig.softclip);
  Splay.ar(sig,0.95,0.25,SinOsc.kr([3,4]));
};
~saw.play;
);
~saw.stop(4);
~saw.clear;
~saw.pause;
~saw.resume;


