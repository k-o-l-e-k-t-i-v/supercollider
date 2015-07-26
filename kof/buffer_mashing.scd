
(
    p=ProxySpace.push(s.reboot);
);

b = Buffer.read(s,Platform.resourceDir ++ "/sounds/a11wlk01-44_1.aiff");
b = Buffer.read(s,Platform.resourceDir ++ "/sounds/beat2.wav");

// player synth ///////////////////////////////////////

(
    ~player.quant=1;
    ~player.fadeTime=2.02;
    ~player={
        var spread = 0.001;
        var pos = Duty.ar(1/[1,2,4,8],0,Dseq([0.5,0.125,0.75,0.5,1,2,3,4].scramble,inf));
        
        var imp = Impulse.ar(2,(0..3)++0.5/4);
        var env = EnvGen.ar(Env([0,1,0],[0.015,TExpRand.ar(0.15,0.25,imp)],[3,-3]),imp);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        //sig = Normalizer.ar(sig,1,0.02)/2;

        sig = sig * env;
        sig = LPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(40.001,10000))+sig;
        sig = Resonz.ar(sig,SinOsc.ar(1/8/fib(8)).range(40,18000),0.2)*4 + sig;
        //sig = GVerb.ar(HPF.ar(sig,400)*2,40)/16+LPF.ar(sig,400);
        sig = CompanderD.ar(sig,4/3,1/2,1/2);
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~player.play;
);
~player.stop(7);
~player.clear;
