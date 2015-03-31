
(
    ~env.quant=2;
    ~env={


        var env2 = EnvGen.ar(Env([0,1,0],[0.0075,1.0],[3,-3]),Impulse.ar(1/2,(0..3)++[0.5,0.25,2.5,2.25]/4));
        var env3 = EnvGen.ar(Env([12,22000,44],[0.125*(_*2!4),0.07],[3,-3]),Impulse.ar(1/2,(0..3)/4));

        var sig = WhiteNoise.ar(0.5!2) + LFSaw.ar(44) * env2;
        sig = BBandPass.ar(sig,env3)*2;
        sig = FreeVerb.ar(sig,0.1,0.5);

        Splay.ar(sig,0.1,0.8);
    };
    ~env.play;
)
