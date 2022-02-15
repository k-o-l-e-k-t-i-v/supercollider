

p.push();


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=0.4;
~one={
  var sig = SinOsc.ar([50,60,300.01,300]);
  Splay.ar(sig,1,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
