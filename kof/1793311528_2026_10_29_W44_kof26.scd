


s.boo
p.push();

// onr synth ///////////////////////////////////////

(
~onr.ar(2);
~onr.quant=4;
~onr.fadeTime=2;
~onr={
  var sig = SinOsc.ar(50!2,SinOsc.ar(47));
  Splay.ar(sig,0.05,0.25);
};
~onr.play;
);
~onr.stop(4);
~onr.clear;
~onr.pause;
~onr.resume;
