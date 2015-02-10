

(
    Ndef(\a).quant = 2.0;
    Ndef(\a,{
        Splay.ar(
            CombC.ar(
                LPF.ar(
                    CombC.ar(
                        CombC.ar(
                            SinOsc.ar(43.2*(2.01**(1..8))) * Pulse.ar(2**TRand.ar(1,8,Impulse.ar(1/2!8)).lag(1/(1..8)) )
                            ,1/50,1/49,1)
                        ,1/50,1/48,1)
                    ,800+SinOsc.ar(2**TRand.ar(1,8,Impulse.ar(1/4!8)).lag(4/(1..8)) ).range(0,8000)) * Pulse.ar(8/(2**(1..8)))
                ,1/50,1/48,4)
            ,0.15+SinOsc.ar(1/(1..4)).range(0,0.5),0.45,0.5)}).play;
)
