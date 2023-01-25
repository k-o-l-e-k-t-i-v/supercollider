s.reboot;
p.push();

~tempo = {110/60}

// oneeee synth ///////////////////////////////////////

(
~oneeee.ar(2);
~oneeee.quant=24;
~oneeee.fadeTime=0.1;
~oneeee={
    var mel = Duty.kr(4/~tempo,0,Dseq([1,2,1.5,1.33333,1,1,1,1],inf));
    var base = [40,40,400,4000]*mel;
    var frac = Duty.kr([4,3,2,1]*.x[1,2,4,8]/.x[1,2,3,4]/~tempo,0,Dseq(1/(1..12)+1,inf)).lag(0.125);
    var perl = Perlin3.ar(SinOsc.ar(frac*base),SinOsc.ar(base/frac).range(0,2pi),LFTri.ar(base/((1..12)+1)).range(0,8pi));
    var sig = perl * Decay.ar(Impulse.ar(~tempo/(1..12)/frac),LFSaw.kr(~tempo/24/[1,2,3,4]).range(0.001,0.5));
    var pre = sig;
    sig = sig * Pulse.ar(~tempo/[1,2,3,4]);
    sig = CombL.ar( sig,4/frac/~tempo,1/frac/~tempo,4/~tempo)/8 + pre;
    sig = CompanderD.ar(sig,3/4,1/2,1) + pre;
    sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
    Splay.ar(sig,LFSaw.kr(~tempo/4).range(0.2,0.8),0.25);
};
~oneeee.play;
);
~oneeee.stop(4);
~oneeee.clear;
~oneeee.pause;
~oneeee.resume;


// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=24;
~kick.fadeTime=0.02;
~kick={
    //  |       |       |       |       |  
    var pat = [
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,1,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,1,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,1,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1,
    ].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3]),imp * hit);
    var sig = SinOsc.ar(40!2+(env**20*800),env**40*8pi);
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
    s.latency=0.5;
    p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
    ~tick.kr(1);
    ~tick.quant = 24;
    ~counter.quant = 24;
    ~counter = {PulseCount.kr(~tick.kr);};
    ~tick = { Impulse.kr( ~tempo * 4 ); };
);
