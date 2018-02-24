
p.push();

// circa synth ///////////////////////////////////////

(
~circa.ar(2);
~circa.clock = p.clock;
~circa.quant=16;
~circa.fadeTime=8;
~circa={
  var sig = SinOsc.ar([50,50.00001],SinOsc.kr(1/[60,60.01])*2pi);
  Splay.ar(sig,0.5,0.25);
};
~circa.play;
);
~circa.stop(4);
~circa.clear;
~circa.pause;
~circa.resume;
