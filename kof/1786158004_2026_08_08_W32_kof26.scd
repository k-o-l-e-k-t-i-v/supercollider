p=NetProxy.push(s);
p.bpm(90)


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
  var sig = SinOsc.ar(150!2);
  ~one = ~one * Phasor.ar(Impulse.ar(4),1);
  Splay.ar(sig,0.5,0.15);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
