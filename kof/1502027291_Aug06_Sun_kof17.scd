
p.push();
p.bpm(25);

// signal synth ///////////////////////////////////////

(
~signal.ar(2);
~signal.quant=4;
~signal.fadeTime=0.2;
~signal={
    var mod = Duty.kr(16/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
  //         |       |       |       |       |  
  var pat = [1,1,1,1].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr % pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  VarSaw.ar(43.2),
  Pulse.ar(~tempo*16),
  LFSaw.ar(432/mod,mul:0.12),
  WhiteNoise.ar(LFSaw.ar(~tempo/16))
  ];
  sig = Select.ar(LFSaw.kr(~tempo).range(0,sig.size+1),sig);
  //sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
//~signal.play;
);
~signal.stop(4);
~signal.clear;
~signal.pause;
~signal.resume;

// modifier synth ///////////////////////////////////////

(
~modifier.ar(2);
~modifier.quant=4;
~modifier.fadeTime=6.2;
~modifier={
  //         |       |       |       |       |  
  var pat = [1,1,1,1].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr % pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sigIn = ~signal.ar;
  var sig = [
  CombL.ar(sigIn,~tempo/4,~tempo/4,1),
  CombN.ar(sigIn,~tempo/8,~tempo/8,1),
  CombC.ar(sigIn,~tempo/32,~tempo/4,1),
  CombN.ar(sigIn,~tempo/64,~tempo/16,1),
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = LeakDC.ar(sig);
  sig = Limiter.ar(sig,-0.75,0.75);
  //sig = sig * env;
  Splay.ar(sig,0.5,0.5);
};
~modifier.play;
);
~modifier.stop(4);
~modifier.clear;
~modifier.pause;
~modifier.resume;


(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.35,lp=3500,hp=250,len=10,rev = 3|
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
