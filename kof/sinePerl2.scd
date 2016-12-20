

p.push();

(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.5,lp=3500,hp=250,len=10,rev = 3|
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

// sineperl synth ///////////////////////////////////////

(
~sineperl.ar(2);
~sineperl.clock = p.clock;
~sineperl.quant=2;
~sineperl.fadeTime=4;
~sineperl={
  var f = TChoose.kr(Impulse.ar(1/16/(1..8)),[60,48,72,36].midicps/2);
  var carriage = SinOsc.ar([f,1/f/((1..8)**2),1/f],SinOsc.kr(f/100.01)) * LFTri.ar(f/100000,mul:4);
  var perlin = Perlin3.ar(carriage[0],carriage[1],carriage[2]) * carriage;
  var sig = Normalizer.ar(LeakDC.ar(perlin))/4 * LFTri.ar(1/16/(1..8));
  Splay.ar(sig,0.5,0.25);
};
~sineperl.play;
);
~sineperl.stop(4);
~sineperl.clear;
~sineperl.pause;
~sineperl.resume;
