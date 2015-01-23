
(
    Ndef(\addi,
         {|note = 22,fre = 1,mod = 1|
          ~f = {(note.midicps)*fre};
          Splay.ar(
              
              SinOsc.ar(
                  (~f)*(1..32) + (1.001**(1..32)) * mod.lag(0.15),
                  SinOsc.ar(~f/(1.0001**(1..32))*mod.lag(0.3) ).range(0,2pi),
                  mul:1/(1..32)
              )

              ,0.2,1)
         }).play;

    Ndef(\addi)[1] = \set -> Ppar([
        Pbind(
            \dur,1/4,
            \fre, Pseq([1,1.5,1.25,1.25],inf)
        ),
        Pbind(
            \dur,1/4,
            \note, Pseq(([35,30,30+12,35-12,35,30,35-12,35+12]),inf)
        ),
        Pbind(
            \dur,4,
            \mod, Pseq((1+[1,1.5,1.25,0.5,0.75,2]),inf)
        )
    ])
);
)

s.scope
