// History, as it was on Sat Jun 27 13:51:22 2015.

[
[ 0, 'me', "(
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
[ 18.152450924, 'me', "(
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
        var sig = LFSaw.ar(43.2*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
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
[ 28.388746821, 'me', "(
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
        var sig = LFSaw.ar(43.2*2*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
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
[ 38.926678418, 'me', "(
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
        var sig = LFSaw.ar(43.2*2*mld/[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
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
[ 63.10166108, 'me', "(
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
        var sig = LFSaw.ar(43.2*2*mld/[1,1.5,1,1.25,1,1.125]+(puls.range(0,20)**2),mul:{ExpRand(0.01,0.5)}!8);
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
[ 75.059407782, 'me', "(
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
        var sig = LFSaw.ar(43.2*2*mld/[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**3),mul:{ExpRand(0.01,0.5)}!8);
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
[ 100.537496844, 'me', "(
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
        var sig = LFSaw.ar(43.2*2*mld/[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**3),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/8,1/4,[5,4])+sig;
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
[ 110.937415437, 'me', "(
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
        var sig = LFSaw.ar(43.2*2*mld/[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**3),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/16,1/4,[5,4])/2+sig;
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
[ 121.192614467, 'me', "(
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
        var sig = LFSaw.ar(43.2*2*mld/[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**3),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/32,1/4,[5,4])/2+sig;
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
[ 137.072085147, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(2,(0..3)+[0.5,0.25]/4),0.15);
        var sig = LFSaw.ar(43.2*2*mld/[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**3),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/32,1/4,[5,4])/2+sig;
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
[ 144.28532969, 'me', "thisProcess.stop;" ],
[ 144.651520033, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.15);
        var sig = LFSaw.ar(43.2*2*mld/[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**3),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/32,1/4,[5,4])/2+sig;
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
[ 159.848789158, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.15);
        var sig = LFSaw.ar(43.2*2*mld/[1,1.5,1,1.25,1,1.125].scramble+(puls.range(0,2)**3),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/32,1/4,[5,4])/2+sig;
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
[ 168.22633471, 'me', "(
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
[ 196.794288896, 'me', "(
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
          sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
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
[ 205.407099988, 'me', "(
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
          sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
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
[ 217.181026405, 'me', "(
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
          sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/8,[1,2,3]/16)));
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
[ 263.81746534, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!2,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/8,[1,2,3]/16)));
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
[ 280.827288922, 'me', "(
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
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/8,[1,2,3]/16)));
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
[ 302.133157956, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!3,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=4;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/8,[1,2,3]/16)));
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
[ 312.694055468, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!3,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=1/2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/8,[1,2,3]/16)));
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
[ 326.693164556, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!3,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=1/4;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/8,[1,2,3]/16)));
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
[ 343.200851678, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!3,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=1.5;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/8,[1,2,3]/16)));
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
[ 356.572842379, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!3,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=1.5;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/8,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1,1,[5,4])+sig;
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
[ 380.756241064, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!3,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=1.5;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/8,[1,2,3]/16)));
        //sig = AllpassC.ar(sig,1,1,[5,4])+sig;
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
[ 400.313530772, 'me', "(
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
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/8,[1,2,3]/16)));
        //sig = AllpassC.ar(sig,1,1,[5,4])+sig;
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
[ 413.866800108, 'me', "(
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
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/8,[1,2,3]/16)));
        //sig = AllpassC.ar(sig,1,1,[5,4])+sig;
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
[ 453.27726127, 'me', "(
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
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
          sig = sig * puls.range(0,1) + (SinOsc.ar(72,mul:0.2)*Pulse.ar(4));
        sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/8,[1,2,3]/16)));
        //sig = AllpassC.ar(sig,1,1,[5,4])+sig;
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
[ 463.133233397, 'me', "(
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
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
          sig = sig * puls.range(0,1) + (SinOsc.ar(72,mul:0.2)*Pulse.ar(2));
        sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/8,[1,2,3]/16)));
        //sig = AllpassC.ar(sig,1,1,[5,4])+sig;
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
[ 467.05790573, 'me', "(
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
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
          sig = sig * puls.range(0,1) + (SinOsc.ar(72,mul:0.12)*Pulse.ar(4));
        sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/8,[1,2,3]/16)));
        //sig = AllpassC.ar(sig,1,1,[5,4])+sig;
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
[ 471.282317189, 'me', "(
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
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
          sig = sig * puls.range(0,1) + (SinOsc.ar(72,mul:0.012)*Pulse.ar(4));
        sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/8,[1,2,3]/16)));
        //sig = AllpassC.ar(sig,1,1,[5,4])+sig;
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
[ 481.064897469, 'me', "(
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
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
          sig = sig * puls.range(0,1) + (SinOsc.ar(72,mul:0.022)*Pulse.ar(4/fib(8)));
        sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/8,[1,2,3]/16)));
        //sig = AllpassC.ar(sig,1,1,[5,4])+sig;
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
[ 488.844586065, 'me', "(
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
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
          sig = sig * puls.range(0,1) + (SinOsc.ar(72,mul:0.032)*Pulse.ar(4/fib(8)));
        sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/8,[1,2,3]/16)));
        //sig = AllpassC.ar(sig,1,1,[5,4])+sig;
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
[ 505.100066642, 'me', "(
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
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
          sig = sig * puls.range(0,1) + (SinOsc.ar(72,mul:{ExpRand(0.0032,0.02)}!4)*Pulse.ar(4/fib(8)));
        sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/8,[1,2,3]/16)));
        //sig = AllpassC.ar(sig,1,1,[5,4])+sig;
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
[ 508.676032807, 'me', "(
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
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
          sig = sig * puls.range(0,1) + (SinOsc.ar(72,mul:{ExpRand(0.0032,0.02)}!8)*Pulse.ar(4/fib(8)));
        sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/8,[1,2,3]/16)));
        //sig = AllpassC.ar(sig,1,1,[5,4])+sig;
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
[ 525.016014706, 'me', "(
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
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
          sig = sig * puls.range(0,1) + (SinOsc.ar(72+(1..8),mul:{ExpRand(0.0032,0.02)}!8)*Pulse.ar(4/fib(8)));
        sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/8,[1,2,3]/16)));
        //sig = AllpassC.ar(sig,1,1,[5,4])+sig;
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
[ 535.939073201, 'me', "(
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
        var sig = VarSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
          sig = sig * puls.range(0,1) + (SinOsc.ar(72+(1..8),mul:{ExpRand(0.0032,0.02)}!8)*Pulse.ar(4/fib(8)));
        sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/8,[1,2,3]/16)));
        //sig = AllpassC.ar(sig,1,1,[5,4])+sig;
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
[ 544.136357902, 'me', "(
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
        var sig = VarSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
          sig = sig * puls.range(0,1) + (SinOsc.ar(72+(1..8),mul:{ExpRand(0.0032,0.04)}!8)*Pulse.ar(4/fib(8)));
        sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/8,[1,2,3]/16)));
        //sig = AllpassC.ar(sig,1,1,[5,4])+sig;
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
[ 558.941223465, 'me', "(
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
        var sig = VarSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
          sig = sig * puls.range(0,1) + (SinOsc.ar(72+(1..8),mul:{ExpRand(0.0032,0.14)}!8)*Pulse.ar(4/fib(8)));
        sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/8,[1,2,3]/16)));
        //sig = AllpassC.ar(sig,1,1,[5,4])+sig;
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
[ 590.954241373, 'me', "(
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
        var sig = VarSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
          sig = sig * puls.range(0,1) + (SinOsc.ar(72+(1..8),mul:{ExpRand(0.0032,0.14)}!8)*Pulse.ar([1,2,3,4]));
        sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/8,[1,2,3]/16)));
        //sig = AllpassC.ar(sig,1,1,[5,4])+sig;
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
[ 597.922899096, 'me', "(
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
        var sig = VarSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
          sig = sig * puls.range(0,1) + (SinOsc.ar(72+(1..8),mul:{ExpRand(0.0032,0.14)}!4) * Pulse.ar([1,2,3,4]));
        sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/8,[1,2,3]/16)));
        //sig = AllpassC.ar(sig,1,1,[5,4])+sig;
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
[ 603.237605285, 'me', "(
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
        var sig = VarSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
          sig = sig * puls.range(0,1) + (SinOsc.ar(72+(1..8),mul:{ExpRand(0.0032,0.14)}!4) * Pulse.ar([1,1.5,3,4]));
        sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/8,[1,2,3]/16)));
        //sig = AllpassC.ar(sig,1,1,[5,4])+sig;
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
[ 631.7125555, 'me', "(
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
[ 638.865304007, 'me', "(
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
                sig = sig * puls.range(0,1) + (SinOsc.ar(72+(1..8),mul:{ExpRand(0.0032,0.14)}!4) * Pulse.ar([1,1.5,3,4]));
                sig = sig + (HPF.ar(WhiteNoise.ar(0.005!2),{ExpRand(1000,8000)}!4) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/8,[1,2,3]/16)));
                //sig = AllpassC.ar(sig,1,1,[5,4])+sig;
                //sig = GVerb.ar(sig,[4,5]*2)/4+sig;
                sig = CompanderD.ar(sig,4/3,1/2,1/2)/3+sig;
                Splay.ar(sig.flat,0.25,0.75);
            };
            ~varnam.play;

            8.wait;
        };

    });

    z.play;

);" ],
[ 653.583156303, 'me', "(
    z = Tdef(\\asd,{

        loop{
            ~arcitune.quant=2;
            ~arcitune.fadeTime=0.02;
            ~arcitune = {Select.kr({ExpRand(1.0001,4)}!3,[1,2,1.25,1.5,1/2,1.75])};

            ~varnam.quant=2;
            ~varnam.fadeTime=2;
            ~varnam={
                var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
   