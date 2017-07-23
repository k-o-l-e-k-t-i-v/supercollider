


p.push();
p.bpm(90);


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
    var mod = Duty.kr(16*[1,2,3]/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
  var sig = SinOsc.ar([110,55,1100]*mod+LFNoise2.kr(~tempo/32!3)/.x[1,1,(1..6).reciprocal+1]) * LFNoise2.kr(~tempo/64!3).range(0,4);
  sig = Perlin3.ar(sig[0],sig[1],sig[2]) * (LFTri.kr(~tempo/16/[1,2,3]) ** 4);
  sig = LeakDC.ar(sig);
  sig = CombL.ar(sig,~tempo,512/48000,~tempo);
  sig = Compander.ar(sig,4/5,1,10);
  sig = Normalizer.ar(sig);
  Splay.ar(sig,0.5,0.5,SinOsc.ar(SinOsc.kr(~tempo/14).range(~tempo/8,110))/2);
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
