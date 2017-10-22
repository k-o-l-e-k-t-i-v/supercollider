p.push();


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
    var harm = 2**(2..12).log;
  var sig = SinOsc.ar(220*({harm.choose}!3));
  Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

2**(2..12).log
