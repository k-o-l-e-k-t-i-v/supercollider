


// heart synth ///////////////////////////////////////

(
~heart.quant=2;
~heart.fadeTime=5;
~heart={
  var sig = AudioIn.ar(1);
  sig = SinOsc.ar(220,mul:0.05)*Decay.ar(Changed.ar(sig,0.0015),0.15);
  Splay.ar(sig,0.25,0.5);
};
e.addMix(~heart,postVol:true);
~heart.play;
);
~heart.stop(7);
