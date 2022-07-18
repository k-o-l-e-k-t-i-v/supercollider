


p.push()
p.bpm(121.35)



// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=24;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(50!2) * Pulse.ar(~tempo);
  Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
