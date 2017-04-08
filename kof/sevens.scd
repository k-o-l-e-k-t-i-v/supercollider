

p.push;


// sevens synth ///////////////////////////////////////

(
~sevens.ar(2);
~sevens.clock = p.clock;
~sevens.quant=4;
~sevens.fadeTime=4;
~sevens={
  var base = TChoose.kr(Impulse.kr(1.5/7*(1..3)/7/16),[60,36,72,24,84]).midicps;
  var mel = TChoose.kr(Impulse.kr(1.5/7*(1..7)/7),[1,2,4,1.5,4/3,1/2,1/4]);
  var div = 7/(1..7) * base / mel;
  var cad = LFSaw.kr(1/70/(1..7)).exprange(1.0001,30);
  var frag = LFNoise0.kr(cad).range(1,div).round(12.midicps);
  var sig = SinOsc.ar(div,mul:1/cad) * CombN.ar(Pulse.ar(cad).softclip,1/frag,1/frag.lag(1/7),3/cad).softclip;
  sig = CompanderD.ar(sig,3/4,1,1/3);
  Splay.ar(sig,0.5,0.337);
};
~sevens.play;
);
~sevens.stop(4);
~sevens.clear;
~sevens.pause;
~sevens.resume;
