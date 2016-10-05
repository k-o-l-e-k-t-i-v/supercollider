
(
l = 4;
b = Buffer.alloc(s, 44100 * l, 2); 
)

// 7) =========  BufRd and BufWr  ==========



p.makeTempoClock;
(
  p.clock.tempo_(120/60);
  
  ~offset = {(0..7)/8};
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);




(
    ~head.fadeTime=0;
    ~head.quant=4;
    ~head.ar(2);
    ~head = { var sig;
        sig = Phasor.ar(Impulse.ar(1/l),1/l,0, BufFrames.kr(b) * 2);
        Splay.ar(sig,1,1);
    };
)

(
    ~lin.ar(2);
    ~lin.fadeTime=32;
    ~lin.quant=2;
    ~lin = {
        var sig;
        var mod = Duty.kr(16,0,Dseq([1,2,1.5,1.33333],inf));
        var t = SinOsc.ar([1/160,1/40,500*mod]) + LFSaw.ar(1/4000/[400,401],mul:40);
        sig = Perlin3.ar(t[0],t[1],t[2]) + SinOsc.ar(50.0*[1,2,1.5,8]*mod,Pulse.ar(2/[1,2,3,4],mul:0.2)/2);
        sig = SinOsc.ar(Phasor.ar(0),mul:0.75) * Pulse.ar(2/(1..10));// + (sig/8);
        sig = sig + (CombN.ar(sig*Pulse.ar(2),1/50,1/50,1/40));
        //sig = sig;
        //sig = GVerb.ar(sig,10,4);

        //sig =  + sig;

        sig = Limiter.ar(sig);
        sig = CompanderD.ar(sig,3/4,1,1/2);
        Splay.ar(sig,0.9,0.9);
    }

)

// Write into buffer:

(
    ~rec.quant=2;
    ~rec.ar(2);
    ~rec = { arg rate=1; 
        var sig = ~lin.ar;
        var mod = LFNoise2.ar(1/4!4).range(1,1.001);//TChoose.kr(Impulse.kr(4!2),[1,2,4,8,16,1/16,1/4,1/8])  ;

        sig = NumChannels.ar(sig,2);
        BufWr.ar(sig, b.bufnum, ~head.ar,loop:1);
        0.0 //quiet
    };

)

// use SinOsc to modulate the playrate

(
    ~b.ar(2);
    ~b.mold(2);
    ~b.quant=2;
    ~b.fadeTime=5;
    ~b = { 
        var mod = LFNoise2.ar(1/4!4).range(1,1.001);//TChoose.kr(Impulse.kr(4!2),[1,2,4,8,16,1/16,1/4,1/8])  ;
        var sig = BufRd.ar(2, b.bufnum, Phasor.ar(Impulse.ar(1/l),1/l,0, BufFrames.kr(b) * 2));
        //sig = sig;// * (LFTri.ar(4/[1,2,4,3])**2)/4;

        //sig = sig * Pulse.ar(4/[1,2,3,4]);
        sig = CompanderD.ar(sig,3/4,1/1.2,1/2);
        sig = LPF.ar(sig,15500);
        sig = HPF.ar(sig,20);
        Splay.ar(sig,0.95,0.5);
    };
    ~b.play;
    ~b[10] = \filter -> {|sig| DWGReverb.ar(LPF.ar(HPF.ar(sig,300),5000),[5000,5021],1/10)/2+sig};
)

~b.stop(30);
~b.clear;


b = Buffer.read(s,Platform.resourceDir ++ "/sounds/mono/douce.wav");

p.makeTempoClock;

(
    p.makeTempoClock;
    p.clock.tempo = (120/60);

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

// player synth ///////////////////////////////////////

(
    ~ddd.ar(2);
    ~ddd.quant=[2,1/2];
    ~ddd.fadeTime=2.02;
    ~ddd={
        var mod = [8,16,32,1/4];//[1,1/8,2,4,2,1/1.5,1/1.3333];
        var spread = 0.0;
        var pos = [0,0.5,0.1,0.3333] + LFSaw.ar(1/320);
        //         |       |       |       |       |  
        var pat = [1,1,1,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.001),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);

        sig = sig * env;
        Splay.ar(sig.flat,0.5,0.25);
    };
    ~ddd.play;
    ~ddd[10] = \filter -> {|sig| DWGReverb.ar(LPF.ar(HPF.ar(sig,300),2000),[4000,4021],1/5)/2+sig};
);
~ddd.stop(50);
~ddd.clear;
