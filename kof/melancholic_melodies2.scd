

// varnam synth ///////////////////////////////////////



(
    z = Tdef(\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,4)}!3,[1,2,1.25,1.5,1/2,1.75])};

            ~varnam.quant=2;
            ~varnam.fadeTime=2;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.45);
                var sig = VarSaw.ar(72*mld*0.5pi/[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFSaw.ar(4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1) + (SinOsc.ar(72+(1..8)+puls.range(0,40),mul:{ExpRand(0.0032,0.14)}!4) * Pulse.ar([1,1.5,3,4]/2));
                sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar([1,1.5,1.25],[1,2,3,5,5.5,5.75]/8)));
                //sig = CombC.ar(sig,1/10,1/11,[5,4])/4+sig;
                sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.75);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);
~varnam.stop(7);
