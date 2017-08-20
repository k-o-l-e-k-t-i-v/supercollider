
p.push();



// free synth ///////////////////////////////////////

(
~free.ar(2);
~free.quant=2;
~free.fadeTime=0.2;
~free={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3],~counter.kr % pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(50!2),
  VarSaw.ar(1000/[1,2,4],mul:0.1) * LFPulse.ar(8),
  LFNoise2.ar(500),
  Pulse.ar(4)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  
  
  
  //sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~free.play;
);
~free.stop(4);
~free.clear;
~free.pause;
~free.resume;


// filter synth ///////////////////////////////////////

(
~filter.ar(2);
~filter.quant=2;
~filter.fadeTime=0.2;
~filter={
  //         |       |       |       |       |  
  var pat = [1,1,1,1].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr % pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = ~free.ar;
  
  sig = [
  CombN.ar(sig,1/50,1/50,1),
  CombL.ar(sig,1/50,1/5000,1),
  CombN.ar(sig,1/4,1/50,1),
  CombC.ar(sig,1,1/50,1),
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  //sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~filter.play;
);
~filter.stop(4);
~filter.clear;
~filter.pause;
~filter.resume;



// two synth ///////////////////////////////////////

(
~two.ar(2);
~two.quant=2;
~two.fadeTime=0.2;
~two={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr % pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = ~free.ar;
  sig = [
  AllpassN.ar(sig,1,1,4),
  AllpassN.ar(sig,1/2,1/2,4),
  AllpassN.ar(sig,1,1/4,4),
  AllpassN.ar(sig,1,1/4000,4),
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  //sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~two.play;
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;


(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.15,lp=3500,hp=250,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = HPF.ar(sig,5);
  sig = LeakDC.ar(sig);
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
