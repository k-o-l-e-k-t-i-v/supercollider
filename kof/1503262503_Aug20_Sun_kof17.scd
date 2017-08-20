

p.push();



// threecomplex synth ///////////////////////////////////////

(
~threecomplex.ar(2);
~threecomplex.clock = p.clock;
~threecomplex.quant=2;
~threecomplex.fadeTime=4;
~threecomplex={
  var t = SinOsc.ar(48000/512+LFNoise0.kr(25!16,mul:1/4),add:1.0,mul:4);
  var sig = Perlin3.ar(t,DC.ar(1),DC.ar(1)); 
  Splay.ar(sig,0.5,0.5);
};
~threecomplex.play;
);
~threecomplex.stop(4);
~threecomplex.clear;
~threecomplex.pause;
~threecomplex.resume;
