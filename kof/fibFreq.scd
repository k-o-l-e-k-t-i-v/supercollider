
s.boot;
p.push();
p.bpm(48);

550/(8.fib)

48*3/4

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=4;
~one.fadeTime=4;
~one={
    var mood = Duty.kr([4,8,16]/~tempo,0,Dseq([1,2,4,8,1.5,1],inf));
    var f = 1500/(12.fib(2,3).log)/mood;
    var env = Decay.ar(Impulse.ar(~tempo*4/12.fib),(1..12)/2);
  var sig = SinOsc.ar(f,SinOsc.ar(env**0.12*f/1024)*2pi) * LFTri.ar(~tempo/4/12.fib) * env;
  f.postln;
  sig = CompanderD.ar(sig,3/4,1/2,1);
  Splay.ar(sig,0.5,0.5);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

SelectX.help
SelectX.

7.5/8
// one synth ///////////////////////////////////////

(
~perl.ar(2);
~perl.clock = p.clock;
~perl.quant=4;
~perl.fadeTime=4;
~perl={
    var change = ~tempo/[1,2,3,4,5,6]/32;
    var imp = Impulse.kr(change);
    var base = TChoose.kr(imp,[50,100,250,500,5000]*(44/50)) * TChoose.kr(imp,[1,2,1/2,4])/2;
    var ht = TChoose.kr( Impulse.kr(change),[102,306,600,804,1008]);
    var f = base * (2**(ht/1200));
  var sig = SinOsc.ar(f,SinOsc.ar(base/.x[256,1024,2048])*0.5pi,mul:0.4) * (LFTri.ar(change)**1.2);
  sig = sig + ((Perlin3.ar(sig,SinOsc.ar(7.5/16),SinOsc.ar(7.5/4/640)*4))/8);
  
  sig = LeakDC.ar(sig);
  sig = CompanderD.ar(sig,3/4,1/2,1) * LFPulse.ar(~tempo*4/12.fib);
  Splay.ar(sig,0.5,0.15,SinOsc.ar(7.5));
};
~perl.play;
);
~perl.stop(16);
~perl.clear;
~perl.pause;
~perl.resume;

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
//  sig = PitchShift.ar(sig,0.0005,TChoose.kr(Impulse.kr(1/15!2),1/[1,2,4,3/4,4/3]).lag(1/100));
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);
