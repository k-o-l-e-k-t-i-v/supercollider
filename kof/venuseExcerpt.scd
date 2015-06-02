/*
 __________________________
< Sounds nice on Dynacords >
 --------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
*/


(
(
    ~hala={
        var sig = LFPulse.ar([50,100,10000]*1.25) * LFPulse.ar(1/2/fib(4),0,0.15*(fib(4)));
        sig = sig + (HPF.ar(WhiteNoise.ar(0.7!2),LFSaw.ar(1/4).range(10000,[4400,400])) * LFSaw.ar(1/2/fib(4)).exprange(0.0001,1) );
        sig = Resonz.ar(sig,LFSaw.ar(1/2/fib(8)).exprange(0.001,1)*444);
        sig = GVerb.ar(sig,[10,20,200]);
        sig = Mix(sig);
        Splay.ar(sig.flat,0.1,0.14359);

    };
    ~hala.fadeTime=0.02;
    ~hala.quant=4;
    ~hala.play;
);


(
    ~minimal.quant=4;
    ~minimal.fadeTime=5;
    ~minimal={

        var sig = LFPulse.ar(50*[1,1,2,1.5]*SinOsc.ar(11*[1,2,4,8]).range(1,1.5)/[1,2]*(1.0001**(1..8)),mul:0.03) * Pulse.ar(1/[1,2,4,8]);
        sig = GVerb.ar(sig,[10,100])/2+sig;
        Splay.ar(sig.flat,0,0.4);

    };
    ~minimal.play;
);
)

~minimal.stop(20);
~hala.stop(20);

