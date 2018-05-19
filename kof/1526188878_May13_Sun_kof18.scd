p.bpm(60);

p.push();
s.latency = 0.2

// fast synth ///////////////////////////////////////

(
~fast.ar(2);
~fast.quant=16;
~fast.fadeTime=0.2;
~fast={
  //         |       |       |       |       |  
  var pat = [1,1,1,1,1,1,1,1,1].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[4,3,2,1],~counter.kr % pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.75]*MouseX.kr(0.0001,3.5),[3,-3],curve:'exp'),imp * hit)};
  var mod = Duty.kr([17,7,5,2]/~tempo,0,Dseq([1,2,1.5,1.33333,7/5,1,1,1],inf));
  var sig = [
  SinOsc.ar(50!2,env**40*2pi),
  SinOsc.ar([60,55,58,72].midicps*4 / mod , (env**MouseY.kr(0.1,1.5)),mul:0.4) / 2,
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);

  sig = sig * env;
  Splay.ar(sig,0.95,0.5);
};
~fast.play;
);
~fast.stop(4);
~fast.clear;
~fast.pause;
~fast.resume;

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
