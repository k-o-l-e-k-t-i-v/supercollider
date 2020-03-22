

p.push();
p.bpm(121.35)
// lard control ///////////////////////////////////////

~lard.mold(4)
(
~lard.quant=24;
~lard.fadeTime=0;
~lard={
  var ctl = LFSaw.kr(~tempo*5/[1,2,3,4]);
  ctl;
};
);
~lard.stop(4);
~lard.clear;
~lard.pause;
~lard.resume;

b=Buffer.alloc(s,48000,4);


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(10*~lard.kr+50) * BufDelayL.ar(b,Pulse.ar(~tempo*3/[1,2,3,4]),~lard.kr/24);
  Splay.ar(sig,0.75,0.25);
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
