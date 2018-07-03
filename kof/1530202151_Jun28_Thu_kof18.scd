

p.push();
Harmonics
// bass synth ///////////////////////////////////////

(
    ~bass.ar(2);
    ~bass.clock = p.clock;
    ~bass.quant=4;
    ~bass.fadeTime=4;
    ~bass={
        var mod,lfo,detune,f,ffreq,sig,env;
        lfo = SinOsc.kr((10,10.1..12.1)/16).range(0.54,0.98);
        detune = SinOsc.kr((1,1.01..1.04)/16).range(-0.06,0.06);
        f = Duty.kr(4/~tempo*[1,2,3],0,Dseq([110,221,439],inf));
        mod = Duty.kr(16/~tempo*[1,2,3],0,Dseq([1,2,1/2,5/4,6/5],inf));
        f = f+detune/mod;
        ffreq = f*4;
        sig = Pulse.ar(f,lfo);
        sig  = DFM1.ar(sig,ffreq,0.02,type:0);
        sig = RLPF.ar(sig,ffreq);
        //sig = DelayC.ar(sig,0.2,0.005);
        //sig = sig * env;
        Splay.ar(sig,0.05,0.25);
    };
    ~bass.play;
);
~bass.stop(4);
~bass.clear;
~bass.pause;
~bass.resume;

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
