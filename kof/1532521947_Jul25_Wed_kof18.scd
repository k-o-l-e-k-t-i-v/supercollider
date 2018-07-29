
p.push();
s.latency = 0.2;

// asd synth ///////////////////////////////////////

(
~asd.ar(2);
~asd.clock = p.clock;
~asd.quant=2;
~asd.fadeTime=0.4;
~asd={
  var sig = SinOsc.ar(50,Pulse.ar(4)-Pulse.ar(2)*LFSaw.ar(1/64)*2pi); 
  sig = sig * Pulse.ar(4/[1,2,3,4]);
  sig = CombC.ar(LeakDC.ar(Normalizer.ar(sig))/4,1/5,(1,1.001..1.1)/250,1/4);
  sig = LPF.ar(sig,LFNoise2.kr(~tempo/16!4).range(1500,15000)) + (HPF.ar(sig,LFNoise2.kr(~tempo/16!4).range(1500,15000))*LFPulse.ar(4/[1,2,3,4]));
  sig = AllpassC.ar(sig,1,(1,1.01..2.2)/5000,2);
  Splay.ar(sig,0.5,0.25);
};
~asd.play;
);
~asd.stop(4);
~asd.clear;
~asd.pause;
~asd.resume;


(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.25,lp=2500,hp=150,len=30,rev = 1|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = CompanderD.ar(sig,4/5,1/1.5,3);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[3500,3500],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);
