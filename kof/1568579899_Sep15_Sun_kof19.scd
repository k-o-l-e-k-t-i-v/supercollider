

p.push();



// cents synth ///////////////////////////////////////

(
~cents.ar(2);
~cents.quant=2;
~cents.fadeTime=4;
~cents={
  var sig = LFSaw.ar(1/8.64);
  sig = sig + SinOsc.ar(20000/8.64,mul:sig**2/1000.0);
  sig = Perlin3.ar(sig,sig*100,sig*1000);
  sig = sig * Pulse.ar(32/8.64);
  Splay.ar(sig,0.5,0.15);
};
~cents.play;
);
~cents.stop(4);
~cents.clear;
~cents.pause;
~cents.resume;


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
  fx = DelayN.ar(fx,1/20,1/20);
  fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);
