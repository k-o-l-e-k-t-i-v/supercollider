


p.push();

(
    ~sel.mold(4);
    ~sel.quant=4;
    ~sel = {LFSaw.ar(1/4/[1,2,3,4])};
)

(
    ~sel1.mold(4);
    ~sel1.quant=4;
    ~sel1 = {LFSaw.ar(1/8/[1,2,3,4])};
)

(
    ~sel2.mold(4);
    ~sel2.quant=4;
    ~sel2 = {LFSaw.ar(1/16/[1,2,3,4])};
)

(
    ~sel3.mold(4);
    ~sel3.quant=4;
    ~sel3 = {LFSaw.ar(1/32/[1,2,3,4])};
)
// switcher synth ///////////////////////////////////////

(
    ~switcher.ar(2);
    ~switcher.quant=4;
    ~switcher.fadeTime=0.2;
    ~switcher={
        var mod = Duty.kr(16/~tempo*[1,2,3,4],0,Dseq([1,2,1.5,1.33333,4,8,16],inf));
        //         |       |       |       |       |  
        var sig = [
            SinOsc.ar(50!2,mul:0.7),
            Pulse.ar(5000/mod,mul:0.2),
            WhiteNoise.ar(1),
            PinkNoise.ar(1),
            VarSaw.ar(15000/mod,mul:0.17),
            BrownNoise.ar(1),
        ];
        sig.scramble;
        sig = Select.ar(~sel.kr*sig.size,sig);
        sig = sig *.x [
            SinOsc.ar(4!2,mul:1),
            Pulse.ar(4/[1,2,3,4]),
            LFNoise2.ar(4/[1,2,3,4]),
            VarSaw.ar(150/mod,0,LFSaw.ar(1/[1,2,3,4]),mul:0.17),
            BrownNoise.ar(1),
        ];
        sig.scramble;
        sig = Select.ar(~sel1.kr*sig.size,sig);
        sig =  [
            LPF.ar(sig,8000/mod),
            CombN.ar(sig,1/50*mod,1/50*mod,2),
            HPF.ar(sig,10000/mod),
            BPF.ar(sig,5000/mod,0.2),
            CombL.ar(sig,1/50*mod,1/50*mod,1/4),
            PitchShift.ar(sig,0.1,1/mod),
            CombC.ar(sig,1/50*mod,1/50*mod,1),
            PitchShift.ar(sig,0.1,SinOsc.kr(4)*mod),
            AllpassN.ar(sig,1/50,1/50,1),
            Resonz.ar(sig,500/mod,0.2)
        ];
        sig = sig.scramble;
        sig = Select.ar(~sel2.kr*sig.size,sig);
        sig = LeakDC.ar(sig);
        sig = sig *.x [
            LFSaw.ar(4/[1,2,3,4]),
            LFTri.ar(1/8/[1,2,3,4]),
            Pulse.ar(4/[1,2,3,4]),
            Pulse.ar(8/[1,2,3,4]),
            SinOsc.ar(500/[1,2,3,4])
        ];
        sig = sig.scramble;
        sig = Select.ar(~sel3.kr*sig.size,sig);
        sig = CompanderD.ar(sig,3/4,1/2,1);
        Splay.ar(sig,0.75,0.5);
    };
    ~switcher.play;
);
~switcher.stop(4);
~switcher.clear;
~switcher.pause;
~switcher.resume;


(
    ~master.quant=2;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.25,lp=3500,hp=250,len=10,rev = 3|
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
