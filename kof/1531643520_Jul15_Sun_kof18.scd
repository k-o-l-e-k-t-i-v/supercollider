

p.push();


// feedback synth ///////////////////////////////////////

(
~feedback.ar(2);
~feedback.clock = p.clock;
~feedback.quant=2;
~feedback.fadeTime=4;
~feedback={
    var f = 110*Duty.kr(16/~tempo/[1,2,3],0,Dseq([1,2,1.5,1.33333],inf));
  var sig = LocalIn.ar(3) + (BrownNoise.ar(0.01!3));
  sig = sig+1;
  sig = Perlin3.ar(sig[0]/8,sig[1].lag(1/3000),sig+(LFSaw.ar(1/16+([1,2,3]/1000)).range(0,4)**2))+(LeakDC.ar(sig)*0.995);
  sig = SelectX.ar(LFSaw.ar(1/16/[1,2,3]).range(0,2),[BPF.ar(sig,f/2,0.33),LPF.ar(sig,f),RLPF.ar(sig,f,0.33)]);
  sig = Normalizer.ar(sig.softclip)/4;
  //sig = sig+sig/3;
  sig = LeakDC.ar(sig);
  sig = GVerb.ar(sig/2,[40,30,50])+sig;
  sig = DelayC.ar(sig,2/48000,1/48000);
  LocalOut.ar(sig);
  Splay.ar(sig,0.75,0.5);
};
~feedback.play;
);
~feedback.stop(4);
~feedback.clear;
~feedback.pause;
~feedback.resume;


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
