


p.push();
p.bpm(121.5);

// texture synth ///////////////////////////////////////
b=Buffer.alloc(s,4096);
(
    ~texture.ar(2);
    ~texture.clock = p.clock;
    ~texture.quant=2;
    ~texture.fadeTime=4;
    ~texture={
        var sig = Dust.ar(60.midicps)*SinOsc.ar(12.midicps)+LFSaw.ar(~tempo*4);
        RecordBuf.ar(sig,b,loop:0);
    };
    //~texture.play;
);
~texture.stop(4);
~texture.clear;
~texture.pause;
~texture.resume;


// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.clock = p.clock;
    ~one.quant=2;
    ~one.fadeTime=4;
    ~one={
        var mod2 = Duty.kr(32*[1,2,3]/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
        var mod = Duty.kr(16*[1,3,7]/~tempo,0,Dseq([65,60,67,60,69,72],inf)).lag(1/8);
        var f = [36,60,mod].midicps/mod2;
        var detune = SinOsc.ar(1/[(1..8)+0.01,(2..9)+0.001,(3..10)+0.0001],mul:2);
        var sig = SinOsc.ar(f[0]+detune[0])+Pulse.ar(f[1]+detune[1])-LFSaw.ar(f[2]+detune[2]) + Osc.ar(b.bufnum,f+detune/16,mul:0.1/(1..f.size));
        sig = LeakDC.ar(sig);
        sig = Normalizer.ar(sig) + BPF.ar(Dust.ar(f/2)*4,f*2,0.12);
        sig = Resonz.ar(sig,f*16/[1,2,4,8],SinOsc.kr(f/100).range(0.01,0.2));
        sig = CombL.ar(sig,4/f,16/f,~tempo/4);
        sig = LeakDC.ar(sig);
        sig = Normalizer.ar(sig)/2+(sig**2);
        sig = MoogVCF.ar(sig,f*4,0.15);
        sig = sig * (LFTri.ar(~tempo*2/16/[1,2,3,4],mul:0.9,add:0.1)**2);
        sig = sig + PitchShift.ar(sig+Osc.ar(b.bufnum,f+detune/16,mul:0.1/(1..f.size)),0.5,1/[1,1.5,1.3334]*mod2,mul:0.15);
        sig = LeakDC.ar(sig);
        sig = CompanderD.ar(sig,3/4,1/2,1);
        Splay.ar(sig,0.5,0.25);
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


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
