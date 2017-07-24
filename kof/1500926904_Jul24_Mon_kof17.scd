

p.push();

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
    var t = SinOsc.ar(50+.x[0.001,0.002,0.003]) + 1 + LFNoise1.kr(~tempo/[50,500,5000],mul:40);
  var sig = Perlin3.ar(t[0],t[1],t[2]) * LFTri.kr(~tempo/[1,2,3]/16);
  sig = CombN.ar(sig,1/4,1/1000,4);
  sig = LeakDC.ar(sig);
  sig = SinOsc.ar([1/5,1/50.1,1/50.02],sig*8pi);
  Splay.ar(sig,0.5,0.5);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
