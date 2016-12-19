
p = p.push();
p.bpm(120);
p.restartClock;

TempoClock.default = p.clock;

(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.35,lp=3500,hp=250,len=10,rev = 2|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = Compander.ar(sig,3/4,1/1.1,1/3);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
    var len = 1;
  var ran = 0.99/4;
  var mod = Duty.kr(16/~tempo*[1,2,3],0,Dseq([1,2,4,8,1,2,16] ++ 1/[1,2,4,8,1,2],inf)).lag(1);
  var f = TWChoose.kr(Impulse.kr(~tempo/[1,2,3]),[60,36,72].midicps,[1,1,1,1/2,0.1],0).lag(1) * mod;
  var phase = SinOsc.ar(~tempo/64/[1,2,3]).range(0.01,0.95);
  var width = LFTri.ar(1/64/[1,2,3]*~tempo).range(0.01,0.95);
  var sig = Integrator.ar( SinOsc.ar(f,phase,width), SinOsc.ar(f.lag(0.001)).range(0.001,0.999) ) * ran + SinOsc.ar(1/64/[1,2,3]);
  sig = Perlin3.ar(sig[0],sig[1],sig[2]);
  sig = LeakDC.ar(sig);
  sig = sig;// * LFTri.ar(~tempo/[1,2,3]/16);//Decay.ar(Impulse.ar(~tempo/[1,2,3,4]/2),sig.range(0.01,len)*~tempo);
  sig = Limiter.ar(sig,0.9,0.002);
  sig = CompanderD.ar(sig,3/4,1/2,1,0.002,~tempo/4).softclip/8;
  //sig = Normalizer.ar(sig)/10;
  //sig = Clip.ar(sig,0.99);
  sig = HPF.ar(sig,50);
  Splay.ar(sig,0.25,0.15);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


LFPulse.help
Integrator.help
