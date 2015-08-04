

b = Buffer.read(s,Platform.resourceDir ++ "/sounds/douce.wav");



b = Buffer.read(s,Platform.resourceDir ++ "/sounds/violin.aif");

// player synth //////////////////////////////////////////////////////////////////////////  //

(
    ~allal.quant=1;
    ~allal.fadeTime=4.02;
    ~allal={
        var mod = [-1,0.25,-0.25,1/8,8]/16;
        var spread = 0.0;
        var pos = LFNoise2.kr(1/16!8);
        var imp = Impulse.ar(4/3,(0..7)++0.5/8);
        var env = EnvGen.ar(Env([0,1,0],[0.0075,TExpRand.ar(0.0115,0.0275,imp)],[3,-3]),imp);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        //sig = GVerb.ar(sig,100)/2+sig ;
        sig = CompanderD.ar(sig,3/4,1/4,1/2);
        Splay.ar(sig.flat,0.5,2);
    };
    ~allal.play;
);
~allal.stop(7);
~allal.clear;
