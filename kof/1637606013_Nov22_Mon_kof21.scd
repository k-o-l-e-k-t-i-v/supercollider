

p=ProxySpace.push(s)

~tempo={120/123.5}

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
    ~tick.kr(1);
    ~tick.clock = p.clock;
    ~tick.quant=1;
    ~tick = { Impulse.kr(~tempo * 4); };
    ~counter = {PulseCount.kr(~tick.kr);};
);		


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=24;
~one.fadeTime=4;
~one={
var duty = Duty.kr(4/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
    var sig = SinOsc.ar([35,350,70,3500/duty]*(2/[1,2,3,4]+1)!2,Pulse.ar(4/[1,2,3,4]*~tempo)) * LFSaw.ar(~tempo/4/[1,2,3,4]);
    sig = HPF.ar(sig,800) * LFPulse.ar(~tempo*8/[1,3,6,9]) + LPF.ar(sig,800);
    sig = CombL.ar(sig,1/(~tempo*35),1/2/(~tempo*35),1);
    Splay.ar(sig,0.95,0.025);
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
~kick.quant=[24,0];
~kick.fadeTime=0.02;
~kick={
    //  |       |       |       |       |  
    var pat = [
        1,0,0,0, 0,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 0,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 0,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 0,0,0,0, 1,0,0,0, 1,0,1,0,
    ].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,[1,2],~counter.kr%pat.size);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3]),imp * hit);
    var sig = SinOsc.ar(35!2,env**20*2pi);
    sig = sig * env;
    Splay.ar(sig,0.95,0.25);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;
