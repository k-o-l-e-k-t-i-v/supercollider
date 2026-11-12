
s.boot;

p.push();
p.bpm(120);

// drift synth ///////////////////////////////////////

(
~drift.ar(2);
~drift.quant=4;
~drift.fadeTime=2;
~drift={
  var sig = SinOsc.ar(50!2);
  Splay.ar(sig,0.5,0.25);
};
~drift.play;
);
~drift.stop(4);
~drift.clear;
~drift.pause;
~drift.resume;
