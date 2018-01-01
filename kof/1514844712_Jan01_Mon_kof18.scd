
// abs synth ///////////////////////////////////////

(
~abs.ar(2);
~abs.clock = p.clock;
~abs.quant=2;
~abs.fadeTime=4;
~abs={
    var f = 50;
  var sig = SinOsc.ar(f) * LFDNoise1.ar(f);
  Splay.ar(sig,0.5,0.25);
};
~abs.play;
);
~abs.stop(4);
~abs.clear;
~abs.pause;
~abs.resume;
