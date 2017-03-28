

p.push()
p.bpm(120);

// dyn synth ///////////////////////////////////////

(
~dyn.ar(2);
~dyn.clock = p.clock;
~dyn.quant=2;
~dyn.fadeTime=4;
~dyn={
  var sig = Klang.ar(`[[1,2.03,3.001,4.01]*1000+SinOsc.ar([5,6,7,4],mul:500),[0.1,0.331,0.21,0.1] ,[0.13,4.3,0.1]*LFNoise2.kr(1/4!4)],[1,2,3,4],LFNoise2.kr(1/4!4).range(-4,4)) * Pulse.ar(~tempo/16/[1,2,3,4]).softclip;
  sig = sig;
  Splay.ar(sig,0.5,0.95);
};
~dyn.play;
);
~dyn.stop(4);
~dyn.clear;
~dyn.pause;
~dyn.resume;


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
  fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);

Klang.help
