// ome synth ///////////////////////////////////////

(
~ome.ar(2);
~ome.quant=2;
~ome.fadeTime=4;
~ome={
  var del = 4;
  var mmod = Duty.kr(1/4,0,Dseq([1,2,1.5,1.25],inf)).lag(1/8);
  var mod = Duty.kr([4,16],0,Dseq([1,2,1.5,1.25,1.5,1.3333]**mmod,inf)).lag(1/40);
  var sig = LFSaw.ar(432/3+[0,0.001,0.02,0.004]*mod+SinOsc.kr(1/4/[1,2,3,4],mul:pi),mul:0.25) + DelayN.ar(LocalIn.ar(2),del,del) /2;
  sig = CompanderD.ar(sig,3/4,1/2,1/2);
  sig = Normalizer.ar(sig);
  sig= OnePole.ar(sig,SinOsc.ar(1/4/[1,2,3,4]).range(0,1));
  sig = MoogFF.ar(sig,12000/[1,2,4,8]/mod,SinOsc.kr(1/4.1/[1,2,3,4]).range(0.15,3.75));
  sig = GVerb.ar(sig,10,3,spread:95)/16+sig;
  LocalOut.ar(Mix.ar(sig,mul:0.2));
  Splay.ar(sig,0.5,0.35,SinOsc.kr(4/7)*pi);
};
~ome.play;
);
~ome.stop(4);
~ome.clear;
~ome.pause;
~ome.resume;
