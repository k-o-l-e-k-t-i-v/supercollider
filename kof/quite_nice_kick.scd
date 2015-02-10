
s.boot;


(
  Ndef(\a,{
    ~speed = 8;

    ~sig = LPF.ar(
      Ringz.ar(
        Impulse.ar(~speed / [1,2]),
        TExpRand.ar(44.0,55.0,Impulse.ar(4)),
        TExpRand.ar(0.15001,1.5,Impulse.ar(4)))
      , 500 );
    ~cmp = CompanderD.ar(~sig,0.15,1,0.26, clampTime: 0.004, relaxTime: 0.08);
    
    Splay.ar(
      ~cmp * 3
      ,0.5,1,0.5)
  }).play; 
)


