

p = ProxySpace.push(s);

(
  Tdef(\aa,
       {
         var z1 = 0;
         var z2 = 0;
         var z3 = 0;
         loop{
           z1 = z1 + [-4,12,-12,7].choose; if(z1>60,{z1=0}); if(z1<(-60),{z1=0}); ~a.set(\a,z1);
           z2 = z2 + [-4,12,-12,7].choose; if(z2>60,{z2=0}); if(z2<(-60),{z2=0}); ~b.set(\a,z2);
           z3 = z3 + [-4,12,-12,7].choose; if(z3>60,{z3=0}); if(z3<(-60),{z3=0}); ~c.set(\a,z3);


           ([2,4].choose).wait;
         }
       }).play;


  ~a.quant = 2;
  ~b.quant = 2;
  ~c.quant = 2;


  ~a = {arg a=0; Splay.ar(SinOsc.ar( [60+a,65+a,67+a].midicps,mul:0.33)* Decay.ar(Impulse.ar(4/[1,2,4]),0.5))};
  ~b = {arg a=0; Splay.ar(SinOsc.ar( [60+a,65+a,67+a].midicps,mul:0.33)* Decay.ar(Impulse.ar(4/[4,2,1]),1.75))};
  ~c = {arg a=0; Splay.ar(SinOsc.ar( [60+a,65+a,67+a].midicps,mul:0.33)* Decay.ar(Impulse.ar(4/[1,2,3]),0.95))};

  ~mix = {
    Splay.ar(
      FreeVerb.ar(
        CombN.ar(
          CompanderD.ar(
            ~a+~b+~c
            ,0.5,1,1/10,0.02)
          ,1,1,4)
        ,0.13,10)
    )
  };
  ~mix.play;
)

