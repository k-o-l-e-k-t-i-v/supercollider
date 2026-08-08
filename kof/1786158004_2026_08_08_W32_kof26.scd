p=NetProxy.push(s);
p.bpm(90)


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
  var sig = SinOsc.ar(50!2);
  sig = sig * (1-LFSaw.ar(8)**4);
  Splay.ar(sig,0.5,0.15);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
