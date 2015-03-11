
(
  ~a.play;
  ~a.quant=2;
  ~a={
    var sig,m;
    m = {LFTri.ar(222/(1..8))*25};

    sig = SinOsc.ar(16000/(1..16),mul:0.05);
    sig = sig * LFPulse.ar(TExpRand.ar(1/4!16,16,Impulse.ar(4)));
    sig = CompanderD.ar(sig,0.5,1,1/10);
    sig = CombN.ar(sig,1,8,8);
    sig = FreeVerb.ar(sig,0.31,2);

    Splay.ar(sig);

  };

)
