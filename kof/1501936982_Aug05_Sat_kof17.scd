


p.push();


// complexNoise synth ///////////////////////////////////////

(
~complexNoise.ar(2);
~complexNoise.clock = p.clock;
~complexNoise.quant=2;
~complexNoise.fadeTime=4;
~complexNoise={
    var sp = 32*[1,2,4];
    var mood = Duty.kr(sp*[1,2,3],0,Dseq([1,2,1.5,1.33333]*.x[1,2,1/2,1/4,4],inf)) ;
  var time = LFSaw.ar(1/500/((2..20).log**0.95/mood)).range(0,2pi) + LFTri.kr(1/5000/(2..20),mul:10);
  var x = time.cos;
  var y = time.sin;
  var z = SinOsc.ar(432.01/[1.5,1.505,2.004]/mood+((2..20).log**0.0995)).range(0,2pi) + LFTri.kr(1/5001/(2..20),mul:10);
  var sig = Perlin3.ar(x,y,z) * (LFTri.ar(1/sp/[1,2,3])**3);
  sig = LeakDC.ar(sig);
  sig = LPF.ar(sig,5000);
  sig = Vibrato.ar(sig,[6,7,8],0.2);
  sig = CompanderD.ar(sig,3/4,1/2,1);
  Splay.ar(sig,0.5,0.5);
};
~complexNoise.play;
);
~complexNoise.stop(30);
~complexNoise.clear;
~complexNoise.pause;
~complexNoise.resume;

(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.15,lp=3500,hp=150,len=10,rev = 3|
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
