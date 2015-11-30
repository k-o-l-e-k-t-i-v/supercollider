

// seven synth ///////////////////////////////////////

(
~seven.ar(2);
~seven.quant=2;
~seven.fadeTime=4;
~seven={
    var sig = SinOsc.ar(16000/16*(1..16)+SinOsc.ar(LFNoise2.kr(1/4!16)*40).range(-400,400),mul:1/(1..16));
  Splay.ar(sig,0.5,~n7);
};
~seven.play;
);
~seven.stop(4);
~seven.clear;
~seven.pause;
~seven.resume;
