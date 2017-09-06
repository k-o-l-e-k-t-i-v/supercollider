

p.push;

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
    var change = 1/32/(1..3);
    var base = 55 * TChoose.kr(Impulse.kr(change),[1,2,1.5]);
    var ht = TChoose.kr( Impulse.kr(change),[0,102,306,600,804,1008]) + SinOsc.kr(1/(1..12)+0.1,mul:0.1);
    var f = base * (2**(ht/1200));
    var mod = LFTri.ar(change,mul:4);
  var sig = SinOsc.ar([change,1/4,f],SinOsc.kr((1..12)/12)*0.5pi).range(mod/2,mod*2) * (LFTri.ar(change));
  sig = Perlin3.ar(sig[0],sig[1],sig[2]) * (LFTri.ar(change)**1.2);
  sig = LeakDC.ar(sig);
  sig = CompanderD.ar(sig,3/4,1,1/3)*1.333;
  sig = sig.softclip;
  Splay.ar(sig,0.75,0.75);
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
  ~master = {|wet=0.25,lp=3500,hp=250,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  //sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  sig = CompanderD.ar(sig,3/4,1,1/3)*1.333;
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);
