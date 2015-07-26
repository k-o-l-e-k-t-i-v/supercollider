
(
    p=ProxySpace.push(s.reboot);
);

b = Buffer.read(s,Platform.resourceDir ++ "/sounds/a11wlk01.wav");
b = Buffer.read(s,Platform.resourceDir ++ "/sounds/douce.wav");
b = Buffer.read(s,Platform.resourceDir ++ "/sounds/beat2.wav");
b = Buffer.read(s,Platform.resourceDir ++ "/sounds/beat3.wav");
b = Buffer.read(s,Platform.resourceDir ++ "/sounds/beat4.wav");

// player synth ///////////////////////////////////////

(
    ~player.quant=1;
    ~player.fadeTime=2.02;
    ~player={
        var mod = [-1,0.25,-0.25,1/8,1/16];//Duty.kr(4/fib(4),0,Dseq([0.5,1,0.75,0.25,4] * ([-1,1,2,1.5,0.25,0.125]),inf));
        var spread = 0.001;
        var pos = LFDNoise1.kr(1!8);//Duty.ar(4/[1,2,4,8],0,Dseq([0.5,0.125,0.75,0.5,1].scramble,inf));
        
        var imp = Impulse.ar(1/8,(0..7)/8);
        var env = EnvGen.ar(Env([0,1,0],[4.75,TExpRand.ar(1.01,2.75,imp)],[3,-3]),imp);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);

        //sig = sig + DelayN.ar(LPF.ar(~player.ar*0.5,800),4,4);
        sig = sig * env;
        //sig = Resonz.ar(sig,env.exprange(60.001,800),0.02)*4+sig;
        sig = GVerb.ar(sig,100)/2+sig ;
        sig = CompanderD.ar(sig,4/3,1/2,1/2);
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~player.play;
);
~player.stop(7);
~player.clear;
