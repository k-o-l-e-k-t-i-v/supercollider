

p.bpm(90);
p.push();



// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=4;
~one.fadeTime=4;
~one={
    var mod = Duty.kr(4*(1..12).nthPrime,0,Dseq([1,2,1.5,1.33333],inf));
    var mod2 = Duty.kr(16*(1..12).nthPrime,0,Dseq([1,2,1.5,1.33333],inf));
    var env = Decay2.kr(Impulse.kr(4/(1..12).nthPrime),0.05,0.05*(1..12)) ** (1/(1..12));
  var sig = SinOsc.ar(500/.x[1,2,1.5,4/3,4,8]*.x[1,1.5,1.333334,2,4]/mod*mod2,SinOsc.ar(7*LFNoise2.kr(1/4/[1,2,3,4])*env)*env);
  sig = sig ** LFNoise2.kr(1/16!12).range(0.9,1.5) * (env**1.2);
  Splay.ar(sig,0.5,0.25);
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
