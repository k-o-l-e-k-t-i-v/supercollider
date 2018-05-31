

p.push();



p.bpm(90);



// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
  var t = LFSaw.ar([1,2,50]);
  var sig = Perlin3.ar(t[0],t[1],t[2]);
  Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
