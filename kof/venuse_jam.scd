


//////////////////////////////////////////////////////


(
    ~lfs.quant=2;
    ~lfs.fadeTime=7;
    ~lfs={
        var sig = LFSaw.ar(50*[1,1.5,1.25,2,1.125]*(1.001**(1..8)));
        sig = GVerb.ar(sig,10);
        Splay.ar(sig.flat,0.01,0.2585);
    };
    ~lfs.play;
)



(
    ~lfs2.quant=2;
    ~lfs2.fadeTime=1;
    ~lfs2={
        var sig = LFSaw.ar(50*[1,1.5,1.25,2,1.125]*(1.001**(1..8))*2) * Pulse.ar(1/4,(0..7)/8,0.04);
        sig = GVerb.ar(sig,10);
        Splay.ar(sig.flat,0.01,0.175);
    };
    ~lfs2.play;
)

~lfs2.stop(10);


(
    ~lfs2.quant=2;
    ~lfs2.fadeTime=7;
    ~lfs2={
        var sig = LFSaw.ar(500*[1,1.5,1.25,2,1.125]*(1.00001**(1..8))) * LFPulse.ar(1/4,(0..7)/8,0.12) * LFSaw.ar(2/fib(12)).exprange(0.0001,1);
        sig = GVerb.ar(sig,10);
        Splay.ar(sig.flat,0.1,0.275);
    };
    ~lfs2.play;
)


~lfs2.stop(10)




(
    ~lfs3.quant=2;
    ~lfs3.fadeTime=7;
    ~lfs3={
        var sig = LFSaw.ar(5000*[1,1.5,1.25,2,1.125]*(1.0001**(1..8))) * LFPulse.ar(1/4,(0..7)/8,0.12) * LFSaw.ar(4/fib(12)).exprange(0.0001,1);
        sig = GVerb.ar(sig,10);
        Splay.ar(sig.flat,0.1,0.0275);
    };
    ~lfs3.play;
)


~lfs3.stop(10)


//////////////////////////////////////////////////////

(
    ~noise2.fadeTime=0.1;
    ~noise2={
        var mod = Duty.kr(4,0,Dseq([4,4,8,16,32,64],inf));
        var sig = WhiteNoise.ar(0.25!2) * Pulse.ar(mod/fib(12));
        // sig = BPF.ar(sig,LFSaw.kr(2/fib(4)).exprange(0.001,16000/fib(12)),LFSaw.ar(1/4/fib(12)).exprange(0.001,1));

        sig = sig + (RLPF.ar(sig,LFSaw.ar(4/fib(16)).exprange(4000,16000))/2);

        sig = GVerb.ar(sig,[10,10,20]/0.5)/2+sig;
        sig = Mix(sig);
        Splay.ar(sig.flat,0,0.0325);
    };
    ~noise2.quant=2;
    ~noise2.play;

)

~noise.stop(10);


//////////////////////////////////////////////////////


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
)

~hala.stop(20);

//////////////////////////////////////////////////////

(
    ~minimal.quant=4;
    ~minimal.fadeTime=5;
    ~minimal={

        var sig = LFPulse.ar(50*[1,1,2,1.5]*SinOsc.ar(11*[1,2,4,8]).range(1,1.5)/[1,2]*(1.0001**(1..8)),mul:0.03) * Pulse.ar(1/[1,2,4,8]);
        sig = GVerb.ar(sig,[10,100])/2+sig;
        Splay.ar(sig.flat,0,0.4);

    };
    ~minimal.play;
)


~minimal.stop(10);
