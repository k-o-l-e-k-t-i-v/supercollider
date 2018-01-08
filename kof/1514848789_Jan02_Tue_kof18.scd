

~tempo = {125.5/120};


// reseter synth ///////////////////////////////////////

(
~reseter.ar(2);
~reseter.clock = p.clock;
~reseter.quant=16;
~reseter.fadeTime=8;
~reseter={
var mod = Duty.kr(16/~tempo/[1,2,3],0,Dseq([1,2,1.5,1.33333],inf));
  var sig = SinOsc.ar(~tempo*2/[1,1.001]/[1,2,3,4]);
  var scope = [
    WhiteNoise.ar(1),
    SinOsc.ar(50),
    BrownNoise.ar(1),
    GrayNoise.ar(1),
    LFSaw.ar(501/mod),
    PinkNoise.ar(1),
    Pulse.ar(~tempo*4)
];
  RandSeed.ar(Impulse.ar(~tempo*50),LFSaw.ar(~tempo/60/4/[1,2,3,4])*600);
  sig = SinOsc.ar(50,SelectX.ar(sig.range(0,scope.size+1),scope));
  Splay.ar(sig,0.5,0.15);
};
~reseter.play;
);
~reseter.stop(4);
~reseter.clear;
~reseter.pause;
~reseter.resume;




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
