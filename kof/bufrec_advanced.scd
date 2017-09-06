

p.push();
b = Buffer.alloc(s,s.sampleRate * 2, 1);

// recorder synth ///////////////////////////////////////

(
~recorder.ar(2);
~recorder.clock = p.clock;
~recorder.quant=2;
~recorder.fadeTime=4;
~recorder={
  var sig = SinOsc.ar([1/32,1/2,1/16]) + LFTri.ar(1/600);
  sig = Perlin3.ar(sig[0],sig[1],sig[2])/2;
  RecordBuf.ar(sig,b.bufnum,0,0.15);
  Splay.ar(sig,0.5,0.25);
};
//~recorder.play;
);
~recorder.stop(4);
~recorder.clear;
~recorder.pause;
~recorder.resume;

record  

// shaper synth ///////////////////////////////////////

(
~shaper.ar(2);
~shaper.clock = p.clock;
~shaper.quant=2;
~shaper.fadeTime=4;
~shaper={
  var sig = SinOsc.ar(50);
  sig = Shaper.ar(b,Mix(sig,1));
  Splay.ar(sig,0.5,0.75);
};
~shaper.play;
);
~shaper.stop(4);
~shaper.clear;
~shaper.pause;
~shaper.resume;


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
