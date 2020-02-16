p.push();
p.bpm(90);
s.sync;
s.record("~/recordings/"++"date".unixCmd++".wav");
// dunn synth ///////////////////////////////////////
s.stopRecording
(
~dunn.ar(2);
~dunn.quant=0;
~dunn.fadeTime=0.4;
~dunn={
    var f = 90*.x[1,1/2,1/4,8] + SinOsc.kr(~tempo/4/(1..12),mul:0.15);
  var sig = LFTri.ar([~tempo/16/[1,2,3,4],~tempo/640,f]).range(0,2pi)+SinOsc.ar(f,mul:0.1);
  sig = Perlin3.ar(sig[0].cos,sig[1].sin,sig);
  sig = LeakDC.ar(sig);
  sig = Resonz.ar(sig,f,0.1);
  Splay.ar(sig,0.75,0.5);
};
~dunn.play;
);
~dunn.stop(4);
~dunn.clear;
~dunn.pause;
~dunn.resume;

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
