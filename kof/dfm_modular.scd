



(
  p=ProxySpace.push(s.reboot);
  e=ProxySubmix.new(\filter);
);


s.scope;

// lalal synth ///////////////////////////////////////

(
~lalal.quant=1;
~lalal.fadeTime=4.02;
~lalal={
  var x,y;
  var f = ([60,63,65,72]+LFNoise1.kr(1/64!3).range(-24.001,48).lag(4).round(7)).midicps*4/(1+[1,2,4,8,1,2,1,4].scramble.reciprocal*2pi)*(1.0001**(1..16));
  var sig = SinOsc.ar(f,SinOsc.ar(1/5/fib(16)).range(-pi,pi),mul:0.2) + SinOsc.ar(f,mul:0.25) * EnvGen.ar(Env([0,1,0],[2.5,2.75],[3,-3]),Impulse.ar(1/8,(0..15)/16));
  sig = sig.distort.tanh.softclip/2;
  sig = Limiter.ar(sig,0.9);
  sig = HPF.ar(sig,30);
  sig = DFM1.ar(sig,LFTri.ar(1/8/fib(8)).exprange(40.001,16000),LFTri.ar(1/3/fib(16)).exprange(0.001,1));
  sig = BBandPass.ar(sig,16000/((1..16)*4),2,mul:SinOsc.ar(1/4/fib(16).scramble).exprange(0.001,1));
  sig = Mix(sig);
  //#x,y = Rotate2.ar(sig,HPF.ar(sig,4000),SinOsc.ar(1/4/fib(8)));
  sig = FreeVerb2.ar(HPF.ar(sig,8000),LPF.ar(sig,8000),0.33);
  sig = GVerb.ar(sig,100,5,0.5,0.9,80)/4+sig;
  sig = Limiter.ar(sig);
  sig = CompanderD.ar(sig,4/3,1/4,1/2)/2;
  Mix.ar(sig.flat)!2=;
};
e.addMix(~lalal,postVol:true);
~lalal.play;
);
~lalal.stop(7);
~lalal.clear;


s.scope
