


p.push();



// tma synth ///////////////////////////////////////

(
~tma.ar(2);
~tma.clock = p.clock;
~tma.quant=2;
~tma.fadeTime=4;
~tma={
  var sig = SinOsc.ar(50+((1..10)/1000)) / SinOsc.ar(2/(1..10)) + (SinOsc.ar(6000,mul:0.01)*Pulse.ar(1/4*LFNoise2.kr(1/4!4).round(1/2/(1..10))));
  sig = LeakDC.ar(sig);
  sig = Perlin3.ar(sig,sig,sig)/8 + sig;
  sig = LPF.ar(sig,5000) ** (sig.abs*LFSaw.ar(4/(1..10)).range(0.1,2));
  sig = BPF.ar(sig,LFNoise1.kr(1/16/(1..3)).range(100,5000),0.1 ) + LPF.ar(sig,1500);
  sig = LeakDC.ar(sig);
  sig = CompanderD.ar((sig/2),3/4,1/2,4).softclip;
  Splay.ar(sig,0.5,0.25);
};
~tma.play;
);
~tma.stop(4);
~tma.clear;
~tma.pause;
~tma.resume;

(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.05,lp=3500,hp=250,len=10,rev = 2.5|
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
