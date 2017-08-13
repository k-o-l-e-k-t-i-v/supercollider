

p.push();

// neutorn synth ///////////////////////////////////////

(
~neutorn.ar(2);
~neutorn.clock = p.clock;
~neutorn.quant=2;
~neutorn.fadeTime=4;
~neutorn={
  var seek = VarSaw.ar([48000/1024,[50.002,100.0003,150.023,75.0345]+LFNoise2.kr(1/320!4,mul:pi),1/1000],mul:[1/5000,LFTri.ar(1/(1..4)/16).range(0,[0.71,0.71,0.2,0.1]),4]) + 1;
  var sig = Perlin3.ar(seek[0],seek[1],seek[2]);
  sig = SinOsc.ar([4,5,6],sig*2pi);// * SinOsc.ar(sig.range(5,1/500),sig**0.2*1pi);
  sig = LeakDC.ar(sig);
  Splay.ar(sig,0.15,0.5);
};
~neutorn.play;
);
~neutorn.stop(4);
~neutorn.clear;
~neutorn.pause;
~neutorn.resume;

BBandPass.help


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
