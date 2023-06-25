


p.push();



b = Buffer.read(s,Platform.resourceDir ++ "/sounds/violin1.wav");

// player synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.quant=4;
    ~one.fadeTime=2.02;
    ~one={
        var harm = 2**Duty.kr(4/~tempo,0,Dseq([0,5,8,-12]/12,inf));
    var mod = [harm,2,4];
    var spread = 0.001;
    var pos = LFSaw.kr([1,1/2,1/24]);
    //         |       |       |       |       |  
    var pat = [1,1,1,1].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,(1..3),~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.2,0.5],[3,-3],curve:'exp'),imp * hit);
    var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);

    sig = sig * env;
    Splay.ar(sig.flat,0.5,0.95);
    };
    ~one.play;
);
~one.stop(7);
~one.clear;
