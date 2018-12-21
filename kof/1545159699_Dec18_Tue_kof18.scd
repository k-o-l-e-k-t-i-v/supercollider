

p.push();

b = Buffer.allocConsecutive(8,s,2**16,1);


b = Buffer.allocConsecutive(8,s,4096,1);
(
    ~rec.ar(3);
    ~rec.clock = p.clock;
    ~rec.quant=4;
    ~rec.fadeTime=4;
    ~rec={
        var f = 50;
        var sig = [
            BrownNoise.ar(1) ,
            WhiteNoise.ar(1) ,
            PinkNoise.ar(1) ,
            WhiteNoise.ar(1) ,
            BrownNoise.ar(1) ,
            BrownNoise.ar(1) ,
            BrownNoise.ar(1) ,
        ];
        8.do{|i|
            RecordBuf.ar(Mix(sig[i]),b.first.bufnum+i,0,loop:0);
        };
        sig;
    };
);



// prga synth ///////////////////////////////////////

(
    ~prga.ar(2);
    ~prga.clock = p.clock;
    ~prga.quant=4;
    ~prga.fadeTime=4;
    ~prga={
        var mod = Duty.kr(1/4/[1,2,3]/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
        var sig = VOsc3.ar(LFTri.ar(4).exprange(b.first.bufnum+0.01,b.last.bufnum-0.01),10/mod,5,1/2);
        //sig = (Pulse.ar(8/[1,2,3,4]) * sig);
        sig = BPF.ar(sig,1500/mod,LFSaw.ar(1/4/[1,2,4]).range(0.01,0.4));
        sig = Normalizer.ar(sig);
        sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
        Splay.ar(sig,LFSaw.ar(1/4)**2,0.15,SinOsc.ar(1/4/[1,2,3.01]));
    };
    ~prga.play;
);
~prga.stop(32);
~prga.clear;
~prga.pause;
~prga.resume;

// kick synth ///////////////////////////////////////

(
    ~kick.ar(2);
    ~kick.clock = p.clock;
    ~kick.quant=[16,0];
    ~kick.fadeTime=0.02;
    ~kick={
        //  |       |       |       |       |  
        var pat = [
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        ].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3]),imp * hit);
        var sig = SinOsc.ar(40!2+(env**40*500),env**80*8pi);
        sig = sig * env;
        Splay.ar(sig,1,0.8);
    };
    ~kick.play;
);
~kick.stop(4);
~kick.clear;
6
~kick.pause;
~kick.resume;

s.latency=0.337;

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
