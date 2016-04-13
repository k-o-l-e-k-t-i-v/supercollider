(

  ~mod.quant=2;
  ~mod = {
    var oo4 = Duty.kr(16,0,Dseq([1,2,1.5,4],inf));
    var oo3 = Duty.kr(4,0,Dseq([1,2,4,0.5]/oo4,inf));
    var oo2 = Duty.kr(1/3,0,Dseq([1,2,1.5,1.3333]/oo3,inf));
    var oo1 = Duty.kr(1/4,0,Dseq([1,2,1.5,1.25]/oo2,inf));
    oo1;
  };
  ~s.quant=2;
  ~s.fadeTime=2;
  ~s.play;
  ~s = {
    var sig = LFSaw.ar([50,1500/~mod,50,100],mul:0.1);//.ar(4*[1,2,3,4]),mul:0.1);
    sig = sig + LFNoise2.ar(4000/[1,2,3,4]/~mod,mul:0.1);
  sig = sig * Pulse.ar([1/2,2,1,2]);
  sig = CombN.ar(sig,1/4,1/4,1);
  sig.softclip;
};

~s[50] = \filter -> {|sig|
  MoogFF.ar(sig,1500/~mod.lag(1/8),LFNoise2.kr(1/4!2).range(1,3))+sig;
  Limiter.ar(sig);
  //CompanderD.ar(RLPF.ar(GVerb.ar(sig,20,5)/8,1500/~mod)+sig,3/4,1/2,1/2).softclip/4;
};
)

