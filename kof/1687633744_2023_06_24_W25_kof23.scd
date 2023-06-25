

p.push();
p.bpm(110);
s.latency=0.2;
(
    p=ProxySpace.push(s.boot);
    p.makeTempoClock;
);

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
    var sig = Si;
    Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;



// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=6;
~one={
    var base = [2200,22];
    var sig = WhiteNoise.ar(0.7!3) + LFSaw.ar(40);
    sig = BPF.ar(sig,base/4*(2**([1,8,24,12]/12)), LFNoise1.kr(~tempo/16!4).range(0.1,0.9) );
    sig = HPF.ar(sig*LFSaw.ar(~tempo*[4,4.01]/(12..1)),[base,base/2,base*4]) + (LPF.ar(sig,3200)*2*Pulse.ar(~tempo*4/(1..12)));
    sig = CombL.ar(sig,4/220,LFSaw.ar(~tempo*4/[1,2,3,4]).range(4,1)/220,0.1)/2+sig;
    Splay.ar(sig,0.75,0.9,SinOsc.ar(40));
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


// two synth ///////////////////////////////////////

(
~two.ar(2);
~two.quant=4;
~two.fadeTime=2;
~two={
    var harm = 2**([1,5,7]/12); // 2**Duty.kr(4/~tempo,0,Dseq([1,5,8,12]/12,inf));
    var sig = LFSaw.ar([~tempo/4,~tempo/4.001,[40,80,16000/[1,2,4,8,16,32,64]]*harm]) * 2pi;
    sig = Perlin3.ar(sig[0].cos,sig[1].sin,sig[2].sin);
    sig = LeakDC.ar(sig) * Pulse.ar(~tempo*1/4);
    Splay.ar(sig,0.75,0.15,SinOsc.kr(4.01));
};
~two.play;
);
~two.stop(30);
~two.clear;
~two.pause;
~two.resume;


// kikkk synth ///////////////////////////////////////

(
~kikkk.ar(2);
~kikkk.quant=4;
~kikkk.fadeTime=2;
~kikkk={
    var sig = SinOsc.ar(50!2);
    Splay.ar(sig,0.5,0.25);
};
~kikkk.play;
);
~kikkk.stop(4);
~kikkk.clear;
~kikkk.pause;
~kikkk.resume;

(
    ~tick.kr(1);
    ~tick.clock = p.clock;
    ~tick.quant=4;
    ~tick = { Impulse.kr(~tempo * 4); };
    ~counter = {PulseCount.kr(~tick.kr);};
);        

// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=4;
~kick.fadeTime=0.02;
~kick={
    //  |       |       |       |       |  
    var pat = [
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1,
    ].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3]),imp * hit);
    var sig = SinOsc.ar(40,env**40*8pi);
    sig = sig * env;
    Splay.ar(sig,1,0.95);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;
(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
)

// son synth ///////////////////////////////////////

(
~son.ar(2);
~son.quant=4;
~son.fadeTime=2;
~son={
    var sig = Pulse.ar(4);
    Splay.ar(sig,0.5,0.25);
};
~son.play;
);
~son.stop(4);
~son.clear;
~son.pause;
~son.resume;

(
    //s.latency=0.2;
    //p.clock.tempo_(120/60);
    p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
    ~tick.kr(1);
    ~tick.quant = 24;
    ~counter.quant = 24;
    ~counter = {PulseCount.kr(~tick.kr);};
    ~tick = { Impulse.kr( ~tempo * 4 ); };
);

(
    //s.latency=0.2;
    //p.clock.tempo_(120/60);
    p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
    ~tick.kr(1);
    ~tick.quant = 24;
    ~counter.quant = 24;
    ~counter = {PulseCount.kr(~tick.kr);};
    ~tick = { Impulse.kr( ~tempo * 4 ); };
);

(
    //s.latency=0.2;
    //p.clock.tempo_(120/60);
    p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
    ~tick.kr(1);
    ~tick.quant = 24;
    ~counter.quant = 24;
    ~counter = {PulseCount.kr(~tick.kr);};
    ~tick = { Impulse.kr( ~tempo * 4 ); };
);

(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
)


(
    ~tick.kr(1);
    ~tick.clock = p.clock;
    ~tick.quant=4;
    ~tick = { Impulse.kr(~tempo * 4); };
    ~counter = {PulseCount.kr(~tick.kr);};
);        

b = Buffer.read(s,Platform.resourceDir ++ "/sounds/violin1.wav");

// player synth ///////////////////////////////////////

(
    ~vio.ar(2);
    ~vio.quant=4;
    ~vio.fadeTime=2.02;
    ~vio={
    var mod = [1,1/2,2**([5,9]/12),-1,2,4,8];//[-1,0.25,-0.25,1/8,1/16];
    var spread = 0.001;
    var pos = LFSaw.kr(~tempo/4);
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.26,0.95],[3,-3],curve:'exp'),imp * hit);
    var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);

    sig = sig * env;
    Splay.ar(sig.flat,1,0.95);
    };
    ~vio.play;
);
~vio.stop(7);
~vio.clear;

b = Buffer.read(s,Platform.resourceDir ++ "/sounds/breakbeat1.wav");

// player synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.quant=4;
    ~one.fadeTime=2.02;
    ~one={
    var mod = ([1,4,8]);//[-1,0.25,-0.25,1/8,1/16];
    var spread = 0.01;
    var pos = LFSaw.ar([1/4,4,1/7]);
    //         |       |       |       |       |  
    var pat = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.95],[3,-3],curve:'exp'),imp * hit);
    var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);

    sig = sig * env;
    sig = HPF.ar(sig,480);
    Splay.ar(sig.flat,0,1);
    };
    ~one.play;
);
~one.stop(7);
~one.clear;
