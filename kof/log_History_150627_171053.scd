// History, as it was on Sat Jun 27 17:10:53 2015.

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
[ 29.367140769, 'me', "thisProcess.stop;" ],
[ 1896.616598198, 'me', "(
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
[ 1904.497585923, 'me', "(
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
[ 1909.55129176, 'me', "(
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

	Splay.ar(sig,0.1,0.5);
};
)" ],
[ 1933.517440296, 'me', "(
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
[ 1951.24156858, 'me', "(
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
        var sig = LFSaw.ar(4320/(pi*mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
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
[ 1975.345086087, 'me', "(
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

	Splay.ar(sig,0.1,0.75);
};
)" ],
[ 1994.424365525, 'me', "(
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
        var sig = LFSaw.ar(4320/(pi*mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,10)**0.15),mul:{ExpRand(0.01,0.5)}!8);
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
[ 2008.871751703, 'me', "(
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
        var sig = LFSaw.ar(4320/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,20)**0.15),mul:{ExpRand(0.01,0.5)}!8);
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
[ 2014.253664559, 'me', "(
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
        var sig = LFSaw.ar(432/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,20)**0.15),mul:{ExpRand(0.01,0.5)}!8);
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
[ 2021.234729215, 'me', "(
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
        var sig = LFSaw.ar(432*8/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,20)**0.15),mul:{ExpRand(0.01,0.5)}!8);
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
[ 2035.384436037, 'me', "(
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
        var sig = LFSaw.ar(432*4/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,20)**0.15),mul:{ExpRand(0.01,0.5)}!8);
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
[ 2040.433657368, 'me', "(
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
        var sig = LFSaw.ar(4320*2pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,20)**0.15),mul:{ExpRand(0.01,0.5)}!8);
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
[ 2047.575665394, 'me', "(
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
        var sig = LFSaw.ar(432*2pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,20)**0.15),mul:{ExpRand(0.01,0.5)}!8);
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
[ 2050.160842533, 'me', "(
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
        var sig = LFSaw.ar(432*pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,20)**0.15),mul:{ExpRand(0.01,0.5)}!8);
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
[ 2052.099458531, 'me', "(
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
        var sig = LFSaw.ar(432*0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,20)**0.15),mul:{ExpRand(0.01,0.5)}!8);
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
[ 2063.303030373, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,6)}!3,[1,2,1.25,1.5,1/2,1.75])};
        ~arcitune.mold(8);

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(432*0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,20)**0.15),mul:{ExpRand(0.01,0.5)}!8);
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
[ 2067.24608048, 'me', "thisProcess.stop;" ],
[ 2068.010384272, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,6)}!3,[1,2,1.25,1.5,1/2,1.75])};
        ~arcitune.mold(8);

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(432*0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,20)**0.15),mul:{ExpRand(0.01,0.5)}!8);
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
[ 2077.117655945, 'me', "s.freeAll" ],
[ 2078.533794791, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,6)}!3,[1,2,1.25,1.5,1/2,1.75])};
        ~arcitune.mold(8);

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(432*0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,20)**0.15),mul:{ExpRand(0.01,0.5)}!8);
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
[ 2085.777426675, 'me', "(
  p=ProxySpace.push(s.reboot);
  e=ProxySubmix.new(\\filter);
);" ],
[ 2089.569980634, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,6)}!3,[1,2,1.25,1.5,1/2,1.75])};
        ~arcitune.mold(8);

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(432*0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,20)**0.15),mul:{ExpRand(0.01,0.5)}!8);
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
[ 2094.174335779, 'me', "thisProcess.stop;" ],
[ 2094.70360391, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,6)}!3,[1,2,1.25,1.5,1/2,1.75])};
        ~arcitune.mold(8);

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(432*0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,20)**0.15),mul:{ExpRand(0.01,0.5)}!8);
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
[ 2097.9429145, 'me', "thisProcess.stop;" ],
[ 2101.798118274, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,6)}!3,[1,2,1.25,1.5,1/2,1.75])};
        ~arcitune.mold(4);

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(432*0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,20)**0.15),mul:{ExpRand(0.01,0.5)}!8);
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
[ 2107.932826486, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,6)}!4,[1,2,1.25,1.5,1/2,1.75])};
        ~arcitune.mold(4);

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(432*0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,20)**0.15),mul:{ExpRand(0.01,0.5)}!8);
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
[ 2108.106819555, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,6)}!4,[1,2,1.25,1.5,1/2,1.75])};
        ~arcitune.mold(4);

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(432*0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,20)**0.15),mul:{ExpRand(0.01,0.5)}!8);
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
[ 2121.486476237, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1.75])};
        ~arcitune.mold(8);

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(432*0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,20)**0.15),mul:{ExpRand(0.01,0.5)}!8);
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
[ 2128.754724766, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1.75])};
        ~arcitune.mold(8);

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(432*0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,20)**0.15),mul:{ExpRand(0.01,0.5)}!8);
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
[ 2132.086275682, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1.75])};
        ~arcitune.mold(8);

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(432*0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,20)**0.15),mul:{ExpRand(0.01,0.5)}!8);
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
[ 2152.965280491, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1.75])};
        ~arcitune.mold(8);

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(432/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,20)**0.15),mul:{ExpRand(0.01,0.5)}!8);
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
[ 2157.171306053, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1.75])};
        ~arcitune.mold(8);

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(4320/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,20)**0.15),mul:{ExpRand(0.01,0.5)}!8);
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
[ 2170.892041601, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1.75])};
        ~arcitune.mold(8);

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(4320/2/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,20)**0.15),mul:{ExpRand(0.01,0.5)}!8);
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
[ 2176.953367379, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1.75])};
        ~arcitune.mold(8);

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(4320/2/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
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
[ 2187.482585072, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1.75])};
        ~arcitune.mold(8);

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(4320/2/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),8000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
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
[ 2208.578384641, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1.75])};
        ~arcitune.mold(8);

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(4320/2/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
          sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
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
[ 2229.845385287, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1.75])};
        ~arcitune.mold(8);

      ~varnam.quant=2;
      ~varnam.fadeTime=4;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(4320/2/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
          sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
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
[ 2242.539982792, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1.75])};
        ~arcitune.mold(8);

      ~varnam.quant=2;
      ~varnam.fadeTime=4;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(4320/4/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
          sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
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
[ 2259.370271907, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1.75])};
        ~arcitune.mold(8);

      ~varnam.quant=2;
      ~varnam.fadeTime=4;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar((60+12).midicps/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
          sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
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
[ 2263.794505371, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1.75])};
        ~arcitune.mold(8);

      ~varnam.quant=2;
      ~varnam.fadeTime=4;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar((60+12).midicps*2/pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
          sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
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
[ 2267.095723546, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1.75])};
        ~arcitune.mold(8);

      ~varnam.quant=2;
      ~varnam.fadeTime=4;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar((60+12).midicps*2/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
          sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
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
[ 2284.0802252, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1.75])};
        ~arcitune.mold(8);

      ~varnam.quant=2;
      ~varnam.fadeTime=4;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar((60+12).midicps*2/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
          sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
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
[ 2338.939503505, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1.75])};
        ~arcitune.mold(8);

        ~notes.quant=2;
      ~notes.fadeTime=0.02;
      ~notes = {Select.kr({ExpRand(1.0001,5.1)}!8,[60,63,65,67,58].midicps)};
        ~notes.mold(8);


      ~varnam.quant=2;
      ~varnam.fadeTime=4;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar((~notes.kr)*2/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
          sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
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
[ 2347.124916491, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1.75])};
        ~arcitune.mold(8);

        ~notes.quant=2;
      ~notes.fadeTime=0.02;
      ~notes = {Select.kr({ExpRand(1.0001,5.1)}!3,[60,63,65,67,58].midicps)};
        ~notes.mold(8);


      ~varnam.quant=2;
      ~varnam.fadeTime=4;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar((~notes.kr)*2/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
          sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
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
[ 2352.391950721, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1.75])};
        ~arcitune.mold(8);

        ~notes.quant=2;
      ~notes.fadeTime=0.02;
      ~notes = {Select.kr({ExpRand(1.0001,5.1)}!3,[60,63,65,67,58].midicps)};
        ~notes.mold(3);


      ~varnam.quant=2;
      ~varnam.fadeTime=4;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar((~notes.kr)*2/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
          sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
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
[ 2391.984695349, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1.75])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,5.1)}!3,[60,63,65,67,58].midicps)};
            ~notes.mold(3);


            ~varnam.quant=2;
            ~varnam.fadeTime=4;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
                var sig = LFSaw.ar((~notes.kr)*4/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1);
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
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
[ 2421.508639508, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1.75])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,5.1)}!3,[60,63,65,67,58].midicps)};
            ~notes.mold(3);


            ~varnam.quant=2;
            ~varnam.fadeTime=4;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
                var sig = LFSaw.ar((~notes.kr)*4/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1);
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassC.ar(sig,1/4/(1..8),1/4/(1..8),[5,4])+sig;
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
[ 2450.058067881, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1.75])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,5.1)}!3,[60,63,65,67,58].midicps)};
            ~notes.mold(3);


            ~varnam.quant=2;
            ~varnam.fadeTime=4;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
                var sig = LFSaw.ar((~notes.kr)*4/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1);
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
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
[ 2455.420996258, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1.75])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,5.1)}!3,[60,63,65,67,58].midicps)};
            ~notes.mold(3);


            ~varnam.quant=2;
            ~varnam.fadeTime=4;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
                var sig = LFSaw.ar((~notes.kr)*4/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1);
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassC.ar(sig,1/2,1/2,[2,3])+sig;
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
[ 2460.282831449, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1.75])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,5.1)}!3,[60,63,65,67,58].midicps)};
            ~notes.mold(3);


            ~varnam.quant=2;
            ~varnam.fadeTime=4;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
                var sig = LFSaw.ar((~notes.kr)*4/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1);
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1/2,1/2,[2,3])+sig;
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
[ 2470.882803447, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1.75])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,5.1)}!3,[60,63,65,67,58].midicps)};
            ~notes.mold(3);


            ~varnam.quant=2;
            ~varnam.fadeTime=4;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
                var sig = LFSaw.ar((~notes.kr)*4/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1);
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1/4,1/8,[2,3])+sig;
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
[ 2478.20089139, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1.75])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,5.1)}!3,[60,63,65,67,58].midicps)};
            ~notes.mold(3);


            ~varnam.quant=2;
            ~varnam.fadeTime=4;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
                var sig = LFSaw.ar((~notes.kr)*4/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1);
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1/4,1/2/(1..8),[2,3])+sig;
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
[ 2491.859767558, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1.75])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,5.1)}!3,[60,63,65,67,58].midicps)};
            ~notes.mold(3);


            ~varnam.quant=2;
            ~varnam.fadeTime=4;
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
[ 2508.091293516, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1.75])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,5.1)}!3,[60,63,65,67,58].midicps)};
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
[ 2536.125276353, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1.75])};
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
[ 2554.319494019, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1+(1/4)])};
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
[ 2563.280122977, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1,1])};
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
[ 2573.153329067, 'me', "(
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
[ 2600.293044443, 'me', "(
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
                var sig = LFSaw.ar((~notes.kr)*[1,2,4]/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
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
[ 2610.930662188, 'me', "(
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
                var sig = LFSaw.ar((~notes.kr)*[2,4]/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
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
[ 2633.439474492, 'me', "(
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
                var sig = LFSaw.ar(SinOsc.kr(1/11/fib(8)).range(-2,2)+(~notes.kr)*[2,4]/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
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
[ 2644.847853204, 'me', "(
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
                var sig = LFSaw.ar(SinOsc.kr(11/fib(8)).range(-2,2)+(~notes.kr)*[2,4]/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
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
[ 2663.101957222, 'me', "(
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
                var sig = LFSaw.ar(SinOsc.kr(11/fib(8)).range(-2,2)+(~notes.kr)*[2,4]/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1);
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])+sig;
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
[ 2675.931438442, 'me', "(
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
                var sig = LFSaw.ar(SinOsc.kr(11/fib(8)).range(-2,2)+(~notes.kr)*[2,4]/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1);
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])/4+sig;
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
[ 2678.681333326, 'me', "(
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
                var sig = LFSaw.ar(SinOsc.kr(11/fib(8)).range(-2,2)+(~notes.kr)*[2,4]/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1);
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])/4+sig;
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
[ 2763.090060224, 'me', "(
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
                var puls = Decay.ar(Impulse.ar(2,(0..3)+[0.5,0.25]/4),0.15);
                var sig = LFSaw.ar(SinOsc.kr(11/fib(8)).range(-2,2)+(~notes.kr)*[2,4]/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1);
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])/4+sig;
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
[ 2847.893810065, 'me', "(
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
                var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.15);
                var sig = LFSaw.ar(SinOsc.kr(11/fib(8)).range(-2,2)+(~notes.kr)*[2,4]/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls.range(0,1);
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])/4+sig;
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
[ 2876.567670675, 'me', "(
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
                var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.15);
                var sig = LFSaw.ar(SinOsc.kr(11/fib(8)).range(-2,2)+(~notes.kr)*[2,4]/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                //sig = sig * puls.range(0,1);
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])/4+sig;
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
[ 2881.222133336, 'me', "(
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
                var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.15);
                var sig = LFSaw.ar(SinOsc.kr(11/fib(8)).range(-2,2)+(~notes.kr)*[2,4]/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls;
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])/4+sig;
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
[ 2899.112344621, 'me', "(
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
                var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.5);
                var sig = LFSaw.ar(SinOsc.kr(11/fib(8)).range(-2,2)+(~notes.kr)*[2,4]/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls;
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])/4+sig;
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
[ 2919.856414812, 'me', "(
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
                var puls = Decay.ar(Impulse.ar(2,(0..3)+[0.5,0.25]/4),0.25);
                var sig = LFSaw.ar(SinOsc.kr(11/fib(8)).range(-2,2)+(~notes.kr)*[2,4]/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls;
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])/4+sig;
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
[ 2932.197046289, 'me', "(
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
                var puls = Decay.ar(Impulse.ar(2,(0..3)+[0.5,0.25]/4),0.25);
                var sig = LFSaw.ar(SinOsc.kr(11/fib(8)).range(-2,2)+(~notes.kr)*[2,4]/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls;
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])/8+sig;
                sig = GVerb.ar(sig,[4,5]*2)/8+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 2956.919829746, 'me', "(
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
                var puls = Decay.ar(Impulse.ar(2,(0..3)+[0.5,0.25]/4),0.25);
                var sig = LFSaw.ar(SinOsc.kr(1/fib(8)).range(-2,2)+(~notes.kr)*[2,4]/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls;
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])/8+sig;
                sig = GVerb.ar(sig,[4,5]*2)/8+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 2964.15249539, 'me', "(
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
                var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.75);
                var sig = LFSaw.ar(SinOsc.kr(1/fib(8)).range(-2,2)+(~notes.kr)*[2,4]/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls;
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])/8+sig;
                sig = GVerb.ar(sig,[4,5]*2)/8+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 2978.970666693, 'me', "(
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
                var puls = Decay.ar(Impulse.ar(1/4,(0..3)+[0.5,0.25]/4),0.75);
                var sig = LFSaw.ar(SinOsc.kr(1/fib(8)).range(-2,2)+(~notes.kr)*[2,4]/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls;
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])/8+sig;
                sig = GVerb.ar(sig,[4,5]*2)/8+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 2989.204728133, 'me', "(
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
                var puls = Decay.ar(Impulse.ar(1/4,(0..3)+[0.5,0.25]/4),2.75);
                var sig = LFSaw.ar(SinOsc.kr(1/fib(8)).range(-2,2)+(~notes.kr)*[2,4]/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2.0),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls;
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])/8+sig;
                sig = GVerb.ar(sig,[4,5]*2)/8+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 3021.351917926, 'me', "(
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
                var puls = Decay.ar(Impulse.ar(1/4,(0..3)+[0.5,0.25]/4),2.75);
                var sig = LFSaw.ar(SinOsc.kr(1/fib(8)).range(-2,2)+(~notes.kr)*[2,4]/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**1.01),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls;
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])/8+sig;
                sig = GVerb.ar(sig,[4,5]*2)/8+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 3031.341133455, 'me', "(
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
                var puls = Decay.ar(Impulse.ar(1/4,(0..3)+[0.5,0.25]/4),2.75);
                var sig = LFSaw.ar(SinOsc.kr(1/fib(8)).range(-2,2)+(~notes.kr)*[2,4]/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**1.2),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls;
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])/8+sig;
                sig = GVerb.ar(sig,[4,5]*2)/8+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 3048.569226468, 'me', "(
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
                var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),2.75);
                var sig = LFSaw.ar(SinOsc.kr(1/fib(8)).range(-2,2)+(~notes.kr)*[2,4]/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**1.2),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls;
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])/8+sig;
                sig = GVerb.ar(sig,[4,5]*2)/8+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 3063.342147789, 'me', "(
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
                var puls = Decay.ar(Impulse.ar(1/2,(0..3)/4),2.75);
                var sig = LFSaw.ar(SinOsc.kr(1/fib(8)).range(-2,2)+(~notes.kr)*[2,4]/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**1.2),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls;
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])/8+sig;
                sig = GVerb.ar(sig,[4,5]*2)/8+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 3079.522507518, 'me', "(
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
                var puls = Decay.ar(Impulse.ar(1/2,(0..7)/8),1.75);
                var sig = LFSaw.ar(SinOsc.kr(1/fib(8)).range(-2,2)+(~notes.kr)*[2,4]/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**1.2),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls;
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])/8+sig;
                sig = GVerb.ar(sig,[4,5]*2)/8+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 3091.158274755, 'me', "(
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
                var puls = Decay.ar(Impulse.ar(1,(0..7)/8),1.75);
                var sig = LFSaw.ar(SinOsc.kr(1/fib(8)).range(-2,2)+(~notes.kr)*[2,4]/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**1.2),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls;
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])/8+sig;
                sig = GVerb.ar(sig,[4,5]*2)/8+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 3096.549749121, 'me', "(
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
                var puls = Decay.ar(Impulse.ar(1,(0..7)/8),1.75);
                var sig = LFSaw.ar(SinOsc.kr(11/fib(8)).range(-2,2)+(~notes.kr)*[2,4]/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**1.2),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls;
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])/8+sig;
                sig = GVerb.ar(sig,[4,5]*2)/8+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 3111.918255185, 'me', "(
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
                var puls = Decay.ar(Impulse.ar(1,(0..7)/8),1.75);
                var sig = LFSaw.ar(SinOsc.kr(11/fib(8)).range(-2,2)+(~notes.kr)*[2,4]/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**1.02),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls;
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])/8+sig;
                sig = GVerb.ar(sig,[4,5]*2)/8+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 3136.093235929, 'me', "(
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
                var puls = Decay.ar(Impulse.ar(2,(0..7)/8),0.75);
                var sig = LFSaw.ar(SinOsc.kr(11/fib(8)).range(-2,2)+(~notes.kr)*[2,4]/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**1.02),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls;
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])/8+sig;
                sig = GVerb.ar(sig,[4,5]*2)/8+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 3160.171940089, 'me', "(
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
                var puls = Decay.ar(Impulse.ar(2,(0..7)/8),0.75);
                var sig = LFSaw.ar(SinOsc.kr(11/fib(8)).range(-2,2)+(~notes.kr)*[2,4]/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**1.02),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls;
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                //sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])/8+sig;
                sig = GVerb.ar(sig,[4,5]*2)/8+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 3183.473753463, 'me', "(
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
            ~varnam.fadeTime=1;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar(2,(0..7)/8),0.75);
                var sig = LFSaw.ar(SinOsc.kr(11/fib(8)).range(-2,2)+(~notes.kr)*[2,4]/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**1.02),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls;
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                //sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])/8+sig;
                sig = GVerb.ar(sig,[4,5]*2)/8+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 3197.222724479, 'me', "(
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
            ~varnam.fadeTime=1;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar([1,8],(0..7)/8),0.75);
                var sig = LFSaw.ar(SinOsc.kr(11/fib(8)).range(-2,2)+(~notes.kr)*[2,4]/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**1.02),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls;
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                //sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])/8+sig;
                sig = GVerb.ar(sig,[4,5]*2)/8+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 3207.223738702, 'me', "(
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
            ~varnam.fadeTime=1;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar([1,8],(0..7)/8),[0.75,0.15]);
                var sig = LFSaw.ar(SinOsc.kr(11/fib(8)).range(-2,2)+(~notes.kr)*[2,4]/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**1.02),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls;
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                //sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])/8+sig;
                sig = GVerb.ar(sig,[4,5]*2)/8+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 3249.655209773, 'me', "(
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
            ~varnam.fadeTime=1;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar([1,8],(0..7)/8),[0.75,0.15]);
                var sig = LFSaw.ar(SinOsc.kr(11/fib(8)).range(-2,2)+(~notes.kr)*[4,8]/0.5pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**1.02),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls;
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                //sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])/8+sig;
                sig = GVerb.ar(sig,[4,5]*2)/8+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 3272.571176634, 'me', "(
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
            ~varnam.fadeTime=1;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar([1,8],(0..7)/8),[0.75,0.15]);
                var sig = LFSaw.ar(SinOsc.kr(11/fib(8)).range(-2,2)+(~notes.kr)*[4,8]/0.25pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**1.02),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls;
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                //sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])/8+sig;
                sig = GVerb.ar(sig,[4,5]*2)/8+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 3280.686761614, 'me', "(
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
            ~varnam.fadeTime=1;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar([3,8],(0..7)/8),[0.75,0.15]);
                var sig = LFSaw.ar(SinOsc.kr(11/fib(8)).range(-2,2)+(~notes.kr)*[4,8]/0.25pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**1.02),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls;
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                //sig = AllpassN.ar(sig,1,1/2/(1..8),[2,3])/8+sig;
                sig = GVerb.ar(sig,[4,5]*2)/8+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 3315.933890089, 'me', "(
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
            ~varnam.fadeTime=1;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar([4,8],(0..7)/8),[0.75,0.15]);
                var sig = LFSaw.ar(SinOsc.kr(11/fib(8)).range(-2,2)+(~notes.kr)*[4,8]/0.25pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**1.02),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls;
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1/2,1/2/(1..8),[2,3])/8+sig;
                sig = GVerb.ar(sig,[4,5]*2)/8+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 3351.780167353, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1,1/4])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,3.1)}!3,[60,54,65,58].midicps)};
            ~notes.mold(3);


            ~varnam.quant=2;
            ~varnam.fadeTime=1;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar([4,8],(0..7)/8),[0.75,0.15]);
                var sig = LFSaw.ar(SinOsc.kr(11/fib(8)).range(-2,2)+(~notes.kr)*[4,8]/0.25pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**1.02),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls;
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1/2,1/2/(1..8),[2,3])/8+sig;
                sig = GVerb.ar(sig,[4,5]*2)/8+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 3356.057317177, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1,1/4])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,3.1)}!3,[72,54,65,58].midicps)};
            ~notes.mold(3);


            ~varnam.quant=2;
            ~varnam.fadeTime=1;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar([4,8],(0..7)/8),[0.75,0.15]);
                var sig = LFSaw.ar(SinOsc.kr(11/fib(8)).range(-2,2)+(~notes.kr)*[4,8]/0.25pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**1.02),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls;
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1/2,1/2/(1..8),[2,3])/8+sig;
                sig = GVerb.ar(sig,[4,5]*2)/8+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 3379.620559495, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1,1/4])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,3.1)}!3,[72,54,65,58].midicps)};
            ~notes.mold(3);


            ~varnam.quant=2;
            ~varnam.fadeTime=1;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar([1,1/2,1/4],(0..7)/8),[0.75,0.15]);
                var sig = LFSaw.ar(SinOsc.kr(11/fib(8)).range(-2,2)+(~notes.kr)*[4,8]/0.25pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**1.02),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls;
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1/2,1/2/(1..8),[2,3])/8+sig;
                sig = GVerb.ar(sig,[4,5]*2)/8+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 3401.219993605, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1,1/4])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,3.1)}!3,[72,54,65,58].midicps)};
            ~notes.mold(3);


            ~varnam.quant=2;
            ~varnam.fadeTime=1;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar([1,1/2,1/4],(0..7)/8),[0.75,0.15,4]);
                var sig = LFSaw.ar(SinOsc.kr(11/fib(8)).range(-2,2)+(~notes.kr)*[4,8]/0.25pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**1.02),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls;
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1/2,1/2/(1..8),[2,3])/8+sig;
                sig = GVerb.ar(sig,[4,5]*2)/8+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 3440.767272056, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1,1/4])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,3.1)}!3,[72,54,65,58].midicps)};
            ~notes.mold(3);


            ~varnam.quant=2;
            ~varnam.fadeTime=1;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar([1,1/2,1/4,1/3,1/8],(0..7)/8),[0.75,0.15,4]);
                var sig = LFSaw.ar(SinOsc.kr(11/fib(8)).range(-2,2)+(~notes.kr)*[4,8]/0.25pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**1.02),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls;
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1/2,1/2/(1..8),[2,3])/8+sig;
                sig = GVerb.ar(sig,[4,5]*2)/8+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 3450.563276658, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1,1/4])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,3.1)}!3,[72,54,65,58].midicps)};
            ~notes.mold(3);


            ~varnam.quant=2;
            ~varnam.fadeTime=1;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar([1,1/2,1/4,1/3,1/8,1/16],(0..7)/8),[0.75,0.15,4]);
                var sig = LFSaw.ar(SinOsc.kr(11/fib(8)).range(-2,2)+(~notes.kr)*[4,8]/0.25pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**1.02),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls;
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1/2,1/2/(1..8),[2,3])/8+sig;
                sig = GVerb.ar(sig,[4,5]*2)/8+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 3453.948041572, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1,1/4])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,3.1)}!3,[72,54,65,58].midicps)};
            ~notes.mold(3);


            ~varnam.quant=2;
            ~varnam.fadeTime=1;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar([1,1/2,1/4,1/3,1/8,1/16],(0..7)/8),[0.75,0.15,4,8]);
                var sig = LFSaw.ar(SinOsc.kr(11/fib(8)).range(-2,2)+(~notes.kr)*[4,8]/0.25pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**1.02),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls;
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1/2,1/2/(1..8),[2,3])/8+sig;
                sig = GVerb.ar(sig,[4,5]*2)/8+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 3475.15371747, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1,1/4])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,3.1)}!3,[72,54,65,58].midicps)};
            ~notes.mold(3);


            ~varnam.quant=2;
            ~varnam.fadeTime=4;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar([1,1/2,1/4,1/3,1/8,1/16],(0..7)/8),[0.75,0.15,4,8]);
                var sig = LFSaw.ar(SinOsc.kr(11/fib(8)).range(-2,2)+(~notes.kr)*[4,8]/0.25pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**1.02),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls;
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1/2,1/2/(1..8),[2,3])/8+sig;
                sig = GVerb.ar(sig,[4,5]*2)/8+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 3496.244257796, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1,1/4])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,3.1)}!3,[72,54,65,58].midicps)};
            ~notes.mold(3);


            ~varnam.quant=2;
            ~varnam.fadeTime=4;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar([1,1/2,1/4,1/3,1/8,1/16],(0..7)/8),[0.75,0.15,4,8]);
                var sig = LFSaw.ar(SinOsc.kr(11/fib(8)).range(-2,2)+(~notes.kr)*[4,8]/0.25pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**1.02),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls;
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1/2,1/2/(1..8),[2,3])/8+sig;
                sig = GVerb.ar(sig,[4,5]*2)/8+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            [8,4,16,2].choose.wait;
        };

    });

    z.play;

);" ],
[ 3515.75909221, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1,1/4])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,3.1)}!3,[72,54,65,58].midicps)};
            ~notes.mold(3);


            ~varnam.quant=2;
            ~varnam.fadeTime=4;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar([1,1/2,1/4,1/3,1/8,1/16],(0..7)/8),[0.75,0.15,4,8]);
                var sig = LFSaw.ar(SinOsc.kr(11/fib(8)).range(-2,2)+(~notes.kr)*[4,8]/0.25pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**1.02),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls;
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1/2,1/2/(1..8),[2,3])/8+sig;
                sig = GVerb.ar(sig,[4,5]*2)/8+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            [8,4,16].choose.wait;
        };

    });

    z.play;

);" ],
[ 3516.227526857, 'me', "thisProcess.stop;" ],
[ 3518.199424228, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1,1/4])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,3.1)}!3,[72,54,65,58].midicps)};
            ~notes.mold(3);


            ~varnam.quant=2;
            ~varnam.fadeTime=4;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar([1,1/2,1/4,1/3,1/8,1/16],(0..7)/8),[0.75,0.15,4,8]);
                var sig = LFSaw.ar(SinOsc.kr(11/fib(8)).range(-2,2)+(~notes.kr)*[4,8]/0.25pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**1.02),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls;
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1/2,1/2/(1..8),[2,3])/8+sig;
                sig = GVerb.ar(sig,[4,5]*2)/8+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            [8,4,16].choose.wait;
        };

    });

    z.play;

);" ],
[ 3564.065360309, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1,1/4])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,3.1)}!3,[72,54,65,58].midicps)};
            ~notes.mold(3);


            ~varnam.quant=2;
            ~varnam.fadeTime=4;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar([1,1/2,1/4,1/3,1/8,1/16]*[1,2,1.5].choose,(0..7)/8),[0.75,0.15,4,8]);
                var sig = LFSaw.ar(SinOsc.kr(11/fib(8)).range(-2,2)+(~notes.kr)*[4,8]/0.25pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**1.02),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls;
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1/2,1/2/(1..8),[2,3])/8+sig;
                sig = GVerb.ar(sig,[4,5]*2)/8+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            [8,4,16].choose.wait;
        };

    });

    z.play;

);" ],
[ 3751.850074094, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1,1/4])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,3.1)}!3,[72,52,65,58].midicps)};
            ~notes.mold(3);


            ~varnam.quant=2;
            ~varnam.fadeTime=4;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar([1,1/2,1/4,1/3,1/8,1/16]*[1,2,1.5].choose,(0..7)/8),[0.75,0.15,4,8]);
                var sig = LFSaw.ar(SinOsc.kr(11/fib(8)).range(-2,2)+(~notes.kr)*[4,8]/0.25pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**1.02),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls;
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1/2,1/2/(1..8),[2,3])/8+sig;
                sig = GVerb.ar(sig,[4,5]*2)/8+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            [8,4,16].choose.wait;
        };

    });

    z.play;

);" ],
[ 3765.094946206, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,1.5,1/2,1,1/4])};
            ~arcitune.mold(8);

            ~notes.quant=2;
            ~notes.fadeTime=0.02;
            ~notes = {Select.kr({ExpRand(1.0001,3.1)}!3,[69,52,65,58].midicps)};
            ~notes.mold(3);


            ~varnam.quant=2;
            ~varnam.fadeTime=4;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
                var puls = Decay.ar(Impulse.ar([1,1/2,1/4,1/3,1/8,1/16]*[1,2,1.5].choose,(0..7)/8),[0.75,0.15,4,8]);
                var sig = LFSaw.ar(SinOsc.kr(11/fib(8)).range(-2,2)+(~notes.kr)*[4,8]/0.25pi/(mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**1.02),mul:{ExpRand(0.01,0.5)}!8);
                sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
                sig = sig * puls;
                sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000.01,18000)}!8) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
                sig = AllpassN.ar(sig,1/2,1/2/(1..8),[2,3])/8+sig;
                sig = GVerb.ar(sig,[4,5]*2)/8+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
                Splay.ar(sig.flat,0.25,0.5);
            };
            ~varnam.play;

            [8,4,16].choose.wait;
        };

    });

    z.play;

);" ],
[ 4054.606660514, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,6)}!8,[1,2,1.25,