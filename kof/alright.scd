

p.push();

(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.15,lp=3500,hp=250,len=10,rev = 2|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = Compander.ar(sig,3/4,1/1.1,1/3);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);

// alright synth ///////////////////////////////////////

(
~alright.ar(2);
~alright.clock = p.clock;
~alright.quant=16;
~alright.fadeTime=4;
~alright={
  var f = [60,64,69].midicps * TWChoose.kr(Impulse.kr(1/16!3),[1,2,1/2,4/3,5/4],[1,1,1,0.2,0.1],1);
  var sig = SinOsc.ar(f,Pulse.ar([1,2,3])) + LFSaw.ar(1/4000,mul:40);
  sig = Perlin3.ar(sig[0],sig[1],sig[2]) * LFTri.ar([1,2,3]);
  sig = LeakDC.ar(sig);
  sig = LPF.ar(sig,sig.range(50,15000),LFNoise2.kr(1/4!3).range(0.01,0.5));
  sig = CompanderD.ar(sig,3/4,1/2,1);
  Splay.ar(sig,0.25,0.15,sig);
};
~alright.play;
);
~alright.stop(4);
~alright.clear;
~alright.pause;
~alright.resume;
