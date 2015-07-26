
(
    p=ProxySpace.push(s.reboot);
);

b = Buffer.read(s,Platform.resourceDir ++ "/sounds/a11wlk01.wav");
//b = Buffer.read(s,Platform.resourceDir ++ "/sounds/beat.wav");

// player synth ///////////////////////////////////////

(
    ~player.quant=1;
    ~player.fadeTime=4.02;
    ~player={
        var spread = 0.1;
        var pos = SinOsc.ar(1/4/fib(8)).range(0,1);
        
        var imp = Impulse.ar(1/2,(0..7)/8);
        var env = EnvGen.ar(Env([0,1,0],[0.005,0.25],[3,-3]),imp);
        var sig = PlayBuf.ar(1,b.bufnum,BufRateScale.kr(b.bufnum)*(env**0.01),imp, (pos + WhiteNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        //sig = Normalizer.ar(sig,1,0.02)/2;

        sig = sig * env;
        sig = Resonz.ar(sig,SinOsc.ar(1/8/fib(8)).range(40,14000)) + sig;
        sig = GVerb.ar(HPF.ar(sig,400)*4,40)/4+LPF.ar(sig,400);
        sig = CompanderD.ar(sig,4/3,1/2,1/2);
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~player.play;
);
~player.stop(7);
~player.clear;
