// Array

Array

(
Array.fill(10, {
    [0.1, 0.6, 0.3].windex;
}).postln;
)

Bag.fill(14, { arg i; i.rand });

Array.fill(4, { arg i; i * 2 })

Array.fill(5, Impulse.kr(0.25).range(1,8)).postln;


{VarSaw.ar(140)*Pulse.kr(Array.fill(5, Impulse.kr(0.5).range(5,50).rand))}.play;

