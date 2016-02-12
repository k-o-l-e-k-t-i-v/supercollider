// History, as it was on Sat Jun 27 14:03:00 2015.

[
[ 0, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,4)}!3,[1,2,1.25,1.5,1/2,1.75])};

            ~varnam.quant=2;
            ~varnam.fadeTime=2;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar(2,(0..3)+[0.5,0.25]/4),0.45);
                var sig = VarSaw.ar(72*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1) + (SinOsc.ar(72+(1..8),mul:{ExpRand(0.0032,0.14)}!4) * Pulse.ar([1,1.5,3,4]*1.5));
                sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/8,[1,2,3]/16)));
                //sig = AllpassC.ar(sig,1,1,[5,4])+sig;
                //sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.75);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 26.255844653, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,4)}!3,[1,2,1.25,1.5,1/2,1.75])};

            ~varnam.quant=2;
            ~varnam.fadeTime=2;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar(2,(0..3)+[0.5,0.25]/4),0.45);
                var sig = VarSaw.ar(72*mld*pi/[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1) + (SinOsc.ar(72+(1..8),mul:{ExpRand(0.0032,0.14)}!4) * Pulse.ar([1,1.5,3,4]*1.5));
                sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/8,[1,2,3]/16)));
                //sig = AllpassC.ar(sig,1,1,[5,4])+sig;
                //sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.75);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 46.276920705, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,4)}!3,[1,2,1.25,1.5,1/2,1.75])};

            ~varnam.quant=2;
            ~varnam.fadeTime=2;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar(2,(0..3)+[0.5,0.25]/4),0.45);
                var sig = VarSaw.ar(72*mld*0.5pi/[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1) + (SinOsc.ar(72+(1..8),mul:{ExpRand(0.0032,0.14)}!4) * Pulse.ar([1,1.5,3,4]));
                sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/8,[1,2,3]/16)));
                //sig = AllpassC.ar(sig,1,1,[5,4])+sig;
                //sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.75);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 59.776995297, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,4)}!3,[1,2,1.25,1.5,1/2,1.75])};

            ~varnam.quant=2;
            ~varnam.fadeTime=2;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar(2,(0..3)+[0.5,0.25]/4),0.45);
                var sig = VarSaw.ar(72*mld*0.5pi/[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1) + (SinOsc.ar(72+(1..8)+puls.range(0,100),mul:{ExpRand(0.0032,0.14)}!4) * Pulse.ar([1,1.5,3,4]));
                sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/8,[1,2,3]/16)));
                //sig = AllpassC.ar(sig,1,1,[5,4])+sig;
                //sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.75);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 82.541505767, 'me', "(
    z = Tdef(\\asd,{

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
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1) + (SinOsc.ar(72+(1..8)+puls.range(0,100),mul:{ExpRand(0.0032,0.14)}!4) * Pulse.ar([1,1.5,3,4]));
                sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/8,[1,2,3]/16)));
                //sig = AllpassC.ar(sig,1,1,[5,4])+sig;
                //sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.75);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 100.418971449, 'me', "(
    z = Tdef(\\asd,{

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
                sig = RLPF.ar(sig,1400*LFSaw.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1) + (SinOsc.ar(72+(1..8)+puls.range(0,100),mul:{ExpRand(0.0032,0.14)}!4) * Pulse.ar([1,1.5,3,4]));
                sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/8,[1,2,3]/16)));
                //sig = AllpassC.ar(sig,1,1,[5,4])+sig;
                //sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.75);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 103.332631523, 'me', "(
    z = Tdef(\\asd,{

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
                sig = sig * puls.range(0,1) + (SinOsc.ar(72+(1..8)+puls.range(0,100),mul:{ExpRand(0.0032,0.14)}!4) * Pulse.ar([1,1.5,3,4]));
                sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/8,[1,2,3]/16)));
                //sig = AllpassC.ar(sig,1,1,[5,4])+sig;
                //sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.75);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 122.484347574, 'me', "(
    z = Tdef(\\asd,{

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
                sig = sig * puls.range(0,1) + (SinOsc.ar(72+(1..8)+puls.range(0,100),mul:{ExpRand(0.0032,0.14)}!4) * Pulse.ar([1,1.5,3,4]));
                sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/8,[1,2,3]/16)));
                sig = AllpassC.ar(sig,1,1,[5,4])+sig;
                //sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.75);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 128.071133635, 'me', "(
    z = Tdef(\\asd,{

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
                sig = sig * puls.range(0,1) + (SinOsc.ar(72+(1..8)+puls.range(0,100),mul:{ExpRand(0.0032,0.14)}!4) * Pulse.ar([1,1.5,3,4]));
                sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/8,[1,2,3]/16)));
                sig = AllpassC.ar(sig,1/4,1/2,[5,4])+sig;
                //sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.75);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 136.732844026, 'me', "(
    z = Tdef(\\asd,{

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
                sig = sig * puls.range(0,1) + (SinOsc.ar(72+(1..8)+puls.range(0,100),mul:{ExpRand(0.0032,0.14)}!4) * Pulse.ar([1,1.5,3,4]));
                sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/8,[1,2,3]/16)));
                sig = AllpassC.ar(sig,1/2,1/4,[5,4])+sig;
                //sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.75);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 144.878341828, 'me', "(
    z = Tdef(\\asd,{

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
                sig = sig * puls.range(0,1) + (SinOsc.ar(72+(1..8)+puls.range(0,100),mul:{ExpRand(0.0032,0.14)}!4) * Pulse.ar([1,1.5,3,4]));
                sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/8,[1,2,3]/16)));
                sig = AllpassC.ar(sig,1/2,1/4,[5,4])+sig;
                sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.75);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 155.936564958, 'me', "(
    z = Tdef(\\asd,{

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
                sig = sig * puls.range(0,1) + (SinOsc.ar(72+(1..8)+puls.range(0,100),mul:{ExpRand(0.0032,0.14)}!4) * Pulse.ar([1,1.5,3,4]));
                sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/8,[1,2,3]/16)));
                //sig = AllpassC.ar(sig,1/2,1/4,[5,4])+sig;
                sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.75);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 177.460765113, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
        sig = GVerb.ar(sig,[4,5]*2)/4+sig;
        sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
        Splay.ar(sig.flat,0.25,0.75);
      };
      ~varnam.play;

      8.wait;
    };

  });

  z.play;

);" ],
[ 204.423230296, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(60.midicps/mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
        sig = GVerb.ar(sig,[4,5]*2)/4+sig;
        sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
        Splay.ar(sig.flat,0.25,0.75);
      };
      ~varnam.play;

      8.wait;
    };

  });

  z.play;

);" ],
[ 217.768075164, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(60.midicps/(mld*0.25pi)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
        sig = GVerb.ar(sig,[4,5]*2)/4+sig;
        sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
        Splay.ar(sig.flat,0.25,0.75);
      };
      ~varnam.play;

      8.wait;
    };

  });

  z.play;

);" ],
[ 230.109976812, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(72.midicps/(mld*0.25pi)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
        sig = GVerb.ar(sig,[4,5]*2)/4+sig;
        sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
        Splay.ar(sig.flat,0.25,0.75);
      };
      ~varnam.play;

      8.wait;
    };

  });

  z.play;

);" ],
[ 252.061335155, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
          var sig = LFSaw.ar([72,60,67].midicps/(mld*0.25pi)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
        sig = GVerb.ar(sig,[4,5]*2)/4+sig;
        sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
        Splay.ar(sig.flat,0.25,0.75);
      };
      ~varnam.play;

      8.wait;
    };

  });

  z.play;

);" ],
[ 285.533689787, 'me', "thisProcess.stop;" ],
[ 286.021956533, 'me', "(
    z = Tdef(\\asd,{

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
                sig = sig * puls.range(0,1) + (SinOsc.ar(72+(1..8)+puls.range(0,100),mul:{ExpRand(0.0032,0.14)}!4) * Pulse.ar([1,1.5,3,4]));
                sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/8,[1,2,3]/16)));
                //sig = AllpassC.ar(sig,1/2,1/4,[5,4])+sig;
                sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.75);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 306.493877462, 'me', "(
    z = Tdef(\\asd,{

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
                sig = sig * puls.range(0,1) + (SinOsc.ar(72+(1..8)+puls.range(0,100),mul:{ExpRand(0.0032,0.14)}!4) * Pulse.ar([1,1.5,3,4]));
                sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/8,[1,2,3]/16)));
                //sig = AllpassC.ar(sig,1/2,1/4,[5,4])+sig;
                //sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.75);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 330.438497083, 'me', "(
    z = Tdef(\\asd,{

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
                sig = sig * puls.range(0,1) + (SinOsc.ar(72+(1..8)+puls.range(0,10),mul:{ExpRand(0.0032,0.14)}!4) * Pulse.ar([1,1.5,3,4]));
                sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/8,[1,2,3]/16)));
                //sig = AllpassC.ar(sig,1/2,1/4,[5,4])+sig;
                //sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.75);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 332.302937014, 'me', "(
    z = Tdef(\\asd,{

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
                sig = sig * puls.range(0,1) + (SinOsc.ar(72+(1..8)+puls.range(0,40),mul:{ExpRand(0.0032,0.14)}!4) * Pulse.ar([1,1.5,3,4]));
                sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/8,[1,2,3]/16)));
                //sig = AllpassC.ar(sig,1/2,1/4,[5,4])+sig;
                //sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.75);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 340.067472819, 'me', "(
    z = Tdef(\\asd,{

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
                sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/8,[1,2,3]/16)));
                //sig = AllpassC.ar(sig,1/2,1/4,[5,4])+sig;
                //sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.75);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 362.139864332, 'me', "(
    z = Tdef(\\asd,{

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
                sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/8,[1,2,3,5,6,7]/16)));
                //sig = AllpassC.ar(sig,1/2,1/4,[5,4])+sig;
                //sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.75);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 376.865719586, 'me', "(
    z = Tdef(\\asd,{

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
                sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/8,[1,2,3,5,5.5,5.75]/8)));
                //sig = AllpassC.ar(sig,1/2,1/4,[5,4])+sig;
                //sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.75);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 383.540207257, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,4)}!3,[1,2,1.25,1.5,1/2,1.75])};

            ~varnam.quant=2;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.45);
                var sig = VarSaw.ar(72*mld*0.5pi/[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFSaw.ar(4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1) + (SinOsc.ar(72+(1..8)+puls.range(0,40),mul:{ExpRand(0.0032,0.14)}!4) * Pulse.ar([1,1.5,3,4]/2));
                sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1,[1,2,3,5,5.5,5.75]/8)));
                //sig = AllpassC.ar(sig,1/2,1/4,[5,4])+sig;
                //sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.75);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 408.671895812, 'me', "(
    z = Tdef(\\asd,{

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
                sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar([1,1.5],[1,2,3,5,5.5,5.75]/8)));
                //sig = AllpassC.ar(sig,1/2,1/4,[5,4])+sig;
                //sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.75);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 416.617049145, 'me', "(
    z = Tdef(\\asd,{

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
                //sig = AllpassC.ar(sig,1/2,1/4,[5,4])+sig;
                //sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.75);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 445.033317864, 'me', "(
    z = Tdef(\\asd,{

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
                sig = CombC.ar(sig,1/43,1/41,[5,4])/4+sig;
                //sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.75);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 462.435212287, 'me', "(
    z = Tdef(\\asd,{

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
                sig = CombC.ar(sig,1/23,1/21,[5,4])/4+sig;
                //sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.75);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 470.654142949, 'me', "(
    z = Tdef(\\asd,{

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
                sig = CombC.ar(sig,1/10,1/11,[5,4])/4+sig;
                //sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.75);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 484.496370614, 'me', "(
    z = Tdef(\\asd,{

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

);" ],
[ 515.287362462, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,4)}!3,[1,2,1.25,1.5,1/2,1.75])};

            ~varnam.quant=2;
            ~varnam.fadeTime=2;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.45);
                var sig = VarSaw.ar(50*mld*0.5pi/[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
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

);" ],
[ 530.586418177, 'me', "thisProcess.stop;" ],
[ 530.995283633, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
          var sig = LFSaw.ar([72,60,67].midicps/(mld*0.25pi)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
        sig = GVerb.ar(sig,[4,5]*2)/4+sig;
        sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
        Splay.ar(sig.flat,0.25,0.75);
      };
      ~varnam.play;

      8.wait;
    };

  });

  z.play;

);" ],
[ 584.30556258, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
        sig = GVerb.ar(sig,[4,5]*2)/4+sig;
        sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
        Splay.ar(sig.flat,0.25,0.75);
      };
      ~varnam.play;

      8.wait;
    };

  });

  z.play;

);" ],
[ 591.106080514, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
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
[ 639.783736549, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
          sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar([1,1.5],[1,2,3,5,5.5,5.25]/8)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
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
[ 646.652292797, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
          sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/[1,1.5],[1,2,3,5,5.5,5.25]/8)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
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
[ 684.50859349, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
          sig = sig + (BPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,20000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/2/[1,1.5],[1,2,3,5,5.5,5.25]/8)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
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
[ 711.231175543, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
          sig = sig + (BPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,20000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/[1,1.5],[1,2,3,5,5.5,5.25]/8)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
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
[ 723.4451409, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(60/mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
          sig = sig + (BPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,20000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/[1,1.5],[1,2,3,5,5.5,5.25]/8)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
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
[ 728.537624986, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(600/mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
          sig = sig + (BPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,20000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/[1,1.5],[1,2,3,5,5.5,5.25]/8)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
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
[ 739.708021135, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(432/mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
          sig = sig + (BPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,20000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/[1,1.5],[1,2,3,5,5.5,5.25]/8)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
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
[ 753.490553216, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(432/0.25pi*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
          sig = sig + (BPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,20000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/[1,1.5],[1,2,3,5,5.5,5.25]/8)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
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
[ 759.777177816, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(432/0.25pi/mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
          sig = sig + (BPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,20000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/[1,1.5],[1,2,3,5,5.5,5.25]/8)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
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
[ 772.132183553, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=4;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(432/0.25pi/mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
          sig = sig + (BPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,20000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/[1,1.5],[1,2,3,5,5.5,5.25]/8)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
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
[ 786.01350051, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=4;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(432/0.25pi/mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
          sig = sig + (BPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,20000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/[1,1.5],[1,2,3,5,5.5,5.25]/8)));
        sig = AllpassC.ar(sig,1/2,1/2,[5,4])+sig;
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
[ 802.276131101, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=4;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(432/0.25pi/mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFSaw.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
          sig = sig + (BPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,20000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/[1,1.5],[1,2,3,5,5.5,5.25]/8)));
        sig = AllpassC.ar(sig,1/2,1/2,[5,4])+sig;
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
[ 831.089382712, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=4;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(432/0.25pi/mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFSaw.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = AllpassC.ar(sig,1/2,1/2,[5,4])+sig;
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
[ 868.387704432, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=4;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(432/0.25pi/mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFSaw.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = AllpassC.ar(sig,1/2,1/2,[5,4])+sig;
          sig = sig = (LFPulse.ar(50!2,mul:0.02) * Pulse.ar([1,1.5,3,4]));
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
[ 888.337988715, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=4;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(432/0.25pi/mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFSaw.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
          sig = sig = (LFPulse.ar(50!2,mul:0.02) * LFPulse.ar([1,1.5,3,4]));
        sig = AllpassC.ar(sig,1/2,1/2,[5,4])+sig;
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
[ 898.547619614, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=4;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(432/0.25pi/mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFSaw.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig = (LFPulse.ar(50!2,mul:0.002) * LFPulse.ar([1,1.5,3,4]));
        sig = AllpassC.ar(sig,1/2,1/2,[5,4])+sig;
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
[ 907.120950829, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=4;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(432/0.25pi/mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFSaw.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig = (LFPulse.ar(50!2,mul:0.0002) * LFPulse.ar([1,1.5,3,4]));
        sig = AllpassC.ar(sig,1/2,1/2,[5,4])+sig;
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
[ 919.220481714, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=4;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(432/0.25pi/mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFSaw.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig = (LFPulse.ar(50!2,mul:0.0002) * LFPulse.ar([1,1.5,3,4]));
          sig = LeakDC.ar(sig);
        sig = AllpassC.ar(sig,1/2,1/2,[5,4])+sig;
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
[ 923.076954292, 'me', "thisProcess.stop;" ],
[ 923.381902486, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=4;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(432/0.25pi/mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFSaw.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig = (LFPulse.ar(50!2,mul:0.0002) * LFPulse.ar([1,1.5,3,4]));
        sig = LeakDC.ar(sig);
        sig = AllpassC.ar(sig,1/2,1/2,[5,4])+sig;
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
[ 929.777421028, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=4;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(432/0.25pi/mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFSaw.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (LFPulse.ar(50!2,mul:0.0002) * LFPulse.ar([1,1.5,3,4]));
        sig = LeakDC.ar(sig);
        sig = AllpassC.ar(sig,1/2,1/2,[5,4])+sig;
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
[ 937.349073235, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=4;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(432/0.25pi/mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFSaw.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (LFPulse.ar(50!2,mul:0.02) * LFPulse.ar([1,1.5,3,4]));
        sig = LeakDC.ar(sig);
        sig = AllpassC.ar(sig,1/2,1/2,[5,4])+sig;
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
[ 953.238691041, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=4;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(432/0.25pi/mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFSaw.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (LFPulse.ar(50!2,mul:0.002) * LFPulse.ar([1,1.5,3,4]));
          sig = LeakDC.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1));
        sig = AllpassC.ar(sig,1/2,1/2,[5,4])+sig;
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
[ 969.554517429, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(432/0.25pi/mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = sig * puls.range(0,1);
        sig = sig + (LFPulse.ar(50!2,mul:0.002) * LFPulse.ar([1,1.5,3,4]));
          sig = LeakDC.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1));
        sig = RLPF.ar(sig,1400*LFSaw.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = AllpassC.ar(sig,1/2,1/2,[5,4])+sig;
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
[ 983.830059921, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=4;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(432/0.25pi/mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = sig * puls.range(0,1);
        sig = sig + (LFPulse.ar(50!2,mul:0.02) * LFPulse.ar([1,1.5,3,4]));
        sig = LeakDC.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1));
        sig = RLPF.ar(sig,1400*LFSaw.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = AllpassC.ar(sig,1/2,1/2,[5,4])+sig;
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
[ 993.189982785, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=4;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(432/0.25pi/mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = sig * puls.range(0,1);
        sig = sig + (LFPulse.ar(50!2,mul:0.12) * LFPulse.ar([1,1.5,3,4]));
        sig = LeakDC.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1));
        sig = RLPF.ar(sig,1400*LFSaw.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = AllpassC.ar(sig,1/2,1/2,[5,4])+sig;
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
[ 1009.131345446, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=4;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(432/0.25pi/mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = sig * puls.range(0,1);
        sig = sig + (LFPulse.ar(50!2,mul:0.05) * LFPulse.ar([1,1.5,3,4]));
        sig = LeakDC.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1));
        sig = RLPF.ar(sig,1400*LFSaw.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = AllpassC.ar(sig,1/2,1/2,[5,4])+sig;
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
[ 1017.735380936, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=4;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(432/0.25pi/mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = sig * puls.range(0,1);
        sig = sig + (LFPulse.ar(72!2,mul:0.05) * LFPulse.ar([1,1.5,3,4]));
        sig = LeakDC.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1));
        sig = RLPF.ar(sig,1400*LFSaw.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = AllpassC.ar(sig,1/2,1/2,[5,4])+sig;
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
[ 1025.881793694, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=4;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(432/0.25pi/mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = sig * puls.range(0,1);
        sig = sig + (SinOsc.ar(72!2,mul:0.05) * LFPulse.ar([1,1.5,3,4]));
        sig = LeakDC.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1));
        sig = RLPF.ar(sig,1400*LFSaw.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = AllpassC.ar(sig,1/2,1/2,[5,4])+sig;
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
[ 1029.588910335, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=4;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(432/0.25pi/mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = sig * puls.range(0,1);
        sig = sig + (SinOsc.ar(72!2,mul:0.15) * LFPulse.ar([1,1.5,3,4]));
        sig = LeakDC.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1));
        sig = RLPF.ar(sig,1400*LFSaw.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = AllpassC.ar(sig,1/2,1/2,[5,4])+sig;
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
[ 1034.835005525, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=4;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(432/0.5pi/mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = sig * puls.range(0,1);
        sig = sig + (SinOsc.ar(72!2,mul:0.15) * LFPulse.ar([1,1.5,3,4]));
        sig = LeakDC.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1));
        sig = RLPF.ar(sig,1400*LFSaw.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = AllpassC.ar(sig,1/2,1/2,[5,4])+sig;
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
[ 1039.213466845, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=4;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(4320/0.5pi/mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = sig * puls.range(0,1);
        sig = sig + (SinOsc.ar(72!2,mul:0.15) * LFPulse.ar([1,1.5,3,4]));
        sig = LeakDC.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1));
        sig = RLPF.ar(sig,1400*LFSaw.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = AllpassC.ar(sig,1/2,1/2,[5,4])+sig;
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
[ 1049.415203246, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=4;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(432/0.5pi/mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = sig * puls.range(0,1);
        sig = sig + (SinOsc.ar(72!2,mul:0.15) * LFPulse.ar([1,1.5,3,4]));
        sig = LeakDC.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1));
        sig = RLPF.ar(sig,1400*LFSaw.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = AllpassC.ar(sig,1/2,1/2,[5,4])+sig;
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
[ 1052.09930689, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=4;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(4320/0.5pi/mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = sig * puls.range(0,1);
        sig = sig + (SinOsc.ar(72!2,mul:0.15) * LFPulse.ar([1,1.5,3,4]));
        sig = LeakDC.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1));
        sig = RLPF.ar(sig,1400*LFSaw.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = AllpassC.ar(sig,1/2,1/2,[5,4])+sig;
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
[ 1058.076173971, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=4;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(4320/0.5pi/mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = sig * puls.range(0,1);
        sig = sig + (SinOsc.ar(72!2,mul:0.25) * LFPulse.ar([1,1.5,3,4]));
        sig = LeakDC.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1));
        sig = RLPF.ar(sig,1400*LFSaw.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = AllpassC.ar(sig,1/2,1/2,[5,4])+sig;
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
[ 1091.675283193, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=4;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(432/0.5pi/mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = sig * puls.range(0,1);
        sig = sig + (SinOsc.ar(72!2,mul:0.25) * LFPulse.ar([1,1.5,3,4]));
        sig = LeakDC.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1));
        sig = RLPF.ar(sig,1400*LFSaw.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = AllpassC.ar(sig,1/2,1/2,[5,4])+sig;
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
[ 1099.431053744, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=4;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar([432,4320]/0.5pi/mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = sig * puls.range(0,1);
        sig = sig + (SinOsc.ar(72!2,mul:0.25) * LFPulse.ar([1,1.5,3,4]));
        sig = LeakDC.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1));
        sig = RLPF.ar(sig,1400*LFSaw.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = AllpassC.ar(sig,1/2,1/2,[5,4])+sig;
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
[ 1167.75448435, 'me', "thisProcess.stop;" ],
[ 1168.841447547, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
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
[ 1194.259525728, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(60/mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
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
[ 1214.926005724, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(600/mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
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
[ 1264.083608487, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!3,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(600/mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
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
[ 1269.597691591, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,6)}!3,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(600/mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
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
[ 1440.419488062, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,6.01)}!3,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(600/mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
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
[ 1445.654539268, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
        ~arcitune = {Select.kr({ExpRand(1.0001,6.01)}!3,[1,2,1.25,1.5,1/2,1.75]).lag(1)};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(600/mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
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
[ 1548.630579024, 'me', "(
~a.play;
~a.quant=2;
~a = {
	var env,fenv,sig,t,sel,tone;
	sel = Duty.kr(4,0,Dseq([1,1.25,1.125,1.5,2,4],inf));

	t = Impulse.ar(1/2,1/16*[0,2,3,4,6,8,10,12,14,16,17]);
	env = Decay.ar(t,TExpRand.ar(0.1,0.75,t));
	fenv = Decay.ar(t,TExpRand.ar(0.02,0.15,t)).exprange(0.0001,10.01+(sel*1000.0));

	sig = SinOsc.ar(50+fenv,mul:0.85) * env;
	sig = CompanderD.ar(sig,0.85,1,1/10);

	Splay.ar(sig,0.1);
};
)" ],
[ 1620.035603693, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.2!2),14000) ++ SinOsc.ar(2200*[1.5,1.25,1,4],mul:0.2);
  sig = sig.scramble;
  sig = SelectX.ar(LFSaw.ar(1/8).exprange(0.001,sig.size+0.1),sig)!2;
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.01),4);
  sig= sig * Pulse.ar(4/fib(8)).clip(-1,1);
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.195);
};
~lament.play;
);" ],
[ 1624.84913784, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.2!2),14000) ++ SinOsc.ar(2200*[1.5,1.25,1,4],mul:0.2);
  sig = sig.scramble;
  sig = SelectX.ar(LFSaw.ar(1/8).exprange(0.001,sig.size+0.1),sig)!2;
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.01),4);
  sig= sig * Pulse.ar(4/fib(8)).clip(-1,1);
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.0195);
};
~lament.play;
);" ],
[ 1645.006763333, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.2!2),14000) ++ SinOsc.ar(2200*[1.5,1.25,1,4],mul:0.2);
  sig = sig.scramble;
  sig = SelectX.ar(LFSaw.ar(1/8).exprange(0.001,sig.size+0.1),sig)!2;
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.01),4);
  sig= sig * Pulse.ar(4/fib(8)).clip(-1,1);
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.00595);
};
~lament.play;
);" ],
[ 1692.808182169, 'me', "(
~noise={
	var mel;
	var freq = LFSaw.ar(1/9/fib(12)).range(50,1500);
	var abc = PinkNoise.ar(1!12) + SinOsc.ar(44*[1,1,1.5,1.24],mul:SinOsc.kr(1/24/[1,3,6,9]).exprange(0.1,0.4))/2;
	abc = abc * LFTri.kr(1/8/fib(12)).exprange(0.0001,1);
	abc = CombN.ar(abc,0.1,1,8);
	abc = DFM1.ar(abc,freq,LFTri.ar(1/12/fib(12)).range(0.0001,1),1,[0,1])/[1,2];
	mel = BPF.ar(PitchShift.ar(abc,0.2,LFDNoise0.ar(4/fib(8)).range(1.5001,2)),LFDNoise0.ar(2/fib(8)).range(200,900),2);
	abc = Mix(abc)/8 + (Mix(mel)/20);

	abc = Pan2.ar(abc,SinOsc.ar(1/7,fib(12)));
	abc = LPF.ar(GVerb.ar(abc,100,12,0.2,0.2,32),SinOsc.ar(1/24/fib(8)).range(90,550))+(abc/1.2);
	abc = HPF.ar(abc,20);

	Splay.ar(abc.flat,0.25,0.03);
};
~noise.play;
)" ],
[ 1696.801665479, 'me', "(
~noise={
	var mel;
	var freq = LFSaw.ar(1/9/fib(12)).range(50,1500);
	var abc = PinkNoise.ar(1!12) + SinOsc.ar(44*[1,1,1.5,1.24],mul:SinOsc.kr(1/24/[1,3,6,9]).exprange(0.1,0.4))/2;
	abc = abc * LFTri.kr(1/8/fib(12)).exprange(0.0001,1);
	abc = CombN.ar(abc,0.1,1,8);
	abc = DFM1.ar(abc,freq,LFTri.ar(1/12/fib(12)).range(0.0001,1),1,[0,1])/[1,2];
	mel = BPF.ar(PitchShift.ar(abc,0.2,LFDNoise0.ar(4/fib(8)).range(1.5001,2)),LFDNoise0.ar(2/fib(8)).range(200,900),2);
	abc = Mix(abc)/8 + (Mix(mel)/20);

	abc = Pan2.ar(abc,SinOsc.ar(1/7,fib(12)));
	abc = LPF.ar(GVerb.ar(abc,100,12,0.2,0.2,32),SinOsc.ar(1/24/fib(8)).range(90,550))+(abc/1.2);
	abc = HPF.ar(abc,20);

	Splay.ar(abc.flat,0.25,0.04);
};
~noise.play;
)" ],
[ 1708.356763077, 'me', "(
~noise={
	var mel;
	var freq = LFSaw.ar(1/9/fib(12)).range(50,1500);
	var abc = PinkNoise.ar(1!12) + SinOsc.ar(44*[1,1,1.5,1.24],mul:SinOsc.kr(1/24/[1,3,6,9]).exprange(0.1,0.4))/2;
	abc = abc * LFTri.kr(1/8/fib(12)).exprange(0.0001,1);
	abc = CombN.ar(abc,0.1,1,8);
	abc = DFM1.ar(abc,freq,LFTri.ar(1/12/fib(12)).range(0.0001,1),1,[0,1])/[1,2];
	mel = BPF.ar(PitchShift.ar(abc,0.2,LFDNoise0.ar(4/fib(8)).range(1.5001,2)),LFDNoise0.ar(2/fib(8)).range(200,900),2);
	abc = Mix(abc)/8 + (Mix(mel)/20);

	abc = Pan2.ar(abc,SinOsc.ar(1/7,fib(12)));
	abc = LPF.ar(GVerb.ar(abc,100,12,0.2,0.2,32),SinOsc.ar(1/24/fib(8)).range(90,550))+(abc/1.2);
	abc = HPF.ar(abc,20);

	Splay.ar(abc.flat,0.25,0.05);
};
~noise.play;
)" ],
[ 1710.810703054, 'me', "(
~noise={
	var mel;
	var freq = LFSaw.ar(1/9/fib(12)).range(50,1500);
	var abc = PinkNoise.ar(1!12) + SinOsc.ar(44*[1,1,1.5,1.24],mul:SinOsc.kr(1/24/[1,3,6,9]).exprange(0.1,0.4))/2;
	abc = abc * LFTri.kr(1/8/fib(12)).exprange(0.0001,1);
	abc = CombN.ar(abc,0.1,1,8);
	abc = DFM1.ar(abc,freq,LFTri.ar(1/12/fib(12)).range(0.0001,1),1,[0,1])/[1,2];
	mel = BPF.ar(PitchShift.ar(abc,0.2,LFDNoise0.ar(4/fib(8)).range(1.5001,2)),LFDNoise0.ar(2/fib(8)).range(200,900),2);
	abc = Mix(abc)/8 + (Mix(mel)/20);

	abc = Pan2.ar(abc,SinOsc.ar(1/7,fib(12)));
	abc = LPF.ar(GVerb.ar(abc,100,12,0.2,0.2,32),SinOsc.ar(1/24/fib(8)).range(90,550))+(abc/1.2);
	abc = HPF.ar(abc,20);

	Splay.ar(abc.flat,0.25,0.1);
};
~noise.play;
)" ],
[ 1871.418039069, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,4)}!3,[1,2,1.25,1.5,1/2,1.75])};

            ~varnam.quant=2;
            ~varnam.fadeTime=2;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.45);
                var sig = VarSaw.ar(50*mld*0.5pi/[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFSaw.ar(4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1) + (SinOsc.ar(72+(1..8)+puls.range(0,40),mul:{ExpRand(0.0032,0.14)}!4) * Pulse.ar([1,1.5,3,4]/2));
                sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar([1,1.5,1.25],[1,2,3,5,5.5,5.75]/8)));
                //sig = CombC.ar(sig,1/10,1/11,[5,4])/4+sig;
                sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.15);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 1921.811777841, 'me', "(
    x = Tdef(\\asd,{

        loop{
            ~arcitune2.quant=2;
            ~arcitune2.fadeTime=0.02;
            ~arcitune2 = {Select.kr({ExpRand(1.0001,4)}!3,[1,2,1.25,1.5,1/2,1.75])};

            ~varnam2.quant=2;
            ~varnam2.fadeTime=2;
            ~varnam2={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.45);
                var sig = VarSaw.ar(50*mld*0.5pi/[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFSaw.ar(4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1) + (SinOsc.ar(72+(1..8)+puls.range(0,40),mul:{ExpRand(0.0032,0.14)}!4) * Pulse.ar([1,1.5,3,4]/2));
                sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar([1,1.5,1.25],[1,2,3,5,5.5,5.75]/8)));
                //sig = CombC.ar(sig,1/10,1/11,[5,4])/4+sig;
                sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.15);
            };
            ~varnam2.play;

            8.wait;
        };

    });

    x.play;

);" ],
[ 1926.225960638, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
        ~arcitune = {Select.kr({ExpRand(1.0001,6.01)}!3,[1,2,1.25,1.5,1/2,1.75]).lag(1)};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(600/mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
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
[ 1955.687854403, 'me', "(
    x = Tdef(\\asd,{

        loop{
            ~arcitune2.quant=2;
            ~arcitune2.fadeTime=0.02;
            ~arcitune2 = {Select.kr({ExpRand(1.0001,4)}!3,[1,2,1.25,1.5,1/2,1.75])};

            ~varnam2.quant=2;
            ~varnam2.fadeTime=2;
            ~varnam2={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.45);
                var sig = VarSaw.ar(50*mld*0.5pi/[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFSaw.ar(4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1) + (SinOsc.ar(72+(1..8)+puls.range(0,40),mul:{ExpRand(0.0032,0.14)}!4) * Pulse.ar([1,1.5,3,4]/2));
                sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar([1,1.5,1.25],[1,2,3,5,5.5,5.75]/8)));
                //sig = CombC.ar(sig,1/10,1/11,[5,4])/4+sig;
                sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.25);
            };
            ~varnam2.play;

            8.wait;
        };

    });

    x.play;

);" ],
[ 1971.548591565, 'me', "(
    x = Tdef(\\asd,{

        loop{
            ~arcitune2.quant=2;
            ~arcitune2.fadeTime=0.02;
            ~arcitune2 = {Select.kr({ExpRand(1.0001,4)}!3,[1,2,1.25,1.5,1/2,1.75])};

            ~varnam2.quant=2;
            ~varnam2.fadeTime=2;
            ~varnam2={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.45);
                var sig = VarSaw.ar(50*mld*0.5pi/[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFSaw.ar(4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1) + (SinOsc.ar(72+(1..8)+puls.range(0,40),mul:{ExpRand(0.0032,0.14)}!4) * Pulse.ar([1,1.5,3,4]/2));
                sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar([1,1.5,1.25],[1,2,3,5,5.5,5.75]/8)));
                //sig = CombC.ar(sig,1/10,1/11,[5,4])/4+sig;
                sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.2);
            };
            ~varnam2.play;

            8.wait;
        };

    });

    x.play;

);" ],
[ 1983.605560399, 'me', "~varnam.stop(7);" ],
[ 1992.552459211, 'me', "x.stop" ],
[ 1996.871849635, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
        ~arcitune = {Select.kr({ExpRand(1.0001,6.01)}!3,[1,2,1.25,1.5,1/2,1.75]).lag(1)};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(600/mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
        sig = GVerb.ar(sig,[4,5]*2)/4+sig;
        sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
        Splay.ar(sig.flat,0.25,0.25);
      };
      ~varnam.play;

      8.wait;
    };

  });

  z.play;

);" ],
[ 2013.01629224, 'me', "(
~noise={
	var mel;
	var freq = LFSaw.ar(1/9/fib(12)).range(50,1500);
	var abc = PinkNoise.ar(1!12) + SinOsc.ar(44*[1,1,1.5,1.24],mul:SinOsc.kr(1/24/[1,3,6,9]).exprange(0.1,0.4))/2;
	abc = abc * LFTri.kr(1/8/fib(12)).exprange(0.0001,1);
	abc = CombN.ar(abc,0.1,1,8);
	abc = DFM1.ar(abc,freq,LFTri.ar(1/12/fib(12)).range(0.0001,1),1,[0,1])/[1,2];
	mel = BPF.ar(PitchShift.ar(abc,0.2,LFDNoise0.ar(4/fib(8)).range(1.5001,2)),LFDNoise0.ar(2/fib(8)).range(200,900),2);
	abc = Mix(abc)/8 + (Mix(mel)/20);

	abc = Pan2.ar(abc,SinOsc.ar(1/7,fib(12)));
	abc = LPF.ar(GVerb.ar(abc,100,12,0.2,0.2,32),SinOsc.ar(1/24/fib(8)).range(90,550))+(abc/1.2);
	abc = HPF.ar(abc,20);

	Splay.ar(abc.flat,0.25,0.3);
};
~noise.play;
)" ],
[ 2040.395447236, 'me', "(
~a.play;
    ~a.fadeTime=4;
~a.quant=2;
~a = {
	var env,fenv,sig,t,sel,tone;
	sel = Duty.kr(4,0,Dseq([1,1.25,1.125,1.5,2,4],inf));

	t = Impulse.ar(1/2,1/16*[0,2,3,4,6,8,10,12,14,16,17]);
	env = Decay.ar(t,TExpRand.ar(0.1,0.75,t));
	fenv = Decay.ar(t,TExpRand.ar(0.02,0.15,t)).exprange(0.0001,10.01+(sel*1000.0));

	sig = SinOsc.ar(50+fenv,mul:0.85) * env;
	sig = CompanderD.ar(sig,0.85,1,1/10);

	Splay.ar(sig,0.1,0.2);
};
)" ],
[ 2066.960006348, 'me', "~noise.stop(3)" ],
[ 2081.588349279, 'me', "z.stop" ],
[ 2092.396601351, 'me', "~varnam.stop(30);" ],
[ 2105.657074302, 'me', "~lament.stop(7);" ],
[ 2113.170005618, 'me', "~a.stop(10)" ],
[ 2113.184423122, 'me', "~a.stop(10)" ],
[ 2130.67470698, 'me', "thisProcess.stop;" ],
