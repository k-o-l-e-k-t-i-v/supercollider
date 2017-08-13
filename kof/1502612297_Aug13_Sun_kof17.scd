
p.push();

// oner synth ///////////////////////////////////////

(
~oner.ar(2);
~oner.clock = p.clock;
~oner.quant=2;
~oner.fadeTime=4;
~oner={
  var sig = LFSaw.ar(48000/[256,64,1024]+LFNoise2.kr(1/16!3).range(0.0001,2)).range(0,2pi).sin;
  sig = Resonz.ar(sig,[500,1000,1500],LFNoise1.kr(1/16!3).range(0.01,0.4));
  sig = Normalizer.ar(sig) * (LFTri.ar(3.5/[1,2,3]/16).range(1/4,2)**0.75);
  sig = CombC.ar(sig,1/4,[1,2,4]/50,1);
  sig = Perlin3.ar(sig[0],sig[1],sig[2]);
  sig = LPF.ar(sig,1500);
  Splay.ar(sig,0.5,0.5);
};
~oner.play;
);
~oner.stop(4);
~oner.clear;
~oner.pause;
~oner.resume;

(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.15,lp=3500,hp=250,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);
