

p.push();
(1+(1/(1..12))).plot;
// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=4;
~one={
  var harm = ((-1)**(((1..12)+1)/(1..12)));
  var sig = SinOsc.ar(440*harm);
  Splay.ar(sig,0.5,0.025);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
