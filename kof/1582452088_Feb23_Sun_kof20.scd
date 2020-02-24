
a=0.974617;
p.push();
p.bpm(60*a)

b = Buffer.alloc(s,48000,48);

{Pulse.ar(~tempo!2)}.play

// ole synth ///////////////////////////////////////

(
    ~ole.ar(2);
    ~ole.quant=4;
    ~ole.fadeTime=0.4;
    ~ole={
        var pat = Duty.kr(Dseq([3,1],inf)/~tempo,0,Dseq([[1,2,3,4],[1,1,1,1]],inf));
        var pat2 = Duty.kr(Dseq([1/2,1,1/2,2]*64,inf)/~tempo,0,Dseq([[1,2,3,4],[1,3,1,10],[4,3,3,2],[5,6,7,8]],inf));
        var imp = Pulse.ar(~tempo*LFSaw.kr(~tempo).exprange([4,3,2,1]*32+0.001,1/4)/pat);
        var sig = Gendy1.ar(0.5,0.6,0.7,0.8,50*a,100*a);
        sig = sig * imp;
        sig = LPF.ar(sig,1600/[1,10,100,1000]);
        sig = LeakDC.ar(sig);
        //sig = BufDelayL.ar(b,sig,SinOsc.ar(~tempo*48/(1..48)).range(0,0.05));
        Splay.ar(sig,0.05,0.5);
    };
    ~ole.play;
);
~ole.stop(4);
~ole.clear;
~ole.pause;
~ole.resume;


(
    ~master.quant=2;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.05,lp=3500,hp=250,len=10,rev = 3|
        var sig = In.ar([0,1]);
        var orig = sig;
        var fx;
        //fx = Limiter.ar(sig,0.95);
        sig = CompanderD.ar(sig,3/4,1/2,1);
        fx = LPF.ar(sig,lp);
        fx = HPF.ar(fx,hp);
        fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
        sig = SelectX.ar(wet,[orig,fx]);
        sig = NumChannels.ar(sig,2);
        ReplaceOut.ar(0,sig);
    };
);
p.moveNodeToTail(\master);
