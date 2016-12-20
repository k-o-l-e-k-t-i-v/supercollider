

p.push();

(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.5,lp=3500,hp=250,len=20,rev = 3|
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
  var mod = TChoose.kr(Impulse.kr(1/16/(1..8)),[1,2,1.5,1.33333,1,1,1]).lag(4);
  var f = TChoose.kr(Impulse.kr(1/16/(1..8)),[60,48,72,36].midicps).lag(4) / mod;
  var carriage = SinOsc.ar([f,1/f/((1..8)**2),1/f],SinOsc.kr(f/100.001),mul:1/(1..8)) * LFTri.ar(f/100000,mul:4) + LFDNoise1.kr(1/400!8);
  var perlin = Perlin3.ar(carriage[0],carriage[1],carriage[2]) * carriage;
  var sig;
  
  sig = Resonz.ar(perlin,f*[1,2,4,1.5,1/2],0.02);
  sig = Normalizer.ar(LeakDC.ar(perlin))/8 * LFTri.ar(1/16/(1..8));
  sig = Vibrato.ar(sig,[3,4,5,6],0.02);
  sig = LPF.ar(sig,5000);
  sig = CompanderD.ar(sig,3/4,1/2,1);
  Splay.ar(sig,0.5,0.25);
};
~sineperl.play;
);
~sineperl.stop(4);
~sineperl.clear;
~sineperl.pause;
~sineperl.resume;


(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
)
