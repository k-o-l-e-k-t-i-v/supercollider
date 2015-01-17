///////////////////////////////////////////////////
///  BEEEEEEP   ///////////////////////////////////
///////////////////////////////////////////////////


(
    Ndef(\abrakadabra).fadeTime = 2.0;
    Ndef(\abrakadabra).quant = 2.0;
    Ndef(\abrakadabra,{
        ~mod = 0.25pi;
        Splay.ar(
            SinOsc.ar(4320/~mod/(1.5001**(1..12)),mul:0.2).distort.distort * LFSaw.ar(1/4/(2**(1..12))).squared
            * Decay.ar(Impulse.ar(4/fib(12)),{ExpRand(0.2,1)}!12)
            ,0.5,1)
    }).play;
)
