

// orne synth ///////////////////////////////////////

(
~orne.ar(2);
~orne.quant=2;
~orne.fadeTime=16;
~orne={
  var t = Pulse.ar([1/4,1/pi,50/1.333,5]) * LFSaw.ar(1/4/[1,2,3,16],mul:10);
  var seek = Perlin3.ar(t,t[1],t[2]);
  var freq = seek.range(1600,17000);
  var verb = LFNoise2.ar(freq,mul:0.2) + LocalIn.ar(4);
  verb = BPF.ar(verb,500/[1,2,1.5,1.3333]/1.3333,0.333);
  verb = DelayN.ar(verb,1/freq,1/freq);
  LocalOut.ar(Normalizer.ar(verb));
  Splay.ar(verb,0.5,0.15);
};
~orne.play;
);
~orne.stop(30);
~orne.clear;
~orne.pause;
~orne.resume;
