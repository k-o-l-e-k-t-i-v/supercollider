
Kolektiv(\kof);

(
    p=ProxySpace.push(s.boot);
    p.makeTempoClock;
);


(
    p.clock.tempo_(4*60/60);

    ~offset = (0..7)/8;

    ~tick.quant = 1;
    ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

    ~counter = {PulseCount.kr(~tick.kr)};
);


b = Buffer.read(s,Platform.resourceDir ++ "/sounds/piano.wav");

// player synth ///////////////////////////////////////

(
    ~smp.quant=4;
    ~smp.fadeTime=2.02;
    ~smp={
        var mod = [1,-1,0.5,-0.5,2,4,8,16];//[-1,0.25,-0.25,1/8,1/16];
        var spread = 0.0;
        var pos = LFNoise2.kr(1/40!8);
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,(2..11),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        sig  = Resonz.ar(sig,LFNoise2.kr(1/4!8).range(100,1400),0.33)*2;
        sig = sig * env;
        Splay.ar(sig.flat,0.5,0.9995);
    };
    ~smp.play;
);


b = Buffer.read(s,Platform.resourceDir ++ "/sounds/beat2.wav");

// player synth ///////////////////////////////////////

(
    ~sss.quant=4;
    ~sss.fadeTime=2.02;
    ~sss={
        var mod = [-1,0.25,-0.25,1/8,1/16];
        var spread = 0.0;
        var pos = [0,0.5,0.25,0.15];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,(4..8),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);

        sig = sig * env;
        Splay.ar(sig.flat,0.5,0.75);
    };
    ~sss.play;
);
~sss.stop(7);
~sss.clear;


// kick synth ///////////////////////////////////////

(
    ~kick.quant=4;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[2,3],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,3.5],[120,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(70+(env**40*400));
        sig = sig * env;
        Splay.ar(sig,0.75,0.5);
    };
    ~kick.play;
);
~kick.stop(7);
~kick.clear;
