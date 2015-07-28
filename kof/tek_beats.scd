

(
  p=ProxySpace.push(s.reboot);
  e=ProxySubmix.new(\filter);
);



b = Buffer.read(s,Platform.resourceDir ++ "/sounds/beat2.wav");

// player synth ///////////////////////////////////////

(
    ~smp.quant=1;
    ~smp.fadeTime=2.02;
    ~smp={
        var mod = [-1,2,-0.5,-1,-1/4];
        var spread = 0.0;
        var pos = LFNoise2.kr(1/4!4).round(0.25);
        var imp = Impulse.ar(3/4,(0..7)/8);
        var env = EnvGen.ar(Env([0,1,0],[0.0025,0.25],[7,-7]),imp);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod,imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        //sig = GVerb.ar(sig,100)/2+sig ;
        sig = CompanderD.ar(sig,3/4,1/3,1/2);
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~smp.play;
);
~smp.stop(7);
~smp.clear;
