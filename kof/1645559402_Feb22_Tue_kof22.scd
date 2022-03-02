

p.push();

~tempo={121.35}
~tempo

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=0;
~one.fadeTime=0;
~one={
  var sig = Pulse.ar(24/~tempo)/100 ;
  Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
