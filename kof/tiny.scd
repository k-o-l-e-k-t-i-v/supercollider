

(
    ~a={
        var sig,f; 
        

        f = Duty.kr(Dseq((1/[4,2,1/2,1/4,1,4,1]).normalize*16,inf),0,Dseq([1,2,1,4,1,2,1]/2,inf)).lag(1);
        f = Duty.kr(Dseq((1/[4,2,1/2,1/4,1,4,1]).normalize*4,inf),0,Dseq([1,2,1.5,3,1.25,2,1.125]*(f*pi),inf)).lag(1/8);

        sig = SinOsc.ar(440/f,mul:0.1);

        sig = sig + LFSaw.ar(440/f*(1.00001**(1..12)),mul:0.2);
        sig = sig * Decay.ar(Impulse.ar(4/fib(12)),2*fib(12));

        f = LFDNoise1.ar(4/fib(12)).range(140,14000);
        sig = MoogFF.ar(sig,LFSaw.ar(4/fib(12)).exprange(f,44));
        sig = Resonz.ar(sig,f) * 2;

        sig = CompanderD.ar(sig,0.5,1/3,1/2);


        sig = GVerb.ar(sig)/7+sig;

        sig = LPF.ar(sig,1400);

        Splay.ar(sig,0.1);
    };
    ~a.quant=2;
    ~a.play;
)
