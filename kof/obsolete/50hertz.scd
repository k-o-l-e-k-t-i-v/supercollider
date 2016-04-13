
s.boot;


(
    Ndef(\hertz).fadeTime = 8.0;
    Ndef(\hertz).quant = 2.0;
    Ndef(\hertz,{
        Splay.ar(
            CombN.ar(
                Resonz.ar(
                    LFSaw.ar(50+(1.001**(1..32)),mul:0.5).distort.distort.tanh *
                    LFSaw.ar(1/5/(2**(1..8))).squared
                    ,SinOsc.ar(1/5/(1.1**(1..12))).range(44,880))
                ,1/4/[25,50,75,100]+TRand.ar(0.0001,0.04,Impulse.ar(5/4/[1,2,4,8])).lag(1/50),
                16/[25,50,75,100]+TRand.ar(0.0001,0.5,Impulse.ar(5/[1,2,4,8])).lag(1/5),32)

        )}).play;
);

