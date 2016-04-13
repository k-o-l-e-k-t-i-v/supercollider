


(
    p=ProxySpace.push(s.boot);
    p.makeTempoClock;
);


(
    p.clock.tempo_(240/60);

    ~offset = (0..7)/8;

    ~tick.quant = 1;
    ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

    ~counter = {PulseCount.kr(~tick.kr)};
);



b = Buffer.read(s,Platform.resourceDir ++ "/sounds/beat2.wav");

// player synth ///////////////////////////////////////

(
    ~ss.ar(2);
    ~ss.quant=2;
    ~ss.fadeTime=4.02;
    ~ss={
        var mod = [1,-1,0.5,0.25]/4;//[-1,0.25,-0.25,1/8,1/16];
        var spread = 0.0;
        var pos = [0,0.5,0.25,0.5]/4;
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]*2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)/[1,2,4]%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.25,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);

        sig = sig * env;
        Splay.ar(sig.flat,0.25,0.2);
    };
    ~ss.play;
);
~ss.stop(7);
~ss.clear;

// cracle synth ///////////////////////////////////////

(
    ~cracle.ar(2);
    ~cracle.quant=2;
    ~cracle.fadeTime=0.2;
    ~cracle={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = Crackle.ar([0.1,0.2,0.3,0.4]+env);
        sig = sig * env;
        Splay.ar(sig,0.75,0.95);
    };
    ~cracle.play;
);
~cracle.stop(4);
~cracle.clear;
~cracle.pause;
~cracle.resume;

// saw synth ///////////////////////////////////////

(
    ~saw.ar(2);
    ~saw.quant=2;
    ~saw.fadeTime=4.2;
    ~saw={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,16,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.004,0.5*[1,2,3,4]],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(4400/[1,2,1.5,1.33333]*1.25/16) * Pulse.ar([4,8,16,1]);
        sig = sig * env;
        Splay.ar(sig,0.75,0.0005);
    };
    ~saw.play;
);
~saw.stop(4);
~saw.clear;
~saw.pause;
~saw.resume;


// kick synth ///////////////////////////////////////

(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[4,2],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)/[1,2]%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(50+(env**40*400));
        sig = sig * env;
        Splay.ar(sig,0.75,0.5);
    };
    ~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;
