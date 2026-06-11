s.boot();
p=ProxySpace.push();


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar([1/16,1/36,50],mul:2pi);
  sig = Perlin3.ar(sig[0].cos,sig[1].sin,sig[2]/2pi);
  sig = LeakDC.ar(sig);
  sig = CombN.ar(sig,1,[1,2,4]/50,1);
  XYScope.ar(sig[0],sig[1],sig[2]);
  Splay.ar(sig,0.05,0.05);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
