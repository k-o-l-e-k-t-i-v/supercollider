




p.push();

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=8;
~one.fadeTime=4;
~one={
    var r = LFTri.kr(1/16).exprange(1/16/[1,2,3,4]+LFNoise2.kr(1/(1..12),mul:0.01),2);
    var mod = Duty.kr(16*[1,2,3,4],0,Dseq([1,2,1.5,1.33333,4,3,2,1],inf));
  var pos = SinOsc.ar(1/[600,6000]);
  var f = 220*(2**([102,600,1004]/1200))/mod;
  var sig =SinOsc.ar(f,SinOsc.ar(1/[8,4.23,2.1]),mul:LFTri.ar(1/16/(1..12))**2 ).range(0,2pi);
  var x,y;
  sig = CombL.ar(sig,256/f,4/f.lag(1),4);
  x = (sig.cos+1) * r;
  y = (sig.sin+1) * r;
  sig = Perlin3.ar(pos[0],pos[1],x) + Perlin3.ar(pos[0],y,pos[1]) * LFTri.ar(1/16/(1..4));
  sig = LeakDC.ar(sig);
  sig = LPF.ar(sig,3000);
  sig = CompanderD.ar(sig,1/2,1/2,1);
  sig = Compander.ar(sig,~kick.ar + ~kick2.ar,0.1,1,0.1);
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
