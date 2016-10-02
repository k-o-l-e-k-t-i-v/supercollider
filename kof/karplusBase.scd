


// karplus synth ///////////////////////////////////////

(
~karplus.ar(2);
~karplus.quant=2;
~karplus.fadeTime=0.1;
~karplus={
  var pat = 4/[1,2,3,4] * ~tempo;
  var sig = LFPulse.ar(pat,0,LFNoise2.kr(1/4!4).range(0.001,0.15)*pat) * PinkNoise.ar(1!2);
  var f = [36].midicps/TChoose.kr(Impulse.kr(pat/4),[1,2,1.5,1.33333]) + SinOsc.ar(1/40/[1,2,3,4]);
  sig = sig + LocalIn.ar(4);
  sig = DelayN.ar(sig,1/f,1/f);
  sig = Resonz.ar(sig,f*[1,1.5,1.333333,2]*4,0.02) + BPF.ar(sig,f*2,0.2);
  //sig = DFM1.ar(sig,f*2);
  sig = LeakDC.ar(sig);
  sig = CompanderD.ar(sig,3/4,1/1.0125,1/4);
  sig = Normalizer.ar(sig)/1.5;
  LocalOut.ar(sig);
  Splay.ar(sig,0.95,0.5);
};
~karplus.play;
~karplus[1] = \filter -> {|sig| DWGReverb.ar(LPF.ar(HPF.ar(sig,300),7000),[4000,4010])+sig};
);
~karplus.stop(4);
~karplus.clear;
~karplus.pause;
~karplus.resume;


LFPulse.help
