s.reboot;
p.push();
s.latency=0.2;
p.bpm(88*1.5)
// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.clock = p.clock;
    ~one.quant=2;
    ~one.fadeTime=4;
    ~one={
        var mod = Duty.kr(4*[1,2,3,4]/~tempo,0,Dseq(([1,2,1.5,1.33333]*.x[1,2,1.5,1.25].scramble),inf))/12;
        var base = [72,60,48].midicps/(mod * [2,5,7,9].log2);
        var ramp = LFTri.ar(base*[2,5,7,9].log2)**(LFNoise2.kr(~tempo/16/[1,2,3,4])**1.5) + SinOsc.kr(base/32 + 0.01);
        var sig = VarSaw.ar(base*ramp,0,ramp*2pi) * LFTri.kr(~tempo/16/[1,2,3,4]);
        sig = BPF.ar(sig,base,1);
        sig = BPF.ar(sig,base+10,1);
        sig = BPF.ar(sig,base*2-5,1);
        sig = LeakDC.ar(sig) * SinOsc.ar(base,(base*2pi).tanh);// ** SinOsc.ar(base/16);
        sig = Normalizer.ar(sig) * SinOsc.ar(base/160);
        sig = AllpassC.ar(sig,3,LFNoise1.kr(~tempo/32!8)**2/1000.0+0.01,3);
        sig = AllpassC.ar(sig,3,LFNoise1.kr(~tempo/32!8)**2/1000.0+0.01,3);
        sig = AllpassC.ar(sig,3,LFNoise1.kr(~tempo/32!8)**2/1000.0+0.01,3);
        //sig = SelectX.ar(LFSaw.kr(1/[1,0.01])*sig.size,sig );
        sig = Resonz.ar(sig,base*2,0.001+LFTri.kr(~tempo*2/[1,2,3,4]).exprange(0.0001,0.5));
        sig = Normalizer.ar(sig);
        sig = sig * LFTri.ar(~tempo/4/(1..32));
        sig = MoogVCF.ar(sig,base*2,0.2)+sig;
        sig = LPF.ar(sig,8000);
        Splay.ar(sig,0.15,0.25);
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

// kix synth ///////////////////////////////////////

(
    ~kix.ar(2);
    ~kix.clock = p.clock;
    ~kix.quant=[16,0];
    ~kix.fadeTime=0.02;
    ~kix={
        //  |       |       |       |       |  
        var pat = [
            1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
            1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
            1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
            1,0,0,0, 0,0,0,0, 1,1,1,0, 1,0,0,0,
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3]),imp * hit);
        var sig = SinOsc.ar(40!2,env**50*8pi);
        sig = sig * env;
        Splay.ar(sig,0.75,0.5);
    };
    ~kix.play;
);
~kix.stop(4);
~kix.clear;
~kix.pause;
~kix.resume;

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
