// one synth ///////////////////////////////////////

s.boot;
p.push() 

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(8500);
  Splay.ar(sig,0.5,0.05);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
