
p.push
p.bpm(88)
~tempo={SinOsc.kr(1/16).range(87/60,89/60)};

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=8;
~one.fadeTime=4;
~one={
    var f = [60,57,55].midicps + SinOsc.kr(~tempo*[4,5,6],mul:0.2);
  var sig = SinOsc.ar([f,~tempo/32,1/[8,16,32]*~tempo],SinOsc.ar(~tempo/8).range(0,2pi)) + LFSaw.ar(f*8,SinOsc.ar(~tempo*16)*2pi,mul:0.01) * LFTri.ar(~tempo/16/[1,2,3]) / 1.5;
  sig = Perlin3.ar(sig[0],sig[1],sig[2]);
  sig = LeakDC.ar(sig);
  Splay.ar(sig,0.05,0.45);
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
