

// stampler synth ///////////////////////////////////////

(
~stampler.ar(2);
~stampler.quant=2;
~stampler.fadeTime=4;
~stampler={
  var f = [3,4,5,6].octcps*[1,1.5,1.33333,1.666666,1.875,10,5,20,40];
  var sig = LFTri.ar([1/1600,1/4000,1/16/[1,2,3,4]]);
  var sel = Perlin3.ar(sig[0],sig[1],sig[2]);
  sig = WhiteNoise.ar(0.8!4);
  sig = Resonz.ar(sig,Select.kr(sel.range(0,f.size),f),0.04) * Pulse.ar(4);
 // sig = Normalizer.ar(sig);
  Splay.ar(sig,0.5,0.95);
};
~stampler.play;
~stampler[1] = \filter -> {|sig| DWGReverb.ar(LPF.ar(HPF.ar(sig,300),7000),[4000,4010])+sig};
);
~stampler.stop(4);
~stampler.clear;
~stampler.pause;
~stampler.resume;

SelectX.help
