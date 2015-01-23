
(

    ~tempo = 2;

    Ndef(\addi).quant = 2.0;
    Ndef(\addi,
         {|note = 22,fre = 1,mod = 1|
          ~f = {(note.midicps)*fre};
          Splay.ar(

              FreeVerb.ar(
                  CompanderD.ar(
                      SinOsc.ar(
                          (~f)*(1..32) + (1.001**(1..32)) * mod.lag(0.15),
                          SinOsc.ar(~f/(1.0001**(1..32))*mod.lag(0.025) ).range(0,2pi),
                          mul:2/(1..32)
                      ) * Decay.ar(Impulse.ar(~tempo),TRand.ar(0.01,1.5,Impulse.ar(1/~tempo!32))) +
                      (SinOsc.ar(((31+36).midicps*(1..32))*mod,mul:1/(1..32)) * LFSaw.ar(1/(1..32)).squared) +
                      (SinOsc.ar(55+(1.0001**(1..32)),mul:1/(1..32)) * Pulse.ar(2,[1,1.5,1.25]) )
                      ,0.75,1,0.25)
                  ,0.33,2)
              ,0.2,1)

         }).play;

    Ndef(\addi)[1] = \set -> Ppar([
        Pbind(
            \dur,16,
            \fre, Pxrand([1,1.5,1.25,2,1.5,2],inf)
        ),
        Pbind(
            \dur,1/~tempo,
            \note, Pseq(([30,42,31,42]),inf)
        ),
        Pbind(
            \dur,4,
            \mod, Pxrand(([1,1.5,1.25,0.5,0.75,2]*0.5pi),inf)
        )
    ]);
);
)

s.scope
