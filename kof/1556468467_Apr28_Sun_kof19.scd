



p.push();


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=6;
~one={
  var sig = SinOsc.ar(35!2,SinOsc.ar(1.5)*2pi*Pulse.ar(3)) * Pulse.ar(3/[1,2,3,4]);
  Splay.ar(sig,0.05,0.15);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
