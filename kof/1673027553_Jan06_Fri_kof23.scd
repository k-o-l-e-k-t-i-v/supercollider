

p.push();


~tempo = {110/60}

b = Buffer.read(s,"/home/kof/Downloads/369022__cunningar0807__violin-scale.wav");

// player synth ///////////////////////////////////////

(
    ~sampler.ar(2);
    ~sampler.quant=4;
    ~sampler.fadeTime=2.02;
    ~sampler={
        var mod = [0.5,1,0.25];
        var spread = 0.01;
        var pp = Duty.kr(~tempo/[4,3,2,1],0,Dseq(0.5/[5,2,3,4],inf)) + LFTri.kr( ~tempo / 24 / [1,2,3,4]).range(0.01,0.75);
        var pos = pp;
        //         |       |       |       |       |  
        var pat = [1,0,1,1].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.02,0.75],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);

        sig = sig * env;
        Splay.ar(sig.flat,0.5,0.15);
    };
    ~sampler.play;
);
~sampler.stop(7);
~sampler.clear;
