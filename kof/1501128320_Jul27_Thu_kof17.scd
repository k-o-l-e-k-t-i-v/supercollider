
p.push();
p.bpm(60*1.47);



// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
    var sig;
    var change = Impulse.kr(~tempo/16!3);
    var base = TChoose.kr(change,[[110.44,55.1,220.001*4],[55,110.5,2200.34],[110,220.1,8800.1]]) / TChoose.kr(change,[1,2,1.5,1.3333,2,1/2,1.125,1.66666]/.x[1,2,4]);
    var a = SinOsc.ar(~tempo*[0.1,1/2.002,1/8.01,1/16,1/32,1/64],add:1,mul:0.5)/[1,8,64];
  var f = [] ++ [SinOsc.ar(base/[1,1.5,1.33333,1,1,1,1/2,1/4,1/8],SinOsc.ar(base/32/[2,32,16])/32*a,add:1,mul:a)] ++ [SinOsc.ar(base/3200/1.001+LFNoise1.kr(~tempo/32!3).range(-1/8,1/8),add:1)] ++ [LFTri.ar(~tempo/600/[1,2,3])*40];
  //f = CombL.ar(f,1,8/base,4);
  sig = Perlin3.ar(f[0]*LFNoise1.kr(~tempo/16!3).exprange(1/4,2),f[1],f[2]) * (LFTri.kr(~tempo/16)**[1.2,1.5,4]);
  sig = sig ** LFNoise2.kr(~tempo/32/[1,2,3]).range(0.3337,1.6) ;//+ SinOsc.ar(f/[2,1,1.5],SinOsc.kr(f/320)*pi);
  sig = LPF.ar(sig,1500);
  sig = HPF.ar(sig,30);
  sig = LeakDC.ar(sig);
  sig = CompanderD.ar(sig,3/4,1/1.5,1);
  Splay.ar(sig,0.5,0.5);
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
