
p.push();

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
    var mod = Duty.kr(16*[1,2,3,4],0,Dseq([1,2,1.5,1.33333,4,8,1/4,1/8],inf));
    var base = [72,60,48].midicps/mod;
    var ramp = LFTri.ar(base*[2,5,7,9].log2)**(LFNoise2.kr(1/16/[1,2,3,4])**1.5) + SinOsc.kr(base/32 + 0.01);
  var sig = SinOsc.ar(base*ramp,ramp*2pi)/2 * LFTri.kr(1/16/[1,2,3,4]);
  sig = BPF.ar(sig,base,1);
  sig = BPF.ar(sig,base*4+10,1);
  sig = BPF.ar(sig,base*2-5,1);
  sig = LeakDC.ar(sig);
  sig = Normalizer.ar(sig);
  sig = AllpassC.ar(sig,3,LFNoise1.kr(1/32!8)**2/1000.0+0.01,3);
  //sig = SelectX.ar(LFSaw.kr(1/[1,0.01])*sig.size,sig );
  sig = Resonz.ar(sig,base*2,0.01);
  sig = Normalizer.ar(sig);
  Splay.ar(sig,0.15,0.25);
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
