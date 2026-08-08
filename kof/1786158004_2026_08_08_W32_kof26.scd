p=NetProxy.push(s);
p.bpm(90)


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
  var sig = SinOsc.ar(50!2);
  sig = sig * LeakDC.ar(1-(LFSaw.ar(8/(1..8))**LFNoise1.kr(1/4!4).exprange(1.1,8.0)));
  Splay.ar(sig,0.5,0.15);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
