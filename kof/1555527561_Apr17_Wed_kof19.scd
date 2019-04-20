


p.push();
p.bpm(123.5)

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = Pulse.ar(~tempo/[1,2,3,4],LFSaw.ar(~tempo/16));
  Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
