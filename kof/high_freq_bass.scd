

(
    Ndef(\bass).fadeTime = 2.0;
    Ndef(\bass).quant = 2.0;
    Ndef(\bass,{
        Splay.ar(
            AllpassN.ar(
                LPF.ar(
                    SinOsc.ar(Decay.ar(Impulse.ar(8/fib(8)),0.0015).range(43,5)+55,mul:0.2) * Decay.ar(Impulse.ar(8/fib(8)),0.5)
                    ,1000)
                ,0.25,4,8)
            ,0.5,1)}).play;
    Ndef(\bass).mold(2);
)

(
    Ndef(\highfreq).fadeTime = 2.0;
    Ndef(\highfreq).quant = 2.0;
    Ndef(\highfreq,{
        Splay.ar(
            AllpassN.ar(
                HPF.ar(
                    SinOsc.ar(Decay.ar(Impulse.ar(44/fib(8)),0.0015+SinOsc.ar(1/4/(1.0001**(1..8)))).range(5,11000),mul:0.12) * Decay.ar(Impulse.ar(16/fib(8)),0.5)
                    ,3000)
                ,0.025,4,8)
            ,0.5,1)}).play;
    Ndef(\highfreq).mold(2);
)

