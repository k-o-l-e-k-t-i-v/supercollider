


// ooo synth ///////////////////////////////////////

(
~ooo.ar(2);
~ooo.quant=2;
~ooo.fadeTime=4;
~ooo={
  var t = LFTri.ar([1/64,50,1/32/(1..64)]) * (1..8);
  var f = Perlin3.ar(t[0],t[1],t[2]);
  var sig = Formant.ar(f.range(50,5000/[1,2,1.5,4]),f.range(50,500).scramble,f.range(50,500).reverse,mul:LFTri.kr(1/(1..64))**4 );
  sig = CompanderD.ar(BPF.ar(sig,1500/8*(1..8),0.5),3/4,1/LFNoise2.kr(1/4!8).range(1,3),1/2);
  Splay.ar(sig,0.95,0.5);
};
~ooo.play;
);
~ooo.stop(4);
~ooo.clear;
~ooo.pause;
~ooo.resume;


NestedAllpassN.help
