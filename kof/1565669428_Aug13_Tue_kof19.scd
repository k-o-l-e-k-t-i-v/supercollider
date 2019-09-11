
p.push();



// drive synth ///////////////////////////////////////

(
    ~drive.ar(2);
    ~drive.quant=16;
    ~drive.fadeTime=1;
    ~drive.mold(16);
    ~drive={
        var sig = Pulse.ar(~tempo/2/[1,2,3,4]);
        sig = CombL.ar(sig,4/~tempo,4/~tempo);
        sig * LFSaw.kr(~tempo/4/(1..16));
    };
    //~drive.play;
);
~drive.stop(4);
~drive.clear;
~drive.pause;
~drive.resume;

p.bpm(120)

// asd synth ///////////////////////////////////////

(
    ~asd.ar(2);
    ~asd.quant=4;
    ~asd.fadeTime=0.02;
    ~asd={
        var first = Duty.kr(1/4/~tempo,0,Dseq([60,65,67,65],inf));
        var second = Duty.kr(4/~tempo,0,Dseq([60,64,65,48,36],inf));
        var third = Duty.kr(4/~tempo,0,Dseq([60,62,60,66,72,36],inf));
        var freq = [first,second,third].midicps;
        var sig = SinOsc.ar(SinOsc.ar((1.01..2)**(LFTri.kr(freq/32)+1)*freq).exprange(freq/1.01,freq*1.01));
        sig = Compander.ar(sig,~drive.ar,LFNoise1.kr(~tempo/120!7).range(0.01,0.6),1,LFNoise1.kr(~tempo/120!7).range(0.01,0.6));
        sig = BPF.ar(sig,freq *.x [1,2,4,8],0.12/[1,2,3,4],mul:1/[1,2,3,4]);
        sig = sig * (SinOsc.ar(~tempo/16/[1,2,3,4].nthPrime)+1/2);
        Splay.ar(sig,LFTri.kr(1/160)**0.5,0.5);
    };
    ~asd.play;
);
~asd.stop(4);
~asd.clear;
~asd.pause;
~asd.resume;


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
        //fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
        sig = SelectX.ar(wet,[orig,fx]);
        sig = NumChannels.ar(sig,2);
        ReplaceOut.ar(0,sig);
    };
);
p.moveNodeToTail(\master);
