
// one synth ///////////////////////////////////////

p.push
p.bpm(90)

(
    ~one.ar(2);
    ~one.clock = p.clock;
    ~one.quant=4;
    ~one.fadeTime=4;
    ~one={
        var freq = 440 / Duty.kr(4/~tempo*[1,2,3],0,Dseq([1,2,1.5,1.33333]++[2,3,5,7].log2,inf));
            var vib = Gendy1.kr(1,1,0.1,0.1,0.1, 8,mul:0.003,add:1);
            var son = DWGBowed.ar(freq*vib, 0.15,0.15, 0,LFTri.kr(~tempo/4/[1,2,3])**2,0.91,0.13,3,0.2,2);
            son = DWGSoundBoard.ar(son);
           
        son = BPF.ar(son,freq/4,1)+son;
            son = BPF.ar(son,freq+10)+son;
            son = BPF.ar(son,freq+40,1)+son;

            son = LPF.ar(son,freq*2);

        Splay.ar(son,0.5,0.75);
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;



//Define bow synthdef
(
    SynthDef(\help_dwgbowed, { |out=0, freq=220, amp=0.5,force=1, gate=1,pos=0.07,c1=0.25,c3=31,pan=0|
            var vib = Gendy1.kr(1,1,1,1,0.1, 4,mul:0.003,add:1);
            var son = DWGBowed.ar(freq*vib, amp,force, gate,LFSaw.kr(1/4),0.1,c1,c3);
            son = DWGSoundBoard.ar(son);
            son = BPF.ar(son,freq/4,1)+son;
            son = BPF.ar(son,freq+10)+son;
            son = BPF.ar(son,freq+40,1)+son;
            son = LPF.ar(son,6000);
            Out.ar(out, Pan2.ar(son * 0.1, pan));
    }).add;
)

//Use it.
(

    Pbind(
            \instrument, \help_dwgbowed,
            \dur , 4.75,
            \degree, Pseq([1,5,7+4,3,5,3,7,3,9,3,11,2,5,4,14,17], inf),
            \amp , Pseq([0.9,0.7,0.5],inf),
        \force, Pwhite(0.1,0.2,inf),
        \c1, Pwhite(0.1,0.9,inf),
        \c3, Pwhite(1,32,inf),
        \pos, Pwhite(0.01,0.04,inf)
    ).play;
)


s.latency=0.2;
p.push
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
