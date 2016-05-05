
// input synth ///////////////////////////////////////

(
~input.ar(2);
~input.quant=2;
~input.fadeTime=4;
~input={
  var sig = AudioIn.ar([1,2]);
  sig = CombN.ar(sig,1/500,1/5,4);
  sig = PitchShift.ar(sig,0.1,0.75);
  sig = LPF.ar(sig,4800);
  Splay.ar(sig,0.5,0.95,SinOsc.ar(1/4));
};
~input.play;
);
~input.stop(4);
~input.clear;
~input.pause;
~input.resume;
