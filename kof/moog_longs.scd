

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=10;
~one={
  var f = 22000.0/[1.3333,1.5,2,8].scramble/([20,100,133.33,1500].scramble/(1..10)*SinOsc.ar(fib(10)*4).exprange(1.01,1.3333))/(([1,1.5,1.25,1.33333]*pi));
  var sig = Mix(LFSaw.ar(f + LFNoise2.ar(14000/[1,2,40,80],mul:0.02),mul:LFNoise2.kr(1/40!10)/(10..1)));
  sig = MoogFF.ar(sig,LFNoise2.ar(1/4.01/[1,1.333,1.25,1.5]).range(22.01,16000/4),SinOsc.ar(1/4/[1,2,3,4]).exprange(0.02,3));
  sig = sig * LFTri.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = AllpassN.ar(sig,[1/4,1/4.1],1,4.1)+sig;
  sig = CompanderD.ar(sig,3/4,1/3,1/2);
  Splay.ar(sig,0.65,~n1);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

~one.rebuild;
