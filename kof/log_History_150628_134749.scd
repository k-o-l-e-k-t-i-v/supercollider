// History, as it was on Sun Jun 28 13:47:49 2015.

[
[ 0, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1,1/4])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,3.1)}!3,[60,55,67,58].midicps)};
            ~notes.mold(3);


            ~varnam.quant=2;
            ~varnam.fadeTime=3;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
                var sig = LFSaw.ar((~notes.kr)*4/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1);
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])+sig;
                sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 1.390118503, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1,1/4])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,3.1)}!3,[60,55,67,58].midicps)};
            ~notes.mold(3);


            ~varnam.quant=2;
            ~varnam.fadeTime=3;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
                var sig = LFSaw.ar((~notes.kr)*4/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1);
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])+sig;
                sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 36.082769366, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1,1/4])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,3.1)}!3,[60,63,65,67].midicps)};
            ~notes.mold(3);


            ~varnam.quant=2;
            ~varnam.fadeTime=3;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
                var sig = LFSaw.ar((~notes.kr)*4/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1);
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])+sig;
                sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 59.656759365, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1,1/4])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,3.1)}!3,[60,63,65,69].midicps)};
            ~notes.mold(3);


            ~varnam.quant=2;
            ~varnam.fadeTime=3;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
                var sig = LFSaw.ar((~notes.kr)*4/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1);
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])+sig;
                sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 123.795733414, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1,1/4])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,3.1)}!3,[60,63,65,69].midicps)};
            ~notes.mold(3);


            ~varnam.quant=2;
            ~varnam.fadeTime=3;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
                var sig = LFSaw.ar((~notes.kr)*4/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1);
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])+sig;
                sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            [8,4,16].wait;
        };

    });

    z.play;

);" ],
[ 132.257770899, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1,1/4])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,3.1)}!3,[60,63,65,69].midicps)};
            ~notes.mold(3);


            ~varnam.quant=2;
            ~varnam.fadeTime=3;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
                var sig = LFSaw.ar((~notes.kr)*4/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1);
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])+sig;
                sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            [8,4,16].choose.wait;
        };

    });

    z.play;

);" ],
[ 239.420735784, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1,1/4])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,3.1)}!3,[60,63,65,69].midicps)};
            ~notes.mold(3);


            ~varnam.quant=2;
            ~varnam.fadeTime=3;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
                var sig = LFSaw.ar((~notes.kr)*4/0.5pi/(mld)*[1,1.5,2,1.25]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1);
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])+sig;
                sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            [8,4,16].choose.wait;
        };

    });

    z.play;

);" ],
[ 282.343731485, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1,1/4])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,3.1)}!3,[60,63,58,69].midicps)};
            ~notes.mold(3);


            ~varnam.quant=2;
            ~varnam.fadeTime=3;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
                var sig = LFSaw.ar((~notes.kr)*4/0.5pi/(mld)*[1,1.5,2,1.25]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1);
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])+sig;
                sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            [8,4,16].choose.wait;
        };

    });

    z.play;

);" ],
[ 299.147424308, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1,1/4])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,3.1)}!3,[54,63,58,69].midicps)};
            ~notes.mold(3);


            ~varnam.quant=2;
            ~varnam.fadeTime=3;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
                var sig = LFSaw.ar((~notes.kr)*4/0.5pi/(mld)*[1,1.5,2,1.25]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1);
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])+sig;
                sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            [8,4,16].choose.wait;
        };

    });

    z.play;

);" ],
[ 332.680668313, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1,1/4])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,3.1)}!3,[54,63,58,69].midicps)};
            ~notes.mold(3);


            ~varnam.quant=2;
            ~varnam.fadeTime=3;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
                var sig = LFSaw.ar((~notes.kr)*4/0.5pi/(mld)*[1,1.5,2,1.25]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1);
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])+sig;
                sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            4.wait;
        };

    });

    z.play;

);" ],
[ 388.107146824, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1,1/4])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,3.1)}!3,[54,63,58,69].midicps)};
            ~notes.mold(3);


            ~varnam.quant=2;
            ~varnam.fadeTime=3;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
                var sig = LFSaw.ar((~notes.kr)*4/0.5pi/(mld)*[1,1.5,2,1.25]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1);
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])+sig;
                sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 406.595088325, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1,1/4])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,3.1)}!3,[54,63,58,69].midicps)};
            ~notes.mold(3);


            ~varnam.quant=2;
            ~varnam.fadeTime=3;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
                var sig = LFSaw.ar((~notes.kr)*4/0.5pi/(mld)*[1,1.5,2,1.25]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1);
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])+sig;
                sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play(quant:2);

);" ],
[ 438.90885111, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1,1/4])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,3.1)}!3,[54,65,58,72].midicps)};
            ~notes.mold(3);


            ~varnam.quant=2;
            ~varnam.fadeTime=3;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
                var sig = LFSaw.ar((~notes.kr)*4/0.5pi/(mld)*[1,1.5,2,1.25]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1);
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])+sig;
                sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play(quant:2);

);" ],
[ 443.059533224, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1,1/4])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,3.1)}!3,[54,67,58,72].midicps)};
            ~notes.mold(3);


            ~varnam.quant=2;
            ~varnam.fadeTime=3;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
                var sig = LFSaw.ar((~notes.kr)*4/0.5pi/(mld)*[1,1.5,2,1.25]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1);
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])+sig;
                sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play(quant:2);

);" ],
[ 458.927684498, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1,1/4])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,3.1)}!3,[54,48,58,72].midicps)};
            ~notes.mold(3);


            ~varnam.quant=2;
            ~varnam.fadeTime=3;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
                var sig = LFSaw.ar((~notes.kr)*4/0.5pi/(mld)*[1,1.5,2,1.25]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1);
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])+sig;
                sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play(quant:2);

);" ],
[ 489.864860695, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1,1/4])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,3.1)}!3,[54,48,58,72].midicps)};
            ~notes.mold(3);


            ~varnam.quant=2;
            ~varnam.fadeTime=3;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
                var sig = LFSaw.ar((~notes.kr)*4/0.25pi/(mld)*[1,1.5,2,1.25]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1);
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])+sig;
                sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play(quant:2);

);" ],
[ 501.31926944, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1,1/4])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,3.1)}!3,[54,48,58,72].midicps)};
            ~notes.mold(3);


            ~varnam.quant=2;
            ~varnam.fadeTime=3;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
                var sig = LFSaw.ar((~notes.kr)*2/0.25pi/(mld)*[1,1.5,2,1.25]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1);
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])+sig;
                sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play(quant:2);

);" ],
[ 520.377183918, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1,1/4])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,3.1)}!3,[54,48,58,72].midicps)};
            ~notes.mold(3);


            ~varnam.quant=2;
            ~varnam.fadeTime=3;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
                var sig = VarSaw.ar((~notes.kr)*2/0.25pi/(mld)*[1,1.5,2,1.25]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1);
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])+sig;
                sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play(quant:2);

);" ],
[ 565.499093146, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1,1/4])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,3.1)}!3,[54,48,58,72].midicps)};
            ~notes.mold(3);


            ~varnam.quant=2;
            ~varnam.fadeTime=3;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
                var sig = VarSaw.ar((~notes.kr)*2/0.5pi/(mld)*[1,1.5,2,1.25]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1);
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])+sig;
                sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play(quant:2);

);" ],
[ 593.068102416, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1,1/4])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,3.1)}!3,[54,48,58,72].midicps)};
            ~notes.mold(3);


            ~varnam.quant=2;
            ~varnam.fadeTime=3;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
                var sig = VarSaw.ar((~notes.kr)*8/0.5pi/(mld)*[1,1.5,2,1.25]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1);
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])+sig;
                sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play(quant:2);

);" ],
[ 599.278078744, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1,1/4])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,3.1)}!3,[54,48,58,72].midicps)};
            ~notes.mold(3);


            ~varnam.quant=2;
            ~varnam.fadeTime=3;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
                var sig = VarSaw.ar((~notes.kr)*8/pi/(mld)*[1,1.5,2,1.25]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1);
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])+sig;
                sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play(quant:2);

);" ],
[ 600.044046801, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1,1/4])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,3.1)}!3,[54,48,58,72].midicps)};
            ~notes.mold(3);


            ~varnam.quant=2;
            ~varnam.fadeTime=3;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
                var sig = VarSaw.ar((~notes.kr)*8/pi/(mld)*[1,1.5,2,1.25]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1);
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])+sig;
                sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play(quant:2);

);" ],
[ 617.206589577, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1,1/4])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,3.1)}!3,[54,48,58,72].midicps)};
            ~notes.mold(3);


            ~varnam.quant=2;
            ~varnam.fadeTime=3;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
                var sig = VarSaw.ar((~notes.kr)*2/(mld)*[1,1.5,2,1.25]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1);
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])+sig;
                sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play(quant:2);

);" ],
[ 629.052276129, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1,1/4])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,3.1)}!3,[54,48,58,72].midicps)};
            ~notes.mold(3);


            ~varnam.quant=2;
            ~varnam.fadeTime=3;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
                var sig = VarSaw.ar((~notes.kr)*4/(mld*pi)*[1,1.5,2,1.25]+(puls.range(0,2)**2.