



p.push();

b = Buffer.alloc(s,48000*2,2);

// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.clock = p.clock;
    ~one.quant=4;
    ~one.fadeTime=4;
    ~one={
        var sig = LFSaw.ar(50/[1,2,4,8,16]);
        sig = Shaper.ar(b,sig);
        sig = Pulse.ar(1) + (sig/4);
        Splay.ar(sig,0.5,0.15);
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


(
    ~rrr.quant=4;
    ~rrr.mold(2);
    ~rrr = {
        var f = SinOsc.ar(8).range(12000,50);
        var sig;
        sig = LocalIn.ar(2) + ~kick.ar;
        sig = AllpassN.ar(sig,2/f,1/f,0.4);
        sig = DelayN.ar(sig,1/f,1/f);
        sig = BPF.ar(sig,f,0.22);
        LocalOut.ar(sig*0.995);
        //sig = Compander.ar(sig,Pulse.ar(2),0.1,1,0.1);
        RecordBuf.ar(sig,b.bufnum,1,0.75,loop:1);
        Splay.ar(sig,0,1);

    };
    ~rrr.play;
)
// frag synth ///////////////////////////////////////

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
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3]),imp * hit);
        var sig = SinOsc.ar(50!2+(env**40*800),env**40*8pi);
        sig = sig * env;
        Splay.ar(sig,0.75,0.85);
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
