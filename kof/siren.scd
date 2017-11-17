p.push();


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
    var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.33333,1,2,4,8],inf));
    var ll = SinOsc.ar(1/16/mod*[1,1.001,1.00001]).exprange(1/50,1/500);
  var sig = SinOsc.ar([1/4*mod,1/49.999,50.0002/mod]+LFNoise2.kr(1/60/[1,1.01,1.00001]));
  sig = CombN.ar(sig,ll*2,ll,1);
  sig = Perlin3.ar(sig[0],sig[1],sig[2]);
  sig = CombL.ar(sig,ll.lag(0.1)*2,ll.lag(0.11)*2,1);
  sig = LPF.ar(sig,5000);
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
