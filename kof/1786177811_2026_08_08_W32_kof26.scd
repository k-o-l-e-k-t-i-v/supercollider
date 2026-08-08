
p.push();

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={|vol=1|
  var sig = SinOsc.ar(60!2) * LFSaw.ar(4);
  Splay.ar(sig,0,vol);
};
~one.play;
~one.vol(0.2);
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
