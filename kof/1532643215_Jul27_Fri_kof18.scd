



p.push();
s.latency=0.2;

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
    var f = LFTri.ar(LFNoise2.kr([1/4,4,[1/16,1/32,1/64]]/4).exprange(0.0001,2));
    var perl = Perlin3.ar(f[0],f[1],f[2]) * [150,500,2500] + 50 + BrownNoise.ar(5!3);
  var sig = Formant.ar(perl[0],perl[1],perl[2],mul:0.5);
  sig = CombC.ar(sig,2/50,1/5000,1) +sig;
  sig = LPF.ar(sig,5000/(1..8),mul:(8..1)/8);
  sig = LeakDC.ar(sig);

  Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.05,lp=3500,hp=250,len=10,rev = 3|
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
