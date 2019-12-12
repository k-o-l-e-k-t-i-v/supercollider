

p.push();


// later synth ///////////////////////////////////////

(
~later.ar(2);
~later.quant=2;
~later.fadeTime=0.1;
~later={
  var sig = LFTri.ar([75,1/15,7.5/(1/864,0.59..1.51)])*MouseX.kr(0.001,10)+MouseY.kr(0,1);
  sig = Perlin3.ar(sig[0],sig[1],sig[2]);
  //sig = CombL.ar(sig,3,1/(0.13,50..60.1)**0.667,3);
  sig = LeakDC.ar(sig);
  sig = Normalizer.ar(sig);
  sig = Compander.ar(sig,3/4,1/2,1);
  sig= LPF.ar(sig,1500) + HPF.ar(sig,18000);
  Splay.ar(sig,0.95,0.15);
};
~later.play;
);
~later.stop(4);
~later.clear;
~later.pause;
~later.resume;


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

[1,2,3,4].
