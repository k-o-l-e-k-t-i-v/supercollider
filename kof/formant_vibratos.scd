

(
  p=ProxySpace.push(s.reboot);
);


// aasd synth ///////////////////////////////////////

(
~aasd.quant=1;
~aasd.fadeTime=4.02;
~aasd={
  var env = EnvGen.ar(Env([0,1,0],[4.005,1.75],[3,-2]),Impulse.ar(1/64,(1..15)/16));

  var sig = Formant.ar([60,36,72].midicps.scramble*4/([1,1.5,1.25,2,4].scramble*0.5pi)+(SinOsc.ar(11/fib(16))*Amplitude.ar(~aasd.ar)*400),432*[1,1.5,2],SinOsc.ar(1/2/fib(16)).range(1,800));
  sig = Normalizer.ar(sig);
  sig = sig * env/8;
  sig = HPF.ar(AllpassN.ar(sig,4,4,16),800)+sig ;
  sig = GVerb.ar(HPF.ar(sig,500),100)/2+LPF.ar(sig,500);
  sig = CompanderD.ar(sig,4/3,1/3,1/2);
  sig = Limiter.ar(sig);
  Splay.ar(sig.flat,0.75,0.5);
};
~aasd.play;
);
~aasd.stop(7);
~aasd.clear;
