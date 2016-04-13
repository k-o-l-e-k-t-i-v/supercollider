


~a.play;
(
~a.quant = 2.0;
~a.fadeTime = 5;
~a = {
    var sig;
    sig=Decay.ar(Impulse.ar(2/fib(14)),(1..8)/4) * SinOsc.ar(43.2 * [1,1.25,1.25,4*1.25,0.5,0.25].scramble * 1pi,mul:0.00015);
    sig = CompanderD.ar(sig,0.5,1,1/10);
    sig = CombN.ar(sig,1,1,32);
    sig = FreeVerb.ar(sig);
    Splay.ar(sig);
};
)
