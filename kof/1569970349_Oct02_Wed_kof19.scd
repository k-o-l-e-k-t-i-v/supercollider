p.push()

p.bpm(120/0.864/3)

(
  s.latency=1;
  //p.clock.tempo_(120/60);
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
  ~tick.kr(1);
  ~tick.quant = 16;
  ~counter.quant = 16;
  ~counter = {PulseCount.kr(~tick.kr);};
  ~tick = { Impulse.kr( ~tempo * 4 ); };
);

// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.quant=4;
    ~one.fadeTime=4;
    ~one={
        var mod2 = Duty.kr(Dseq([16,8,16,8],inf)/~tempo,0,Dseq([1,2,1.5,1.25],inf)).lag(1/12);
        var mod = Duty.kr([1/4,1/2,4,8,16,32]/~tempo,0,Dseq([1,2,4,1.5,1.25,8,1.5,2,16,1.333334,4,15/8],inf)).lag(1/120);
        var base = [60,48,72].midicps*2*mod2 + SinOsc.kr(~tempo/8.01/[1,2,3,4,5,6],mul:0.5);
        var sig = LFPulse.ar(base[0,1,2]/0.864/mod) * LFTri.ar(~tempo/[4,16,32]);
        var phase = LFTri.kr(~tempo/4)**2+0.5;
        sig = sig + (LFSaw.ar(base[3,4,5]/0.864/mod) * LFTri.ar(~tempo/8/[3,2,1]));
        sig = sig + (SinOsc.ar(base/0.864/mod) * LFTri.ar(~tempo/16/[1,2,3]));
        sig = sig + (BrownNoise.ar(LFTri.ar(~tempo/2/[1,2,3]))*Pulse.ar(~tempo*2/[1,2,3]));
        sig = AllpassL.ar(sig,8/(base/0.864*mod),4/(base/0.864*mod),4/~tempo)/4+sig;
        sig = (Perlin3.ar(sig/8+1,sig/4+1,LFTri.ar(~tempo/64/[1,2,3])*4) * LFTri.ar(~tempo/[4,5,6]));
        sig = LeakDC.ar(sig);
        sig = BPF.ar(sig,base/0.864/mod*[1,2,1/2],LFTri.ar(~tempo/[1,2,3,4,5,6]).range(0.01,0.8)**1.5);
        //sig = CombL.ar(sig,~tempo*[4,8,16],~tempo*[4,8,16],~tempo);
        sig = AllpassN.ar(sig,1/~tempo,1/~tempo/2,1/~tempo);

        sig = Splay.ar(sig,0.75,0.05,SinOsc.kr(~tempo)/4);
        sig = CompanderD.ar(sig,1/2,1/2,1);
        sig = DelayN.ar(sig,[0,SinOsc.kr(~tempo/16.01).range(phase/2,phase*2)]/base*mod,[0,SinOsc.kr(~tempo/16.01).range(phase/2,phase*2)]/base*mod);
        sig;
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

// one synth ///////////////////////////////////////

(
    ~two.ar(2);
    ~two.quant=4;
    ~two.fadeTime=4;
    ~two={
        var mod2 = Duty.kr(Dseq([16,8,16,8],inf)/~tempo,0,Dseq([1,2,1.5,1.25],inf)).lag(1/12);
        var mod = Duty.kr(2*[1/4,1/2,4,8,16,32]/~tempo,0,Dseq([1,2,4,1.5,1.25,8,1.5,2,16,1.333334,4,15/8],inf)).lag(1/120);
        var base = [60,48,72].midicps*mod2 + SinOsc.kr(~tempo/8/[1,2,3,4,5,6],mul:0.5);
        var sig = LFPulse.ar(base[0,1,2]/0.864/mod) * LFTri.ar(~tempo/[4,16,32]);
        var phase = LFTri.kr(~tempo/4)**2+0.5;
        sig = sig + (LFSaw.ar(base[3,4,5]/0.864/mod) * LFTri.ar(~tempo/8/[3,2,1]));
        sig = sig + (SinOsc.ar(base/0.864/mod) * LFTri.ar(~tempo/16/[1,2,3]));
 //       sig = sig + (BrownNoise.ar(LFTri.ar(~tempo/2/[1,2,3])));
        sig = AllpassL.ar(sig,8/(base/0.864*mod),4/(base/0.864*mod),4/~tempo)/4+sig;
        sig = (Perlin3.ar(sig/8+1,sig/4+1,LFTri.ar(~tempo/64/[1,2,3])*4) * LFTri.ar(~tempo/[4,5,6]));
        sig = LeakDC.ar(sig);
        sig = BPF.ar(sig,base/0.864/mod*[1,2,1/2],LFTri.ar(~tempo/[1,2,3,4,5,6]).range(0.01,0.8)**1.5);
        //sig = CombL.ar(sig,~tempo*[4,8,16],~tempo*[4,8,16],~tempo);
        sig = AllpassN.ar(sig,1/~tempo,1/~tempo/2,1/~tempo);

        sig = Splay.ar(sig,0.75,0.05,SinOsc.kr(~tempo)/4.001);
        sig = CompanderD.ar(sig,1/2,1/2,1);
        sig = DelayN.ar(sig,[0,SinOsc.kr(~tempo/16.02).range(phase/2,phase*2)]/base*mod,[0,SinOsc.kr(~tempo/16.02).range(phase/2,phase*2)]/base*mod);
        sig;
    };
    ~two.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


(
    ~three.ar(2);
    ~three.quant=4;
    ~three.fadeTime=4;
    ~three={
        var mod2 = Duty.kr(Dseq([16,8,16,8],inf)/~tempo,0,Dseq([1,2,1.5,1.25],inf)).lag(1/12);
        var mod = Duty.kr(4*[1/4,1/2,4,8,16,32]/~tempo,0,Dseq([1,2,4,1.5,1.25,8,1.5,2,16,1.333334,4,15/8],inf)).lag(1/120);
        var base = [60,48,72].midicps*4*mod2 + SinOsc.kr(~tempo/7.99/[1,2,3,4,5,6],mul:0.5);
        var sig = LFPulse.ar(base[0,1,2]/0.864/mod) * LFTri.ar(~tempo/[4,16,32]);
        var phase = LFTri.kr(~tempo/4)**2+0.5;
        sig = sig + (LFSaw.ar(base[3,4,5]/0.864/mod) * LFTri.ar(~tempo/8/[3,2,1]));
        sig = sig + (SinOsc.ar(base/0.864/mod) * LFTri.ar(~tempo/16/[1,2,3]));
   //     sig = sig + (BrownNoise.ar(LFTri.ar(~tempo/2/[1,2,3])));
        sig = AllpassL.ar(sig,8/(base/0.864*mod),4/(base/0.864*mod),4/~tempo)/4+sig;
        sig = (Perlin3.ar(sig/8+1,sig/4+1,LFTri.ar(~tempo/64/[1,2,3])*4) * LFTri.ar(~tempo/[4,5,6]));
        sig = LeakDC.ar(sig);
        sig = BPF.ar(sig,base/0.864/mod*[1,2,1/2],LFTri.ar(~tempo/[1,2,3,4,5,6]).range(0.01,0.8)**1.5);
        //sig = CombL.ar(sig,~tempo*[4,8,16],~tempo*[4,8,16],~tempo);
        sig = AllpassN.ar(sig,1/~tempo,1/~tempo/2,1/~tempo);

        sig = Splay.ar(sig,0.75,0.025,SinOsc.kr(~tempo)/4.01);
        sig = CompanderD.ar(sig,1/2,1/2,1);
        sig = DelayN.ar(sig,[0,SinOsc.kr(~tempo/16.03).range(phase/2,phase*2)]/base*mod,[0,SinOsc.kr(~tempo/16.03).range(phase/2,phase*2)]/base*mod);
        sig;
    };
    ~three.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


// kick synth ///////////////////////////////////////

(
    ~kick.ar(2);
    ~kick.quant=[16,0];
    ~kick.fadeTime=0.02;
    ~kick={
        //  |       |       |       |       |  
        var pat = [
            1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
            1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
            1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
            1,0,0,0, 0,0,0,0, 1,0,0,0, 1,1,1,1,
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3]),imp * hit);
        var sig = SinOsc.ar(57.8703/1.33334,env**80*8pi);
        sig = sig * env;
        Splay.ar(sig,1,0.25);
    };
    ~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;

57.8703/1.25

(
    ~master.quant=2;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.2335,lp=3500,hp=250,len=10,rev = 3|
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
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(60);};});
}.fork;  
)
50/0.864
