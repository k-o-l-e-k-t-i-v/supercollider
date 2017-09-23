

p.push;

7.5/8
// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
    var change = ~tempo/[1,2,3,4,5,6]/4;
    var imp = Impulse.kr(change);
    var base = TChoose.kr(imp,45*[10,10/4,10/2,10*2,1]) * TChoose.kr(imp,[1,2,1/2,4])/2;
    var ht = TChoose.kr( Impulse.kr(change),[102,306,600,804,1008]);
    var f = base * (2**(ht/1200));
  var sig = SinOsc.ar(f,SinOsc.ar(base/.x[256,1024,2048])*0.5pi,mul:0.4) * (LFTri.ar(change)**1.2);
  //sig = Resonz.ar(sig,f,0.02) * 4;
  Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

TRand.help

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
