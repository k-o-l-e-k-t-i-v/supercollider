

s.boot;
p = ProxySpace.push(s);

~tempo=(1/0.432);

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
  var sig = SinOsc.ar(50!2,Pulse.ar(1.2));
  Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
