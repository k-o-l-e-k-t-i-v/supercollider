




p.push();

// perlinKarplusar synth ///////////////////////////////////////

(
~perlinKarplusar.ar(2);
~perlinKarplusar.clock = p.clock;
~perlinKarplusar.quant=4;
~perlinKarplusar.fadeTime=4;
~perlinKarplusar={
    var span = LFSaw.ar(1/60).exprange(0.0001,80+([1,2,3,4]/100))+1/2 + LFNoise2.kr(4!3,mul:1/4);
  var sig = SinOsc.ar([20+[0.1,0.001323,0.00003204],0.0001,0.00001],mul:[span,10,10]);
  //sig = Resonz.ar(sig,937.5,0.2);
  sig = Perlin3.ar(sig[0],sig[1],sig[2]) * LPF.ar(BrownNoise.ar(1!8),10) + (SinOsc.ar(12000/(2..8).log+(sig*pi),Pulse.ar(1.5),mul:1/1000) * Pulse.ar(1.5/(2..8).nthPrime));
  sig = CombL.ar(sig,8/20,[1,2.0001,3.000023]/20,16);
  sig = LeakDC.ar(sig);
  sig = Normalizer.ar(sig);
  Splay.ar(sig,0.5,0.15);
};
~perlinKarplusar.play;
);
~perlinKarplusar.stop(4);
~perlinKarplusar.clear;
~perlinKarplusar.pause;
~perlinKarplusar.resume;
