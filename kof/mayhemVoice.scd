

(
    ~gen.quant=2;
~gen={
	var sig;
	sig = DWGBowed.ar(45,LFSaw.ar(~tempo/4)**2,LFSaw.kr(~tempo/16),LFSaw.kr(~tempo/32),1,LFTri.kr(~tempo/[1,2,3,4]).range(0.002,0.94));
	sig = DWGSoundBoard.ar(sig);
	sig = RLPF.ar(sig,LFSaw.ar(~tempo/4/[1,2,3,4]).range(150,1500));
	Splay.ar(sig,0.15,0.1);
};
~gen.play;
)

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
