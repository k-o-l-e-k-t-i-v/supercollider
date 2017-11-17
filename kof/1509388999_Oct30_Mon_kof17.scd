

p.push



// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.clock = p.clock;
    ~one.quant=4;
    ~one.fadeTime=4;
    ~one={
        var mmod = Duty.kr(8,0,Dseq([1,2,1,1.5,1.33333,1.6667],inf))  + LFNoise2.kr(1/16!4).range(0,0.01);
        var mod = Duty.kr(4,0,Dseq([102,306,600,304,1008]/1200,inf)) + 1 +  LFNoise2.kr(1/16!4).range(0,0.01);
        var sig = LFSaw.ar(250/mmod/[1,2,8,4]*mod,SinOsc.ar(4/[2,3,4,5])) * SinOsc.ar([1,2,4,8]+LFNoise2.kr(1/4!4)) ** SinOsc.ar(1/4/[1,2,4,8]*mod).range(2,0.67);
        sig = CombL.ar(sig/8,1/4,[1,2,4,8]/50*mod,1);
        sig = LeakDC.ar(sig);
        sig = LPF.ar(sig,5000);
        sig = CompanderD.ar(sig/[1,2,3],3/4,1/2,1);
        sig = Perlin3.ar(sig[0],sig[1],sig[2])/16 + sig;
        sig = AllpassN.ar(sig,1,1/8,4);
        sig = CompanderD.ar(LPF.ar(sig,500*[1,10,20])/[1,2,3],3/4,1/2,1);
        sig = Vibrato.ar(sig,[3,4,5],0.1);
        Splay.ar(sig,0.5,0.5);
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

(
    ~one.ar(2);
    ~one.clock = p.clock;
    ~one.quant=4;
    ~one.fadeTime=4;
    ~one={
        var mmod = Duty.kr(4,0,Dseq([1,2,1,1.5,1.33333,1.6667],inf))  + LFNoise2.kr(1/16!4).range(0,0.01);
        var mod = Duty.kr(1/4,0,Dseq([102,306,600,304,1008]/1200,inf))+1 +  LFNoise2.kr(1/16!4).range(0,0.01);
        var sig = SinOsc.ar(1500/mmod/[1,2,8,4]*mod,SinOsc.ar(4/[2,3,4,5])) * SinOsc.ar([1,2,4,8]+LFNoise2.kr(1/4!4)) ** SinOsc.ar(1/4/[1,2,4,8]*mod).range(2,0.67);
        sig = CombL.ar(sig/8,1/4,[1,2,4,8]/50*mod,1);
        sig = LeakDC.ar(sig);
        sig = LPF.ar(sig,5000);
        sig = CompanderD.ar(sig/[1,2,3],3/4,1/2,1);
        sig = Perlin3.ar(sig[0],sig[1],sig[2])/16 + sig;
        sig = AllpassN.ar(sig,1,1/8,4);
        sig = CompanderD.ar(LPF.ar(sig,500*[1,10,20])/[1,2,3],3/4,1/2,1);
        sig = Vibrato.ar(sig,[3,4,5],0.1);
        Splay.ar(sig,0.5,0.5);
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;



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
        var sig = SinOsc.ar(50!2,env**80*8pi);
        sig = sig * env;
        Splay.ar(sig,0.75,0.5);
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
