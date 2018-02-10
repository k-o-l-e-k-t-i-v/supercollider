


p.push();


// bit synth ///////////////////////////////////////

(
~bit.ar(2);
~bit.clock = p.clock;
~bit.quant=2;
~bit.fadeTime=4;
~bit={
  var sig = SinOsc.ar(50) & SinOsc.ar(51);
  Splay.ar(sig,0.5,0.05);
};
~bit.play;
);
~bit.stop(4);
~bit.clear;
~bit.pause;
~bit.resume;
