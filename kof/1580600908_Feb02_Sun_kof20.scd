



p.push();
p.bpm(128.09);

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=12;
~one.fadeTime=0.4;
~one={
  var pat = Duty.kr((1..16)/~tempo,0,Dseq([1,4/3,2,3/4],inf))*~tempo/4;
  var sig = SinOsc.ar(10524/((12/(2..12)).log2**2),Pulse.ar(pat)*2pi,mul:1/((1..16)**1.6)) * (Pulse.ar(pat)/10.0);
  sig = sig.softclip;
  Splay.ar(sig,1,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

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
