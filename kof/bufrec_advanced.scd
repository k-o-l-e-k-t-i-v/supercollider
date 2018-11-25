

p.push();
b = Buffer.alloc(s,s.sampleRate * 2, 1);
s.latency=0.2;
p.bpm(126.95)

// recorder synth ///////////////////////////////////////

(
    ~recorder.ar(2);
    ~recorder.clock = p.clock;
    ~recorder.quant=16;
    ~recorder.fadeTime=4;
    ~recorder={
        var sig = SinOsc.ar([1/50,1/100,1/500])+1 * SinOsc.kr(1);
        sig = Perlin3.ar(sig[0],sig[1],sig[2]);
        RecordBuf.ar(sig,b.bufnum,0,0.15);
        Splay.ar(sig,0.5,0.25);
    };
    //~recorder.play;
);
~recorder.stop(4);
~recorder.clear;
~recorder.pause;
~recorder.resume;

record  

// shaper synth ///////////////////////////////////////

(
    ~shaper.ar(2);
    ~shaper.clock = p.clock;
    ~shaper.quant=16;
    ~shaper.fadeTime=4;
    ~shaper={
        var sig = LFSaw.ar(500*[1,3,5,7,11,12].log2,mul:LFSaw.ar(~tempo/16/[1,2,3,4])**4) + SinOsc.ar(48000/2,mul:10/48000);
        sig = CombN.ar(sig,1/50,1/500*[1,3,5,7,11,12].log2,1);
        sig = Shaper.ar(b,Mix(sig,1));
        sig = Normalizer.ar(LPF.ar(HPF.ar(sig,30),LFSaw.kr(~tempo/2/[1,2,3,4]).range(5000,50))) + (Normalizer.ar(MoogVCF.ar(sig,5000,0.2))/8 * Pulse.ar(~tempo*4/[1,2,3,4]));
        // sig = Compander.ar(sig,~kick.ar,0.1,1,0.1) * (LFSaw.ar(~tempo*4/[1,2,3,4])**4);
        sig = Resonz.ar(sig,5000/[3,7,5].log2,0.2); 
        Splay.ar(sig,0.75,0.15);
    };
    ~shaper.play;
);
~shaper.stop(4);
~shaper.clear;
~shaper.pause;
~shaper.resume;


// hard synth ///////////////////////////////////////

(
    ~hard.ar(2);
    ~hard.quant=16;
    ~hard.fadeTime=0.2;
    ~hard={
        var mod = Duty.kr(1/4/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr % pat.size);
        var imp2 = PulseDivider.kr(~tick.kr,4,~counter.kr % pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var hit2 = Select.kr(PulseCount.kr(imp2)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = [
            WhiteNoise.ar(0.2),
            SinOsc.ar(50),
            BrownNoise.ar(0.5),
            SinOsc.ar(50),
            ClipNoise.ar(0.2),
            SinOsc.ar(50),
            PinkNoise.ar(0.5),
            SinOsc.ar(50),
        ];
        sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
        //sig = sig * env;
        sig = [
            CombN.ar(sig,2*mod/50,mod/50,2),
            CombC.ar(sig,2*mod/50,mod/75,1/2),
            CombL.ar(sig,2*mod/50,mod/100,2),
            AllpassN.ar(sig,2*mod/50,1/50,1/2),
        ];
        sig = LeakDC.ar(sig);
        sig = SelectX.ar(LFTri.ar(~tempo*2/[1,2,3,4]).range(0,5),sig);
        //sig = CombN.ar(sig,~tempo,~tempo/2,4);
        sig = LPF.ar(sig,LFNoise2.kr(~tempo/16!4).range(500,15000));
        sig = Normalizer.ar(sig);
        Splay.ar(sig,0.75,0.05);
    };
    ~hard.play;
);
~hard.stop(4);
~hard.clear;
~hard.pause;
~hard.resume;


// kick synth ///////////////////////////////////////

(
    ~kick.ar(2);
    ~kick.clock = p.clock;
    ~kick.quant=[16,0];
    ~kick.fadeTime=0.02;
    ~kick={
        //  |       |       |       |       |  
        var pat = [
            1,1,1,1, 0,0,0,0, 0,0,0,0, 0,0,0,0,
            0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
            0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
            0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,5.5],[3,-3]),imp * hit);
        var sig = SinOsc.ar(50!2,env**80*8pi);
        sig = sig * env;
        Splay.ar(sig,1,0.25);
    };
    ~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;


(
    ~master.quant=2;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.15,lp=3500,hp=250,len=10,rev = 3|
        var sig = In.ar([0,1]);
        var orig = sig;
        var fx;
        //fx = Limiter.ar(sig,0.95);
        sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
        fx = LPF.ar(sig,lp);
        fx = HPF.ar(fx,hp);
        fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
        sig = SelectX.ar(wet,[orig,fx]);
        sig = NumChannels.ar(sig,2);
        ReplaceOut.ar(0,sig);
    };
);
p.moveNodeToTail(\master);
