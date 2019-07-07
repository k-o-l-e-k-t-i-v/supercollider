

p.push();

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=4;
~one={
    var f = 50*[1,2,1.5];
    var sharp = LFSaw.ar(1/1/16/(2..8).log2).range(0.1,0.99);
  var sig = SinOsc.ar([4,50,5])+1*5*SinOsc.kr(1/64/[1,100.001,1000.0001])+SinOsc.ar(500,mul:0.5);
  sig = Perlin3.ar(sig[0],sig[1],sig[2]);
  sig = Resonz.ar(sig,f,sharp);
  CompanderD.ar(sig,1/2,1/2,1);
  Splay.ar(sig,0.15,0.5,0,false);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
