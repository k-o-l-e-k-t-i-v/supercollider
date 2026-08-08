p=NetProxy.push(s);
p.makeTempoClock;
p.bpm(43.2*2)

(
  ~tick.kr(1);
  ~tick.clock = p.clock;
  ~tick.quant=4;
  ~tick = { Impulse.kr(~tempo * 4); };
  ~counter = {PulseCount.kr(~tick.kr);};
);    

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
  var mod = 1**Duty.kr(4/~tempo,0,Dseq([1,2,1,1.5,1,1.33333],inf))+1;
  var sig = SinOsc.ar(220 * mod);
  sig = sig * LeakDC.ar(1-(LFSaw.ar(8/(1..8))**LFNoise1.kr(1/4!8).exprange(1.1,8.0)));
  Splay.ar(sig,1,0.5);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

(
  ~master.quant=4;
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
  fx = GVerb.ar(NumChannels.ar(fx,2),90/len,3)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(master);
