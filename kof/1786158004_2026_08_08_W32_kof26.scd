p=NetProxy.push(s);
p.bpm(90)


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
  var mod = Duty.kr(4/~tempo,0,Dseq([1,2,1,1.5,1,1.33333],inf));
  var sig = SinOsc.ar(125 * mod);
  sig = sig * LeakDC.ar(1-(LFSaw.ar(8/(1..8))**LFNoise1.kr(1/4!8).exprange(1.1,8.0)));
  Splay.ar(sig,1,0.5);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
