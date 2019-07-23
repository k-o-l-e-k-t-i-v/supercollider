p.push();

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=0;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar([50+(1/16/[1,2,3,4,5,6]),1/8,1/3600])+1;
  sig = Perlin3.ar(sig[0],sig[1],sig[2]);
  sig = SinOsc.ar([500,100,1001]+(sig*2),sig*2pi,mul:[1,0.4,0.1]);
  Splay.ar(sig,0.95,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
