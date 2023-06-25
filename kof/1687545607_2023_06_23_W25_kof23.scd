

p.push();


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=4;
~one={
    var sig = SinOsc.ar([40,50,60]*Pulse.ar(~tempo));
    Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;



b = Buffer.read(s,Platform.resourceDir ++ "/sounds/violin1.wav");

// player synth ///////////////////////////////////////

(
    ~vio.ar(2);
    ~vio.quant=4;
    ~vio.fadeTime=2.02;
    ~vio={
    var mod = 2 ** ([-12,5,8]/12);
    var spread = 0.001;
    var pos = LFSaw.kr([4,-1,1/2]);
    //         |       |       |       |       |  
    var pat = [1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.2,0.75],[3,-3],curve:'exp'),imp * hit);
    var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);

    sig = sig * env;
    Splay.ar(sig.flat,0.5,0.95);
    };
    ~vio.play;
);
~vio.stop(7);
~vio.clear;

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

b = Buffer.read(s,Platform.resourceDir ++ "/sounds/breakbeat2.wav");

// player synth ///////////////////////////////////////

(
    ~testttt.ar(2);
    ~testttt.quant=4;
    ~testttt.fadeTime=2.02;
    ~testttt={
    var mod = [1,-1,4];
    var spread = 0.05;
    var pos = LFSaw.kr([16,1/16,8.01]);
    //         |       |       |       |       |  
    var pat = [1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,1].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,[1,2,3],~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.75],[3,-3],curve:'exp'),imp * hit);
    var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);

    sig = sig * env;
    Splay.ar(sig.flat,0.5,0.95);
    };
    ~testttt.play;
);
~testttt.stop(7);
~testttt.clear;
