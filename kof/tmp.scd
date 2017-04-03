









p.push();


// peper synth ///////////////////////////////////////

(
~peper.ar(2);
~peper.clock = p.clock;
~peper.quant=2;
~peper.fadeTime=4;
~peper={
  var sig = SinOsc.ar([1,1/2,50]);
  sig = Perlin3.ar(sig[0],sig[1],sig[2]);
  Splay.ar(sig,0.5,0.25);
};
~peper.play;
);
~peper.stop(4);
~peper.clear;
~peper.pause;
~peper.resume;
