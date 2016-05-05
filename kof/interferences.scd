



// dust synth ///////////////////////////////////////

(
~interferences.ar(2);
~interferences.quant=2;
~interferences.fadeTime=4;
~interferences={
  var mm = LFSaw.ar(1/50/[1,1.01]).pow(2)*2pi;
  var sig = SinOsc.ar([50,51]*[1,1.5,4,16]) + BrownNoise.ar(0.01);
  sig = CombN.ar(sig,cos(mm).range(1/[5000,17500],1),sin(mm/1.01).range(1/[5000,17500],1),4);
  Splay.ar(sig,0.45,0.15,SinOsc.ar(sin(mm).range(1,7)));
};
~interferences.play;
);
~interferences.stop(20);
~interferences.clear;
~interferences.pause;
~interferences.resume;
