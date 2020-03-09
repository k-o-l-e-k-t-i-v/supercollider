
m = 499.004/0.861641;

p.push();

// first synth ///////////////////////////////////////

(
~first.ar(2);
~first.quant=0;
~first.fadeTime=4;
~first={
  var sig = SinOsc.ar(m/[1,2,4,1.5],SinOsc.ar(m/10000/[1,2,3,4])) * (LFTri.ar(m/10000/[1,2,3,4])**2);
  Splay.ar(sig,0.5,0.5);
};
~first.play;
);
~first.stop(4);
~first.clear;
~first.pause;
~first.resume;
