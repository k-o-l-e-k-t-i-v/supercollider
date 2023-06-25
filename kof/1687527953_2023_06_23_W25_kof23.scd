


s.boot();

p=NetProxy.push();
p.bpm(120)


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=4;
~one={
    var mel = Duty.kr(1/[4,16,64]/~tempo,0,Dseq([1,5,8,9,8,7,8,11,8,24,7,12],inf));
    var base = 200 * (2**([mel,mel%3,mel%5]/12));
    var sig = LFSaw.ar([base/4,4,base]) * 2pi;
    sig = Perlin3.ar(sig[0].cos,sig[1].sin,sig[2].sin) + SinOsc.ar(base,mul:[1,0.01]);
    sig = LeakDC.ar(sig);
    //sig = sig * Pulse.ar(~tempo*4/[1,2,3,4]);
    sig = CombL.ar(sig,2/base,2/base,1)/8+sig;
    sig = LPF.ar(sig,base*2);
    
    Splay.ar(sig,1,0.15);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=24;
~kick.fadeTime=0.02;
~kick={
    //  |       |       |       |       |  
    var pat = [
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1,
    ].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,2,~counter.kr%pat.size);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3]),imp * hit);
    var sig = SinOsc.ar(40!2,env**20*8pi);
    sig = sig * env;
    Splay.ar(sig,0.75,0.5);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;


(
    s.latency=0.2;
    //p.clock.tempo_(120/60);
    p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
    ~tick.kr(1);
    ~tick.quant = 24;
    ~counter.quant = 24;
    ~counter = {PulseCount.kr(~tick.kr);};
    ~tick = { Impulse.kr( ~tempo * 4 ); };
);

(
    ~tick.kr(1);
    ~tick.clock = p.clock;
    ~tick.quant=24;
    ~tick = { Impulse.kr(~tempo * 4); };
    ~counter = {PulseCount.kr(~tick.kr);};
);		
