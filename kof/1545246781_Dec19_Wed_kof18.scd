

p.push();
b = Buffer.allocConsecutive(8,s,512,1);


// rec synth ///////////////////////////////////////

(
~rec.ar(2);
~rec.quant=2;
~rec.fadeTime=0.2;
~rec={
  var sig = [
  LFNoise1.ar(512),
  LFNoise0.ar(512),
  LFNoise2.ar(512),
  LFNoise1.ar(512),
  LFNoise2.ar(512),
  LFNoise0.ar(512),
  LFNoise2.ar(512),
  LFNoise1.ar(512),
  ];
  sig = LPF.ar(sig,5000);
  //sig = sig * env;
  8.do{|i|
    RecordBuf.ar(sig[i],b.first.bufnum+i,loop:0);
  };

  //Splay.ar(sig,0.75,0.5);
};
//~rec.play;
);
~rec.stop(4);
~rec.clear;
~rec.pause;
~rec.resume;


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
    var mod = Duty.kr(1/50/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
  var t = LFSaw.ar(4/[3,(1..12),3.001]) * 2pi;
  var sig = VOsc.ar(Perlin3.ar(t[0].cos,t[1].sin,t[2].sin).range(b.first.bufnum,b.last.bufnum),LFSaw.ar(1/16/(1..12)).range(1,10000)/(2..12).log2);
  sig = BPF.ar(sig,100*(2..12).log2 *.x mod,LFNoise1.kr(1/16!12).exprange(0.01,0.05));
  sig = Compander.ar(sig,3/4,1/2,1);
  sig = Normalizer.ar(sig);
  Splay.ar(sig,0.15,0.75);
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
