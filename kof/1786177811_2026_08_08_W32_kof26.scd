
p.push();

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
  var sig = SinOsc.ar(60!2) * LFSaw.ar(4);
  Splay.ar(sig,0,1);
};
~one.play;
~one.vol(0.2);
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
