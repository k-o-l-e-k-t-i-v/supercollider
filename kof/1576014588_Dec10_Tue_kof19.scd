

p.push();
p.bpm(88)

// varecho synth ///////////////////////////////////////

(
    ~varecho.ar(2);
    ~varecho.quant=[8,2];
    ~varecho.fadeTime=0.1;
    ~varecho={
        var base = ([60,65,67]+12).midicps;
        var detune = base/1200 * SinOsc.kr(~tempo/[1,2,3,4]);
        var mod = Duty.kr(32/[4,8,16]/~tempo,0,Dseq([1,2,1.5,1.33333],inf)).lag(1/160);
        var high = base+detune/[1,2,4,1.5] / Duty.kr([4,8,16,32]*4/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
        var low = base-detune/[1,2,4,1.5] / Duty.kr([4,8,16,32]*4/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
        var len = LFSaw.ar(~tempo/[16,24,32]).range(0.001,0.95);
        var t = LFSaw.ar(~tempo/4/(8..1))/4;
        var v = LFSaw.ar(~tempo/32/(8..1))/2;
        var x = LFSaw.ar(~tempo/64/(8..1))/16;
        var perl = Perlin3.ar(t,v,x).exprange(1/high,1/low);
        var lag = Perlin3.ar(x,v,t)/200+0.00001;
        var sig = LFSaw.ar([base,base+detune,base-detune]);
        sig = sig * DelayN.ar(Pulse.ar(~tempo/(1..8)),lag,lag);
        sig = CombC.ar(sig,perl*1.5,perl,len);
        sig = CombC.ar(sig,perl*1.5,perl/mod,len) * LFPulse.ar(~tempo/[1,2,3]) + sig;
        //sig = CombN.ar(sig,lag/16+1/2/~tempo,lag/16+1/4/~tempo,4/~tempo)/4+sig;
        sig = LeakDC.ar(sig).softclip;
        sig = LPF.ar(sig,500/mod) + HPF.ar(sig,10000*mod);
        sig = MoogVCF.ar(sig,base*2,0.62);
        Splay.ar(sig,0.95,0.35);
    };
    ~varecho.play;
);
~varecho.stop(4);
~varecho.clear;
~varecho.pause;
~varecho.resume;

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
