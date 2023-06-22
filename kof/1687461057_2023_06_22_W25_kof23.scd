

s.boot();


p=ProxySpace.push();


~tempo = {110/120};

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=8;
~one.fadeTime=1;
~one={
    var ulmod = 2** (Duty.kr(4/~tempo/[1,2,3],0,Dseq([1,3,-12,7],inf))/12);
    var scale = LFTri.ar(~tempo*4/[1,2,3,4])*LFNoise1.kr(~tempo/4).range(0.1,20);
    var base = Duty.kr([4,2]/~tempo,0,Dseq([40,80,40,50]*.x[1,2],inf)) / ulmod;
    var mod3 = Duty.kr([1/4,1]/~tempo,0,Dseq([1,12,1,24],inf));
    var mod2 = Duty.kr([3,6,4]/~tempo,0,Dseq([7,8],inf));
    var mod = Duty.kr([4,8,12]/~tempo,0,Dseq([7,9,11,12,24,-12,-4,7],inf));
    var freq = base * (2**(1/[mod3,mod2,mod]));
    var sig = LFSaw.ar(freq) * 2pi;
    sig = Perlin3.ar(sig.cos*scale,sig.sin*scale,LFSaw.ar(~tempo/4/[1,2,3]).range(0,2pi).sin);
    sig = LeakDC.ar(sig);
    sig = Resonz.ar(sig,freq+SinOsc.ar([3,4,5]),LFNoise2.kr(~tempo/[1,2,3]).range(0.1,0.9) )/8+sig;
    sig = CombL.ar(sig,2/freq,1/freq,LFNoise2.kr(~tempo*4/[1,2,3]).range(1/8,2))/2+sig;
    sig = CompanderD.ar(sig,3/4,1/2,1)/4+sig;
    //sig = HPF.ar(sig,900) + LPF.ar(Pulse.ar(~tempo*4/[1,2,3,4]),1800);
    sig = LPF.ar(sig,900);
    sig = GVerb.ar(sig,60,3)/4+sig;
    sig = Compander.ar(sig,~kick.ar,8/10,1/10,1);
    Splay.ar(sig,0.35,0.025);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

(
    ~tick.kr(1);
    ~tick.clock = p.clock;
    ~tick.quant=24;
    ~tick = { Impulse.kr(~tempo * 4); };
    ~counter = {PulseCount.kr(~tick.kr);};
);		

// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=24;
~kick.fadeTime=0.02;
~kick={
    //  |       |       |       |       |  
    var pat = [
        1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
        1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
        1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
        1,0,1,0, 1,0,1,0, 1,0,1,0, 1,1,1,1,
    ].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3]),imp * hit);
    var sig = SinOsc.ar(40!2 , env**30*8pi);
    sig = sig * env;
    Splay.ar(sig,1,0.95);
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
~hiss.quant=24;
~hiss.fadeTime=0.02;
~hiss={
    //  |       |       |       |       |  
    var pat = [
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,1,1,
    ].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15],[3,-3]),imp * hit);
    var sig = WhiteNoise.ar(0.7);
    sig = sig * env;
    Splay.ar(sig,0.75,0.5);
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
