
(

    ~tempo = 4;

    Ndef(\addi).quant = 2.0;
    Ndef(\addi,
         {|note = 22,fre = 1,mod = 1|
          ~f = {(note.midicps)*fre};
          Splay.ar(

              FreeVerb.ar(
                  CombN.ar(
                      CompanderD.ar(
                          SinOsc.ar(
                              (~f)*(1..32) + (1.001**(1..32)) * mod.lag(0.15),
                              SinOsc.ar(~f/(1.0001**(1..32))*mod.lag(0.025) ).range(0,2pi),
                              mul:1/(1..32)
                          ) * Decay.ar(Impulse.ar(~tempo),TRand.ar(0.1,2,Impulse.ar(4!32)))
                          ,0.75,1,0.25)
                      ,0.02,4,8)
                  ,0.33,2)
              ,0.2,1)

         }).play;

    Ndef(\addi)[1] = \set -> Ppar([
        Pbind(
            \dur,4,
            \fre, Pxrand([1,1.5,1.25,2,1.5,2],inf)
        ),
        Pbind(
            \dur,1/~tempo,
            \note, Pseq(([30,30+12,35-12,36,30,35-12,35+12]+24),inf)
        ),
        Pbind(
            \dur,8,
            \mod, Pxrand(([1,1.5,1.25,0.5,0.75,2]*0.25pi),inf)
        )
    ]);
);
)

s.scope
