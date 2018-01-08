
97.33/90
~tempo.quant=4;
~tempo={125.315/120*SinOsc.kr(125.315/120/4).range(0.95,1.05)};

// once synth ///////////////////////////////////////

(
~once.ar(2);
~once.quant=16;
~once.fadeTime=0.2;
~once={
    var mod2 =Duty.kr((1..16).nthPrime*2/~tempo,0,Dseq( (2**(([1200,600,306,1008,804])/1200) ),inf));
  var mod = Duty.kr((1..16).nthPrime*16/~tempo,0,Dseq([1,2,4,8],inf)) * mod2;
  var mel = Duty.kr((1..16).nthPrime*4/~tempo,0,Dseq([1,2,4,8,1.5,4/3,1/2,1/4,1/8],inf));
  //         |       |       |       |       |  
  var f = 432 * mod / ((((2..17).nthPrime)%((1..16).nthPrime))) / mel;//[150,133,200,1000];
  var env = (Decay.ar(Impulse.ar(4/(1..16).nthPrime*~tempo),0.12*((1..16).nthPrime**0.25)) );
  var sig = SinOsc.ar(f/[1,2,4],SinOsc.ar(f/2.01)*0.05pi*(env**LFTri.ar(~tempo/16/(1..16).nthPrime).exprange(0.1,40)),mul:1/((1..16).nthPrime**0.5)); 
  sig = sig * env;
  sig = sig + BPF.ar(Dust.ar(f/10,mul:env*10),f,0.002);
  sig = CompanderD.ar(sig,3/4,1/3,1/2);
  Splay.ar(sig,0.75,0.75);
};
~once.play;
);
~once.stop(1);
~once.clear;
~once.pause;
~once.resume;


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
