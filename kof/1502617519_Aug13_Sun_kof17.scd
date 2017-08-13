
p.push();
p.tempo(90);

// lombardia synth ///////////////////////////////////////

(
~lombardia.ar(2);
~lombardia.clock = p.clock;
~lombardia.quant=2;
~lombardia.fadeTime=4;
~lombardia={
    var tonic =  Duty.kr(32/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
    var f = [60,48,84].midicps / Duty.kr([4,8,16]/~tempo,0,Dseq([1,2,1.5,1.33333,1,2,1.5,1.666666,1,2,4,1/2],inf)).lag(1) * 2 + SinOsc.ar([10,11,12],mul:pi);
    var mod = 1.5;
  var sig = LFSaw.ar([48000/256,f/tonic,48000/4]/mod).range(0,2pi).sin + 1 / 2 + LFSaw.ar(1/60,mul:4);
  sig = Perlin3.ar(sig[0],sig[1],sig[2]) ** LFNoise1.ar(1!3).range(0.6,2.5);
  sig = SinOsc.ar(f/16.013/mod,sig*2pi) * CombN.ar(LFTri.ar(~tempo / 4 / [1,2,3]),~tempo,~tempo,4);
  sig = BMoog.ar(sig,f*4.001/mod,LFNoise2.kr(1/15!4).range(0.1,0.9));
  sig = LeakDC.ar(sig);
  Splay.ar(sig,0.5,0.25);
};
~lombardia.play;
);
~lombardia.stop(4);
~lombardia.clear;
~lombardia.pause;
~lombardia.resume;

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


BMoog.help
