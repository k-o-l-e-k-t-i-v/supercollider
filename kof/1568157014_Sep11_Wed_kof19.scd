

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(50!2);
  Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
