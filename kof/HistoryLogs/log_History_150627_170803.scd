// History, as it was on Sat Jun 27 17:08:03 2015.

[
[ 0, 'me', "(
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
        var sig = LFSaw.ar(900/pi/mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
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
[ 23.673191483, 'me', "(
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
        var sig = LFSaw.ar(512/pi/mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
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
[ 32.7783017, 'me', "(
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
        var sig = LFSaw.ar(512/pi/mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
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
[ 36.534405291, 'me', "(
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
        var sig = LFSaw.ar(5120/pi/mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
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
[ 51.510880251, 'me', "(
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
        var sig = LFSaw.ar(430/pi/mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
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
[ 70.753023698, 'me', "(
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
[ 84.958595074, 'me', "(
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
        var sig = LFSaw.ar(4320/(0.5pi*mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
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
[ 95.827862484, 'me', "(
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
        var sig = LFSaw.ar(4320/(2pi*mld)*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
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
[ 126.797022728, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
