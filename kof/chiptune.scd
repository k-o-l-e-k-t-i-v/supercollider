
// chiptune synth ///////////////////////////////////////

(
    ~chiptune.ar(2);
    ~chiptune.quant=2;
    ~chiptune.fadeTime=1;
    ~chiptune={
        var mod2 = Duty.kr(16,0,Dseq([1,2,4,2,0.5],inf));
        var mod = Duty.kr(4,0,Dseq([1,2,0.5,1.5]*mod2,inf));
        var mod1 = Duty.kr(1/8,0,Dseq([1,2,1.5,1.3333,4,1,2,4,1.33333,2,4,1.5,4]*mod,inf));
        var sig = LFPulse.ar([600,8000/mod1,250,500]/mod1,add:-0.5,mul:LFTri.ar(1/4/[1,2,3,4])**1.5);
        sig = LeakDC.ar(sig);
        Splay.ar(sig,1,0.5,LFPulse.ar(8,add:-0.5,mul:2));
    };
    ~chiptune.play;
);
~chiptune.stop(4);
~chiptune.clear;
~chiptune.pause;
~chiptune.resume;

(
    p.clock.tempo_(120/60);

    ~offset = {(0..7)/8};

    ~tick.quant = 1;
    ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

    ~counter = {PulseCount.kr(~tick.kr)};
);


// kick synth ///////////////////////////////////////

(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.05],[3,-3],curve:'exp'),imp * hit);
        var sig = LFPulse.ar(40+(env**[20,10]*800),add:-0.5,mul:2);
        sig = sig * env;
        sig = LeakDC.ar(sig);
        Splay.ar(sig,0.95,0.5);
    };
    ~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;

// hh synth ///////////////////////////////////////

(
    ~hh.ar(2);
    ~hh.quant=2;
    ~hh.fadeTime=0.2;
    ~hh={
        //         |       |       |       |       |  
        var pat = [1,0,1,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = LFPulse.ar(8000/[1,2,1.5,8],add:-0.5,mul:2);
        sig = sig * env;
        sig = LeakDC.ar(sig);
        Splay.ar(sig,0.95,0.5);
    };
    ~hh.play;
);
~hh.stop(4);
~hh.clear;
~hh.pause;
~hh.resume;


// ff filter ///////////////////////////////////////

(
    ~ff.quant=1;
    ~ff.fadeTime=1;
    ~ff={
        var synths = p.playingProxies;
        var high,mid,low;
        var sig = [];
        synths.collect{|n| if(n!=\ff){sig=sig++p.[n.asSymbol];}};

        //sig = Resonz.ar(sig,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
        //sig = CombN.ar(sig,4,[4,8,16],32)+sig;
        //sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
        low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/2,1/2);
        mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/2,1/2);
        high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/2,1/2);
        sig = CompanderD.ar((high+mid+low).flat,3/4,1/2,1/2,0.002,0.3);
        sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),4000),2000);
        Splay.ar(sig,0.75,0.25);
    };
    ~ff.play;
);
~ff.stop(7);
~ff.clear;
