

p.push();


// ignorants synth ///////////////////////////////////////

(
~ignorants.ar(2);
~ignorants.clock = p.clock;
~ignorants.quant=4;
~ignorants.fadeTime=4;
~ignorants={
  var sig = SinOsc.ar([50,50.01],SinOsc.ar(1/16/[1,2,3])*8pi,mul:1/[1,2,4]);
  sig = SinOsc.ar([4,3,2],sig**LFNoise2.kr(1/64!16)*8pi);
  Splay.ar(sig,0.5,0.25);
};
~ignorants.play;
);
~ignorants.stop(4);
~ignorants.clear;
~ignorants.pause;
~ignorants.resume;
