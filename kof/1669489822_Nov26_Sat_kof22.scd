s.reboot;
p.push();



b = Buffer.read(s,"/home/kof/Downloads/isorythm.wav");


(
    ~tick.kr(1);
    ~tick.clock = p.clock;
    ~tick.quant=4;
    ~tick = { Impulse.kr(~tempo * 4); };
    ~counter = {PulseCount.kr(~tick.kr);};
);

// player synth ///////////////////////////////////////

(
    ~sam.ar(2);
    ~sam.quant=4;
    ~sam.fadeTime=2.02;
    ~sam={
        var mod = [1,1/2,0.25,5/4,4/3];//[-1,0.25,-0.25,1/8,1/16];
    var spread = 0.00001;
        var pos = LFSaw.kr(~tempo/2400/(1..12)).range(0.25,1);
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[[0.02,4.02],[0.65,0.12]],[3,-3],curve:'exp'),imp * hit);
    var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);

    sig = sig * env;
        Compander.ar(sig,~kick.ar,1,0.1,1);
    Splay.ar(sig.flat,0.95,0.95);
    };
    ~sam.play;
);
~sam.stop(7);
~sam.clear;


// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=4;
~kick.fadeTime=0.02;
~kick={
    //  |       |       |       |       |  
    var pat = [
        1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
        1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
        1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
        1,0,1,0, 1,0,1,0, 1,0,1,0, 1,1,1,1,
    ].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.95],[3,-3]),imp * hit);
    var sig = SinOsc.ar(45!2+(env**45*200));
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
    //s.latency=0.2;
    //p.clock.tempo_(120/60);
    p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
    ~tick.kr(1);
    ~tick.quant = 4;
    ~counter.quant = 4;
    ~counter = {PulseCount.kr(~tick.kr);};
    ~tick = { Impulse.kr( ~tempo * 4 ); };
);
