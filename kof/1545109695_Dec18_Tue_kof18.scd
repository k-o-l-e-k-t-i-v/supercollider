


p.push();

b=Buffer.read(s,"/home/kof/theChange.wav");
n=Buffer.alloc(s,2048,1);


// plaer synth ///////////////////////////////////////

(
~plaer.ar(2);
~plaer.clock = p.clock;
~plaer.quant=2;
~plaer.fadeTime=4;
~plaer={
  var sig = AudioIn.ar(1,1);
  RecordBuf.ar(sig,n.bufnum,0,0.33);
  Splay.ar(sig,0.5,0.25);
};
//~plaer.play;
);

~plaer.stop(4);
~plaer.clear;
~plaer.scope;
~plaer.resume;



// osc synth ///////////////////////////////////////

(
~osc.ar(2);
~osc.clock = p.clock;
~osc.quant=2;
~osc.fadeTime=4;
~osc={
  var sig = Osc.ar(n.bufnum,[3/1920,1,3]);
  sig = Perlin3.ar(sig[0],sig[1],sig[2]);
  sig = LeakDC.ar(sig);
  sig = BPF.ar(sig,500,0.2);
  sig = LeakDC.ar(sig);
  sig = Normalizer.ar(sig);
  sig = sig * Pulse.ar(4/[1,2,3,4]);
  Splay.ar(sig,0.15,0.5);
};
~osc.play;
);
~osc.stop(4);
~osc.scope;
~osc.clear;
~osc.pause;
~osc.resume;

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
