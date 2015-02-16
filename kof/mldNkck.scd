s.boot;
(
  Ndef(\a).quant = 2.0;
  Ndef(\a,{

    ~mod1 = Duty.ar(4,0,Dseq([-2,2,0,6,12],inf));
    ~mod2 = Duty.ar(4,0,Dseq([0,0,2,12,0],inf));
    ~mod3 = Duty.ar(1/8,0,Dseq([0,-12,0,0,0,0],inf));

    ~f = Duty.ar(1/4,0,Dseq(([60+~mod1+~mod3,69+~mod2+~mod3]).midicps,inf));
    ~att = SinOsc.ar(1/32).range(0.01,0.04);

    ~sig = Limiter.ar(
      SinOsc.ar(~f.lag(1/120),mul:0.3) +
      LFSaw.ar(~f.lag(1/320) * 1.5,mul:0.1) +
      LFSaw.ar(~f.lag(1/320) * 0.5,mul:0.1) * 0.75
    );

      ~env = LFSaw.ar(4).squared;


      FreeVerb.ar(
        CombN.ar(
            RLPF.ar(
              CompanderD.ar(~sig,0.01+SinOsc.ar(4/(1..16)).range(0.0001,0.9),1,1/10,~att,0.2) * 
              ~sig
            ,~f)
        ,0.05*(1.0001**(1..16)),4,32)
      ,0.133,2)

  }).play;
  Ndef(\a).mold(2);
);
////////////////////////////////////
(
  Ndef(\kick).quant = 2.0;
  Ndef(\kick,{
    ~speed = 4;

    ~sig = LPF.ar(
      Ringz.ar(
        Impulse.ar(~speed / [1,2]),
        TExpRand.ar(44.0,55.0,Impulse.ar(4)),
        TExpRand.ar(0.15001,1.5,Impulse.ar(4)))
      , 500 );
    ~cmp = CompanderD.ar(~sig,0.15,1,0.26, clampTime: 0.004, relaxTime: 0.08);
    
    Splay.ar(
      ~cmp * 3
      ,0.5,0.75,0.5)
  }).play; 
)


