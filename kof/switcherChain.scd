


p.push();
s.latency=0.5;
(
    ~sel1.mold(4);
    ~sel1.quant=4;
    ~sel1 = {LFSaw.ar(~tempo/8/[1,2,3,4])};
)

(
    ~sel2.mold(4);
    ~sel2.quant=4;
    ~sel2 = {LFSaw.ar(~tempo/4/[1,2,3,4]) };
)

(
    ~sel3.mold(4);
    ~sel3.quant=4;
    ~sel3 = {LFTri.ar(~tempo/16/[1,2,3,4]) ** 2};
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
            Pulse.ar(4),
            PinkNoise.ar(1),
            VarSaw.ar(15000/mod,mul:0.17),
            BrownNoise.ar(1),
            LFSaw.ar(50)
        ];
        sig.scramble;
        sig = sig *.x [
            DC.ar(LFNoise2.kr(~tempo/4)),
            LFSaw.ar(50),
            LFSaw.ar(4),
            SinOsc.ar(4!2,mul:1),
            Pulse.ar(4/[1,2,3,4]*~tempo),
            LFNoise2.ar(4/[1,2,3,4]*~tempo),
            VarSaw.ar(150/mod,0,LFSaw.ar(~tempo/[1,2,3,4]),mul:0.17),
            BrownNoise.ar(1),
        ];
        sig.scramble;
        sig = SelectX.ar(~sel1.kr*sig.size,sig);
        sig = [
            LPF.ar(sig,8000/mod),
            CombN.ar(sig,1/50*mod,1/50*mod,2),
            HPF.ar(sig,10000/mod),
            BPF.ar(sig,5000/mod,0.2),
            CombL.ar(sig,1/50*mod,1/50*mod,1/4),
            PitchShift.ar(sig,0.1,1/mod),
            CombC.ar(sig,1/50*mod,1/50*mod,1),
            PitchShift.ar(sig,0.1,SinOsc.kr(4*~tempo)*mod),
            AllpassN.ar(sig,1/50,1/50,1),
            Resonz.ar(sig,500/mod,0.2)
        ];
        sig = sig.scramble;
        sig = SelectX.ar(~sel2.kr*sig.size,sig);
        sig = LeakDC.ar(sig);
        sig = sig *.x [
            1,
            DC.ar(0),
            LFSaw.ar(4/[1,2,3,4]*~tempo),
            LFTri.ar(1/8/[1,2,3,4]*~tempo),
            Pulse.ar(4/[1,2,3,4]*~tempo),
            Pulse.ar(8/[1,2,3,4]*~tempo),
            SinOsc.ar(500/[1,2,3,4]*~tempo)
        ];
        sig = sig.scramble;
        sig = SelectX.ar(~sel3.kr*sig.size,sig);
        sig = CompanderD.ar(sig,3/4,1/2,1);
        Splay.ar(sig,0.75,0.015);
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


(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(30);};});
}.fork;  
)
