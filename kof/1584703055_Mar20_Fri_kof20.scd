


p.push();
p.bpm(121.35);


// fff control ///////////////////////////////////////

(
~fff.quant=2;
~fff.fadeTime=0;
~fff={
  var ctl = Duty.kr(4/~tempo,0,Dseq([1,2,1,4],inf));
  ctl;
};
);
~fff.stop(4);
~fff.clear;
~fff.pause;
~fff.resume;

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = BrownNoise.ar(0.9!2);
  sig = sig;
  sig = BPF.ar(sig,~fff.kr*5000,LFSaw.ar(90).range(0.01,0.55));
  Splay.ar(sig,0.15,0.25);
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
