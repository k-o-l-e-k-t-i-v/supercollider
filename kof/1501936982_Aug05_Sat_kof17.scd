

p.bpm(120)
p.push();


// complexNoise synth ///////////////////////////////////////

(
    ~complexNoise.ar(2);
    ~complexNoise.clock = p.clock;
    ~complexNoise.quant=16;
    ~complexNoise.fadeTime=2;
    ~complexNoise={
        var pls = 1+(0.01/[1,3,7]);
        var sp = 8*1.5*(1..20);
        var mood = Duty.kr(sp,0,Dseq([1,2,1.5,1.33333]*.x[2,4,1/2,3.1415],inf)) ;
        var time = LFSaw.ar([43.2,432/1.5]*8/(mood)).range(0,2pi) + LFTri.kr(1/600/sp,mul:10);
        var time2 = LFSaw.ar(1.5/[1,2,3]).range(0,2pi) + LFTri.kr(1/599/sp,mul:10);

        var r = SinOsc.ar(42/mood).range(0.001,0.2);
        var sig;
        var x = time.cos + 1 * r;
        var y = time.sin + 1 * r;
        var z = time2.sin + 1 * r;
        #x,y,z = SinOsc.kr(1/sp).range(0.01,4)**[x,y,z];
        sig = Perlin3.ar(x,y,z) * (LFTri.ar(1/sp)**3) ;
        sig = LeakDC.ar(sig);
        sig = LPF.ar(sig,15000);
        sig = HPF.ar(sig,20);
        sig = Vibrato.ar(sig,[6,7,8]+0.1,0.02);
        sig = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/32!3).range(1500,4000))+HPF.ar(sig,LFNoise1.kr(1/32!3).range(2500,7500)),3/4,1/[2,1,5.3],1).softclip;
        sig = Compander.ar(sig,~pulsar.ar,0.1,1,0.1);
        Splay.ar(sig,0.225/32,0.23,SinOsc.ar(1.51/[1,1.5]));
    };
    ~complexNoise.play;
);
~complexNoise.stop(120);
~complexNoise.clear;
~complexNoise.pause;
~complexNoise.resume;

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
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,1,0,
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2],[3,-6]),imp * hit);
        var sig = SinOsc.ar(43.2+(env**40*200),env**80*8pi) + (VarSaw.ar(43.2,0,env**0.2,mul:0.4));
        sig = sig * env;
        Splay.ar(sig,0.75,0.5);
    };
    ~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;

// hiss synth ///////////////////////////////////////

(
    ~hiss.ar(2);
    ~hiss.clock = p.clock;
    ~hiss.quant=[16,0];
    ~hiss.fadeTime=0.02;
    ~hiss={
        //  |       |       |       |       |  
        var pat = [
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,1,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,1,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,1,0,
            0,0,1,0, 0,0,1,0, 1,0,1,0, 1,0,1,0,
        ].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3],~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15],[3,-3]),imp * hit);
        var sig = WhiteNoise.ar(env**2);
        sig = BPF.ar(sig,LFNoise2.kr(1/4!3).range(500,15000/[1,2,3])) * LFSaw.ar(30);
        sig = sig * env;
        sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
        Splay.ar(sig,0.75,0.5);
    };
    ~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;

(
    s.latency=0.2;
    //p.clock.tempo_(120/60);
    p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
    ~tick.kr(1);
    ~tick.clock = p.clock;
    ~tick.quant = 16;
    ~counter.clock = p.clock;
    ~counter.quant = 16;
    ~counter = {PulseCount.kr(~tick.kr);};
    ~tick = { Impulse.kr( ~tempo * 4 ); };
);

(
    ~master.quant=2;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.15,lp=3500,hp=150,len=10,rev = 3|
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
