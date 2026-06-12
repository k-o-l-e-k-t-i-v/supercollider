s.boot();
p = ProxySpace.push();


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar([50,47.5,1/60],mul:2pi);
  sig = Perlin3.ar(sig[0].cos,sig[1].sin,sig[2].sin);
  sig = BPF.ar(sig,LFSaw.ar(1/[1,2,3]).exprange(40.01,5000),LFNoise1.kr(1/30!3).exprange(0.01,0.7));
  sig = CompanderD.ar(sig,3/4,1/2,1);
  sig = GVerb.ar(sig,60,3)/12+sig;
  Splay.ar(sig,0.05,0.5);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
