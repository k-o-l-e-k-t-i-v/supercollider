


p.push();

~tempo={110/60}



// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=24;
~one.fadeTime=4;
~one={
    var div = [1,2,3];
    var sig = SinOsc.ar(40!2);
    Splay.ar(sig,0.25,0.15);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

// noise synth ///////////////////////////////////////

(
~noise.ar(2);
~noise.quant=24;
~noise.fadeTime=0.02;
~noise={
    //  |       |       |       |       |  
    var pat = [
        1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
        0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
        0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
        0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    ].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3]),imp * hit);
    var sig = Noise3.ar([1,2,4]);
    sig = sig * env;
    Splay.ar(sig,0.75,0.5);
};
~noise.play;
);
~noise.stop(4);
~noise.clear;
~noise.pause;
~noise.resume;
// vim:set et sw=4 ts=4: synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=24;
~one.fadeTime=0.1;
~one={
    var first = Duty.kr([1,8]/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
    var second = Duty.kr([16,24]/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
    var third = Duty.kr([1,2,4]/4/~tempo,0,Dseq(1+1/(1..24),inf));
    var harm2 = [first,second,third];
    var low = LFTri.kr(~tempo/4).exprange(0.01,0.99);
    var high = LFTri.kr(~tempo/24).exprange(0.01,0.99);
    var puls = [] ++ ~tempo/2*([1,2]);
    var sig = SinOsc.ar(40*harm2,Pulse.ar(puls)) * Pulse.ar(puls);
    sig = CombC.ar(CompanderD.ar(sig,3/4,low,high)/4,1/~tempo,1/~tempo,~tempo*4)/2+sig;
    sig = CombL.ar(CompanderD.ar(sig,1/2,high,low)/4,2/harm2,1/harm2,~tempo*4)/2+sig;
    Splay.ar(sig,0.05,0.95);
};
~one.play;
);
~one.stop(60);
~one.clear;
~one.pause;
~one.resume;

~tempo = {110/60+SinOsc.kr(60/37.5).range(0.1,-0.1)}

// harmonics synth ///////////////////////////////////////

(
~harmonics.ar.(2);
~harmonics.quant=24;
~harmonics.fadeTime=0.04;
~harmonics={
    var first = Duty.kr([1,8]/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
    var second = Duty.kr([16,24]/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
    var third = Duty.kr([1,2,4]/4/~tempo,0,Dseq(1+1/(1..24),inf));
    var harm2 = [first,second,third];
    var base = 160 * [1,second,third];
    var dis = LFNoise2.kr(~tempo/1/(1..24))*1/24;
    var harm = Duty.kr([1/2,4]/~tempo,0,Dseq(1+(1/(24..1))*4 ,inf) ).lag(1/4);
    var freq = base * harm + dis;
    //var sig = SinOsc.ar(freq,Pulse.ar(~tempo*2/[1,2,24,4]),1/(1..12)) * Pulse.ar(~tempo*2/[1,2,3,4]);
    var sig = LeakDC.ar(LFSaw.ar(freq,mul:0.02) + SinOsc.ar(40!2,Pulse.ar(~tempo/(1..24).nthPrime)));// * Pulse.ar(~tempo/(1..24).nthPrime);
    sig = CombC.ar(sig/8,harm2/freq,harm/freq,~tempo).softclip + sig ;
    sig = CombL.ar(CompanderD.ar(sig,3/4,2,1)/4,1/~tempo,1/~tempo,~tempo*4)/48+sig;
    sig = LPF.ar(sig,5500) + (sig/24);
    sig = Compander.ar(sig,~one.ar,0.5,LFSaw.kr(~tempo/4).range(0.1,0.9),1-LFSaw.kr(~tempo/4));
    Splay.ar(sig,0.75,0.125);
};
~harmonics.play;
);
~harmonics.stop(4);
~harmonics.clear;
~harmonics.pause;
~harmonics.resume;


// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=4;
~kick.fadeTime=0.02;
~kick={
    //  |       |       |       |       |  
    var pat = [
        1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
        1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
        1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
        1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    ].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3]),imp * hit);
    var sig = SinOsc.ar(40!2+(env**80*400),env**10*2pi);
    sig = sig * env;
    Splay.ar(sig,0.75,0.95);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;


// kick2 synth ///////////////////////////////////////

(
~kick2.ar(2);
~kick2.quant=4;
~kick2.fadeTime=0.02;
~kick2={
    //  |       |       |       |       |  
    var pat = [
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    ].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,[1,2].nthPrime,~counter.kr%pat.size);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.35],[3,-3]),imp * hit);
    var sig = SinOsc.ar(40!2+(env**80*4000),env**20*8pi) + LFSaw.ar(40!2,mul:0.1);
    sig = sig * env;
    Splay.ar(sig,0.75,0.5);
};
~kick2.play;
);
~kick2.stop(4);
~kick2.clear;
~kick2.pause;
~kick2.resume;

// hiss synth ///////////////////////////////////////

(
~hiss.ar(2);
~hiss.quant=4;
~hiss.fadeTime=0.02;
~hiss={
    //  |       |       |       |       |  
    var pat = [
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    ].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.05,0.25],[3,-3]),imp * hit);
    var sig = HPF.ar(WhiteNoise.ar(1!4),[1200,1600,5000,15000]);
    sig = sig * env;
    Splay.ar(sig,0.15,0.25);
};
~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;

(
    //s.latency=0.2;
    //p.clock.tempo_(120/60);
    p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
    ~tick.kr(1);
    ~tick.quant = 4;
    ~counter.quant = 4;
    ~counter = {PulseCount.kr(~tick.kr);};
    ~tick = { Impulse.kr( ~tempo * 4 ); };
);


(1+(1/(1..12))).log
