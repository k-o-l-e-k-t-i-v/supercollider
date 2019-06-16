

p.push();
p.bpm(121.5);

// saw synth ///////////////////////////////////////

(
~saw.ar(2);
~saw.quant=2;
~saw.fadeTime=4;
~saw={
    var base = [60,67,65].midicps;
    var f= base + ([1,2,3]/10.0)+SinOsc.kr(~tempo/8/[1,2,3],mul:3);
  var sig = LFSaw.ar(f,LFNoise1.ar(~tempo/[4,5,6])) + SinOsc.ar(f/1.5,2pi);
  sig = sig * SinOsc.ar(~tempo/15/[1,2,3]);
  sig = LPF.ar(sig,f*2) + Resonz.ar(CompanderD.ar(sig,3/4,1/2,1),f*[1,2,4],0.2);
  sig = CompanderD.ar(sig,3/4,1/1.2,1);
  Splay.ar(sig,0.5,0.5);
};
~saw.play;
);
~saw.stop(4);
~saw.clear;
~saw.pause;
~saw.resume;
