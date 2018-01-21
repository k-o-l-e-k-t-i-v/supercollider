

p.push();
p.bpm(105)

b=Buffer.alloc(s,512,1);

// rec synth ///////////////////////////////////////

(
~rec.ar(2);
~rec.clock = p.clock;
~rec.quant=16;
~rec.fadeTime=4;
~rec={
  var sig = LFNoise1.ar(4); 
  sig = Mix(sig);
  RecordBuf.ar(sig,b.bufnum,0.2,0.5);
};
);
~rec.stop(4);
~rec.clear;
~rec.pause;
~rec.resume;

// ss synth ///////////////////////////////////////

(
~ss.ar(2);
~ss.clock = p.clock;
~ss.quant=16;
~ss.fadeTime=4;
~ss={
  var sig = LFSaw.ar(100+((1..4)/10000)).range(0,1) + LFSaw.ar(~tempo/16/[1,2,3],mul:4);
  sig = Perlin3.ar(sig[0],sig[1],sig)**(LFNoise1.kr(~tempo/16/[1,2,3])**2);
  sig = Shaper.ar(b.bufnum,sig);
  sig = LPF.ar(sig,1500);
  sig = CompanderD.ar(sig,3/4,1/2,1);
  Splay.ar(sig,0.5,0.25);
};
~ss.play;
);
~ss.stop(4);
~ss.clear;
~ss.pause;
~ss.resume;


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
