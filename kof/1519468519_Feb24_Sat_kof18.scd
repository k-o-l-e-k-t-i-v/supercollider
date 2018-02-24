





p.push();
p.bpm(115);


// scheduled synth ///////////////////////////////////////

(
~scheduled.ar(2);
~scheduled.clock = p.clock;
~scheduled.quant=2;
~scheduled.fadeTime=4;
~scheduled={
  var sig = SinOsc.ar(50!2,Pulse.ar(~tempo));
  Splay.ar(sig,0.5,0.25);
};
~scheduled.play;
);
~scheduled.stop(4);
~scheduled.clear;
~scheduled.pause;
~scheduled.resume;


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
