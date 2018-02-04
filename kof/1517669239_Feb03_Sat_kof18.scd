

p.push();
p.bpm(90);

// tricking synth ///////////////////////////////////////

(
~tricking.ar(2);
~tricking.clock = p.clock;
~tricking.quant=2;
~tricking.fadeTime=4;
~tricking={
  var sig = SinOsc.ar(50/[1,1.333333,1.5,2]) * LFSaw.ar(~tempo/4/[1,2,3,4]);
  Splay.ar(sig,0.5,0.05);
};
~tricking.play;
);
~tricking.stop(4);
~tricking.clear;
~tricking.pause;
~tricking.resume;


// pulsating_randomness synth ///////////////////////////////////////

(
~pulsating_randomness.ar(2);
~pulsating_randomness.clock = p.clock;
~pulsating_randomness.quant=4;
~pulsating_randomness.fadeTime=4;
~pulsating_randomness={
  var sig = LPF.ar(Dust.ar(SinOsc.ar(~tempo/16.01/[1,2,3,4]).exprange(0.001,2)**0.5),16000/[1,2,3,4]);
  sig = sig + Impulse.ar(~tempo/4);
  sig = Normalizer.ar(Resonz.ar(sig,~tempo*240*[1,2,4,8]));
  sig = LeakDC.ar(sig);
  //sig = CombC.ar(sig,SinOsc.ar(~tempo*4/[1,2,3,4]).exprange(~tempo,0.01),LFSaw.ar(~tempo/4.01/[1,2,3,4]).exprange(~tempo,0.000001),~tempo*4);
  sig = Limiter.ar(sig.clip(-0.9,0.9),0.9);
  sig = AllpassN.ar(sig,[4,3,2,1]/~tempo,[4,3,2,1]/~tempo,4/~tempo);
  Splay.ar(sig,SinOsc.ar(~tempo/4).range(0,1),0.15,SinOsc.ar(~tempo/8.01/[1,2,3,4,5]) );
};
~pulsating_randomness.play;
);
~pulsating_randomness.stop(16);
~pulsating_randomness.clear;
~pulsating_randomness.pause;
~pulsating_randomness.resume;


(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.05,lp=5500,hp=250,len=30,rev = 30|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[75000,75001]+LFSaw.ar(~tempo*4),1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);
