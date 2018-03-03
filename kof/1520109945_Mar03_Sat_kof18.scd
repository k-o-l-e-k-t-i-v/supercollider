

p.push();
p.bpm(143.721/4.0);






// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=8;
~one.fadeTime=4;
~one={
  var tim = LFSaw.ar(~tempo/[1,2,60]);
  var perl = Perlin3.ar(tim[0],tim[1],tim[2]);
  var sig = LPF.ar(LFSaw.ar([50,50.001]),0,perl)*LFSaw.ar(~tempo/4);
  sig = LeakDC.ar(sig);
  Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
