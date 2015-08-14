

(
  p=ProxySpace.push(s.reboot);
);

// paranormal synth ///////////////////////////////////////

(
~paranormal3.quant=1;
~paranormal3.fadeTime=4.02;
~paranormal3={
  var freq = CombN.ar(SinOsc.ar(1200.1/[1,2,4,8]),1,1*LFNoise2.kr(1/16!24).range(0.005,10.11),16)*1200.1+120;
  var phase = CombN.ar(SinOsc.ar(1/16/(1..24)),4,1/4/(1..12),16);
  var sig = LFPar.ar(freq*(1.0001**(1..24)),phase*2pi,mul:0.3);
  sig = sig * SinOsc.ar(freq * -1,phase.range(-pi,2pi) * -1);
  sig = Normalizer.ar(sig);
  sig = CompanderD.ar(sig,3/4,1/3,1/2);
  Splay.ar(sig.flat.softclip,1,0.05);
};
~paranormal3.play;
);
~paranormal.stop(7);
~paranormal.clear;
