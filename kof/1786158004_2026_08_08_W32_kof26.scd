p=NetProxy.push(s);
p.makeTempoClock;
p.bpm(43.2)

~tempo={43.2/60}


(
  ~tick.kr(1);
  //~tick.clock = p.clock;
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
  var mod = 1**(Duty.kr(4/~tempo,0,Dseq([1,2,1,1.5,1,1.33333]/4,inf))+1);
  var sig = SinOsc.ar(440 * mod);
  sig = sig * LeakDC.ar((LFSaw.ar(~tempo*8/(1..4))**LFNoise1.kr(~tempo/8!4).exprange(0.6,2.0)));
  sig = HPF.ar(sig,40);
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
  ~master = {|wet=0.25,lp=3500,hp=250,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = GVerb.ar(NumChannels.ar(fx,2),90/len,3)/rev;
  wet = LFSaw.kr(~tempo/[1,2,3,4])**2;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(master);
