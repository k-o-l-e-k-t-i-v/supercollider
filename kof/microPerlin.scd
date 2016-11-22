
b = Buffer.alloc(s, 44100 * 16, 2); 

// 7) =========  BufRd and BufWr  ==========




// Here we use BufRd (Buffer Read) to play the contents of a buffer at a given index

// We use Phasor as index to move between the start and the end of the buffer.


{ BufRd.ar(1, b.bufnum, Phasor.ar(0, 1, 0, BufFrames.kr(b))) }.play;


// Write into buffer:

(
    ~rec.quant=16;
    ~rec.ar(2);
    ~rec = { arg rate=1; 
        var sig;
        var t = SinOsc.ar([1/1600,1/40,50]) + LFSaw.ar(50.01,mul:1/400);
        sig = Perlin3.ar(t[0],t[1],t[2]) + SinOsc.ar(1000.0*((1..16)/100),mul:0.2)/2;
        //sig = SinOsc.ar([50,75],Pulse.ar([1,2,3,4]/8),mul:0.5);
        //sig = sig + (CombN.ar(sig*Pulse.ar(1/4),1/50,1/50,1));
        //sig = GVerb.ar(sig,100,4);

        sig = Limiter.ar(sig);
        sig = CompanderD.ar(sig,3/4,1,1/2);
        sig = NumChannels.ar(sig,2);
        BufWr.ar(sig, b.bufnum, Phasor.ar(0, BufRateScale.kr(b) * rate, 0, BufFrames.kr(b)));
        0.0 //quiet
    };

)

// use SinOsc to modulate the playrate

(
    ~b.ar(2);
    ~b.mold(2);
    ~b.quant=16;
    ~b.fadeTime=4;
    ~b = { 
        var t = LFTri.ar([1/400/[1,2,3,4],1/4000,44100/2]) * 4 + LFTri.ar(50,mul:1/50);
        var mod = LFNoise2.kr(1/4!4).range(1,1.001);//TChoose.kr(Impulse.kr(4!2),[1,2,4,8,16,1/16,1/4,1/8])  ;
        var sig = BufRd.ar(2, b.bufnum, Perlin3.ar(t[0],t[1],t[2]).range(0, BufFrames.kr(b)));


        sig = sig * (LFTri.ar(1/16/[1,2,4,3])**4)/4;

        //sig = sig * Pulse.ar(4/[1,2,3,4]);
        sig = CompanderD.ar(sig,3/4,1/2,1/2);
        sig = LPF.ar(sig,8900);
        Splay.ar(sig,0.95,0.5);
    };
    ~b.play;
    ~b[10] = \filter -> {|sig| DWGReverb.ar(LPF.ar(HPF.ar(sig,300),5000),[5000,5021],1/10)/2+sig};
)

~b.stop;
~b.clear;


b = Buffer.read(s,Platform.resourceDir ++ "/sounds/mono/douce.wav");

    p.makeTempoClock;

(
    p.clock.tempo = (160/60);

    ~offset = {(0..7)/8};

    //~tick.quant = 1;
    ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

    ~counter = {PulseCount.kr(~tick.kr)};
);

// player synth ///////////////////////////////////////

(
    ~gg.ar(2);
    ~gg.quant=2;
    ~gg.fadeTime=2.02;
    ~gg={
        var mod = 1;///[1,1.3333,1.5,2];
        var trate, dur, clk, pos, pan,sig;
        trate = 120;
        dur = BufDur.kr(b) / trate;
        clk = Impulse.kr(trate);
        pos = LFSaw.ar(1/2/[1,2,4,8]).range(0,BufDur.kr(b)) + TRand.kr(0, 0.001, clk);
        pan = WhiteNoise.kr(0.6);
        sig = TGrains.ar(2, clk, b.bufnum, mod, pos, dur, pan, 0.3);
        sig = sig * (LFTri.ar(4/[1,2,3,4])**4);
        sig = CompanderD.ar(sig,3/4,1/2,1/2);
        Splay.ar(sig.flat,0.5,0.25);
    };
    ~gg.play;
);
~gg.stop(7);
~gg.clear;


b = Buffer.read(s,Platform.resourceDir ++ "/sounds/douce.wav");

// player synth ///////////////////////////////////////

(
    ~ddd.ar(2);
    ~ddd.quant=2;
    ~ddd.fadeTime=2.02;
    ~ddd={
        var mod = [1,1/8,2,4,2,1/1.5,1/1.3333];
        var spread = 0.0;
        var pos = [0,0.5,0.1,0.3333] + LFSaw.ar(1/320);
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0];
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4,5],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.001),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);

        sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ddd.play;
    ~ddd[10] = \filter -> {|sig| DWGReverb.ar(LPF.ar(HPF.ar(sig,300),2000),[4000,4021],1/5)/2+sig};
);
~ddd.stop(7);
~ddd.clear;
