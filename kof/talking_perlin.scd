

p.bpm(90)
p.push();
// rash synth ///////////////////////////////////////

(
~rash.ar(2);
~rash.clock = p.clock;
~rash.quant=2;
~rash.fadeTime=4;
~rash={
    var sig2,sig3,sig;
  var t = LFSaw.ar([50+SinOsc.kr(1/32/(1..4),mul:pi),~tempo/32,~tempo/16]).range(0,8pi) * (LFTri.kr(1/600/[1,2,3],mul:1)**2);
  sig = Perlin3.ar(t[0].cos,t[1].sin,t[2]);
  sig2 = Perlin3.ar(t[2].cos,t[0].sin,t[1]);
  sig3 = Perlin3.ar(t[1].cos,t[2].sin,t[0]);
  sig = CombN.ar(sig,sig2.range(1/10000,1/50),sig3.range(1/10000,1/50),4/50);
  sig = LPF.ar(sig,1500+LFNoise2.kr(1/[1,2,3]).range(0,5000));
  sig = LeakDC.ar(sig);
  Splay.ar(sig,0.5,0.75);
};
~rash.play;
);
~rash.stop(16);
~rash.clear;
~rash.pause;
~rash.resume;


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
