
(
    ~sss.fadeTime=5;
    ~sss.quant=2;
~sss={
    var sig = Pulse.ar(4,(0..3)++[0.5,0.25]/4).exprange(0.00001,1);
    sig = sig * Pulse.ar(50*(sig**0.1*6+1));
    sig = Limiter.ar(sig);
    //BPF.ar(LFSaw.ar(432/8**(1.001**(1..8))),SinOsc.ar(1/fib(8)).range(40,4000),LFSaw.ar(1/4).exprange(0.001,1));
    Splay.ar(sig.flat,0);

};
~sss.play;
)
