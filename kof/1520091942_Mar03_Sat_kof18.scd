





p.push();
p.bpm(88);







// reborn synth ///////////////////////////////////////

(
~reborn.ar(2);
~reborn.clock = p.clock;
~reborn.quant=2;
~reborn.fadeTime=4;
~reborn={
  var sig = Formant.ar(423,43+LFSaw.ar(~tempo),430*LFSaw.ar(~tempo/4));
  Splay.ar(sig,0.5,0.25);
};
~reborn.play;
);
~reborn.stop(4);
~reborn.clear;
~reborn.pause;
~reborn.resume;
