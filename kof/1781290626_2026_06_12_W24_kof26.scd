s.boot();
p = ProxySpace.push();


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar([50,47.5,1/15],mul:2pi);
  sig = Perlin3.ar(sig[0].cos,sig[1].sin,sig[2].sin);
  Splay.ar(sig,0.5,0.15);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
