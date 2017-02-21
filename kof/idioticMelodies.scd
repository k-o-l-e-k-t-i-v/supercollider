

p.push();

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
~one.quant=4;
~one.fadeTime=4;
~one={
  var mod = Duty.kr(4*[1,4,16],0,Dseq([1,2,1.5,1.33333],inf));
  var f = [60,[64,36,48],[69,24,72]].midicps / mod;
  var sig = SinOsc.ar([4,f,1/[1,2,3]]) * LFNoise2.kr(1/16!3).exprange(1/10,4) + LFSaw.ar([0,1/600,0],mul:4);
  sig = Perlin3.ar(sig[0],sig[1],sig[2]) ;
  sig = Formlet.ar(sig,f,1/f,2/f) * sig + Formant.ar(f,f+(sig*100),f+(sig/4));
  sig = Normalizer.ar(sig) * (LFTri.ar(4/[1,2,3])**2);
  sig = LPF.ar(sig,2800);
  sig = CompanderD.ar(sig,3/4,1/LFNoise2.kr(1/16!3).range(1,4),1)/3;
  Splay.ar(sig,0.15,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;




