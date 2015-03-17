

~a.play;

(
  ~mod.quant=1;
  ~b.quant=1;
  ~c.quant=1;
)

(
  ~b={Duty.kr(1/4,0,Dseq([0,2,0,2,0,2,1,2],inf))};
  ~c={Duty.kr(1/8,0,Dseq([2,3,2,3,0],inf))};
  ~mod={Duty.kr(4,0,Dseq([1,2,1.5,1,1.75],inf))};
)

(
  ~a.fadeTime =0;
  ~a.quant= 2;
  ~a={
    var sig = [
      SinOsc.ar(43.2*(1.06**(1..12))),
      VarSaw.ar(4320*~mod*(1.02**(1..8))),
      HPF.ar(WhiteNoise.ar(0.1!2),TRand.ar(8000,16000,Impulse.ar(1/4))),
      SinOsc.ar(43.2*(1.25**(1..8))) * LFTri.ar(1/4/fib(8)).exprange(0.0001,1.0),
    ];

    sig = Select.ar(~b,sig*0.5) + Select.ar(~c,sig*0.5);
    Splay.ar(sig,0.1);
  };

  ~a[50]=\filter->{|in|BBandPass.ar(in,LFTri.ar(1/16*([1,1.01]),{Rand(0,2pi)}!4).exprange(1600.01,22))*0.5+(in*0.5)};
  ~a[52]=\filter->{|in|CompanderD.ar(in,0.95,1,1/10)};
)
