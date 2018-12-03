

s.latency=0.2;
p.push();
b = Buffer.alloc(s,2048,1);
p.bpm(121.5);

(
    ~rec.quant=4;
    ~rec={
        var sig = [] ++ LFSaw.ar([1,2,4]*25) ++ SinOsc.ar(50*[1,2,3,4]) ++ BrownNoise.ar(0.05);
        //sig = Perlin3.ar(sig+1,sig+1,sig+1);
        //sig = sig*SinOsc.ar(~tempo*4);
        sig = sig * (LFSaw.ar(~tempo/320)**2);
            sig = SelectX.ar(LFSaw.ar(~tempo/8/[1,2,3])*(sig.size+1),sig)*4;
            sig  = Perlin3.ar(sig+1,sig+1,sig+1);
        sig = Normalizer.ar(sig)/2;
        RecordBuf.ar(Mix.ar(LeakDC.ar(sig)),b.bufnum);
        sig
    };
    ~rec.scope;
)

(
    ~simple.quant=4;
    ~simple.fadeTime=4;
    ~simple.play();
    ~simple={
        var freq = Duty.kr([16,32,64]/~tempo,0,Dseq(440/[1,2,1.5,4,8].scramble,inf));
        var mod = Duty.kr([8,16,32]/~tempo,0,Dseq([1,2,1.5,1.3334].scramble,inf));
        var f = SinOsc.ar(~tempo/[3,4,5,6],mul:0.5)+freq/mod;
        var sig = SinOsc.ar(f,Osc.ar(b.bufnum,f/[1,2,1.5],0)*2pi);
        //sig = sig * Pulse.ar(~tempo*2/[1,2,3]);

        16.do{|n|
            sig = AllpassC.ar(sig,2/f/(n+1),4/f/(n+1),1);
            sig = Vibrato.ar(sig,[4,5,5,7]+n,0.02);
            //sig = RLPF.ar(sig,f*8,LFNoise1.kr(1/16/[1,2,3]).range(0.5,0.9));
            //sig = Normalizer.ar(sig**LFSaw.ar(1/4/[1,2,4]).range(1/4,0.9)) + Resonz.ar(sig,55*mod*[1,2,4],LFNoise1.kr(1/16!3).range(0.01,0.3));
            sig = [] ++ sig ++ BPeakEQ.ar(sig,(n+1)**2*16000,4,LFNoise1.kr(~tempo/16).range(-36,12)); 
        };
        //sig = MoogVCF.ar(sig,f*4,0.2);
        sig = CompanderD.ar(sig,3/4,1/2,1);
        sig = sig.softclip / 1.5;
        //sig = GVerb.ar(sig,40,3,0.2,0.5,34,1);
        Splay.ar(sig,1,0.5);
    };
) 

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
