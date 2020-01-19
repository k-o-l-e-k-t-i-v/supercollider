p.push();
p.bpm(90*1.5)

b = Buffer.alloc(s,48000,2);
k = Buffer.alloc(s,48000,2);

(
    //s.latency=0.2;
    //p.clock.tempo_(120/60);
    p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
    ~tick.kr(1);
    ~tick.quant = 0;
    ~counter.quant = 0;
    ~counter = {PulseCount.kr(~tick.kr);};
    ~tick = { Impulse.kr( ~tempo * 4 ); };
);

// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.quant=16;
    ~one.fadeTime=0.4;
    ~one={
        var mod = Duty.kr([4,8,7,16]/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
        var env = LFSaw.ar(~tempo/[4,16,3,3/4]);
        var sig = SinOsc.ar(40+(env**LFNoise1.kr(~tempo/32!4).range(0.1,90)*15000/mod),Pulse.ar(~tempo/[1,2,3,4])) * Pulse.ar(~tempo/(1..12));
        sig = BufDelayL.ar(b.bufnum,Splay.ar(sig,0,0.15),LFTri.kr(~tempo*16).range(0,0.1));
        sig = BPF.ar(sig,500+LFNoise2.kr(~tempo/64/[1,2,3,4]).range(0,5000),LFNoise1.kr(~tempo/[1,2,3,4]).range(0.2,0.5));
        sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
        sig;
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


// hiss synth ///////////////////////////////////////

(
    ~hiss.ar(2);
    ~hiss.quant=16;
    ~hiss.fadeTime=0.02;
    ~hiss={
        //  |       |       |       |       |  
        var pat = [
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1,
        ].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[6,-6]),imp * hit);
        var sig = WhiteNoise.ar(2!4);
        sig = sig * env;
        sig = HPF.ar(sig,15000);
        Splay.ar(sig,0.75,0.95);
    };
    ~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;



// kick synth ///////////////////////////////////////

(
    ~kick.ar(2);
    ~kick.quant=16;
    ~kick.fadeTime=0.02;
    ~kick={
        //  |       |       |       |       |  
        var pat = [
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1,
        ].rotate(1);
        var mod = Duty.kr(4/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.75],[3,-3]),imp * hit);
        var sig = SinOsc.ar(40+(env**50*2000),env**80*8pi) + LFSaw.ar(40,env,mul:0.9*env);
        sig = sig * env;
        //     sig = BufDelayL.ar(k.bufnum,Splay.ar(sig,0,0.95),LFTri.kr(~tempo*4*mod).range(0,0.05));
        Splay.ar(sig,0.0,0.15);
    };
    ~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;


// high synth ///////////////////////////////////////

(
    ~high.ar(2);
    ~high.quant=[16,0];
    ~high.fadeTime=0.02;
    ~high={
        //  |       |       |       |       |  
        var pat = [
            1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
            0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
            0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
            0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3]),imp * hit);
        var sig = SinOsc.ar(LFNoise0.kr(~tempo*20!3).range(50,1500).round(7.midicps)) * LFPulse.ar(~tempo*4/[1,2,3]);
        sig = sig * env;
        Splay.ar(sig,0.75,0.25);
    };
    ~high.play;
);
~high.stop(4);
~high.clear;
~high.pause;
~high.resume;

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
