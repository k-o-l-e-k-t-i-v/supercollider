
s.boot;

(
Ndef(\saw,{
    Splay.ar(
        SinOsc.ar(SinOsc.ar(1/(2.1**(1..32))).range([22,22],[11000,22000])) * SinOsc.ar(1/4/(2**(1..32))).range(0,1)
    ,0.5,1,0.5)
}).play;
)
