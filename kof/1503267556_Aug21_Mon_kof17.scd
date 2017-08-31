




p.push();

// perlinKarplusar synth ///////////////////////////////////////

(
~perlinKarplusar.ar(2);
~perlinKarplusar.clock = p.clock;
~perlinKarplusar.quant=4;
~perlinKarplusar.fadeTime=4;
~perlinKarplusar={
    var span = LFTri.ar(3/60/(2..9).nthPrime).exprange(0.0001,16+([1,2,3,4]/100))+1/2 + LFNoise2.kr(4!3,mul:1/4);
  var sig = SinOsc.ar([22+[0.1,0.001323,0.00003204],0.000001,0.00001],add:[span,10,10]/2,mul:[span,10,10]);
  //sig = Resonz.ar(sig,937.5,0.2);
  sig = Perlin3.ar(sig[0],sig[1],sig[2]) * Decay2.ar(Impulse.ar(4/(1..8)),0.02,3/4*(1..8));
  Splay.ar(sig,0.5,0.75);
};
~perlinKarplusar.play;
);
~perlinKarplusar.stop(4);
~perlinKarplusar.clear;
~perlinKarplusar.pause;
~perlinKarplusar.resume;
