

(
    Ndef(\a).quant = 2.0;
    Ndef(\a,{
        Splay.ar(
            CombC.ar(
                LPF.ar(
                    CombL.ar(
                        CombN.ar(
                            SinOsc.ar(43.2*(2.0001**(1..8))) * Pulse.ar(2**TRand.ar(1,8,Impulse.ar(1/4!8)).round(1).lag(0.1/(1..8)) )
                            ,1/50,1/49,32)
                        ,1/50,1/48,4)
                    ,22+SinOsc.ar(2**TRand.ar(1,8,Impulse.ar(1/4!8)).round(1).lag(4/(1..8)) ).range(0,4000)) * Pulse.ar(1/(2**(1..8)))
                ,1/50,1/49.9999+(WhiteNoise.kr(0.00001)),8) * LFPulse.ar(8/(2**(1..8)))
            ,0.15+SinOsc.ar(1/(1..4)).range(0,0.5),0.75,0.5)}).play;
)
