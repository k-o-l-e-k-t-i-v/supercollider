


p.push();
p.bpm(87.975);
b = Buffer.alloc(s,48000,24);
z = Buffer.alloc(s,48000,24);
k = Buffer.alloc(s,48000,2);
h = Buffer.alloc(s,48000,2);


(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
)

// one synth ///////////////////////////////////////


(1/12)*((2..13).log2)

(
    ~one.ar(2);
    ~one.quant=16;
    ~one.fadeTime=0.1;
    ~one={
        var base = Duty.kr([24,48,96,32]/~tempo,0,Dseq([60,65,67,58]-.x[24,36]+.x[0,7],inf)).midicps.lag(1/120) + SinOsc.kr(~tempo/4.01/[1,2,3,4]/.x(2..24).log2).range(-1,1);
        var imp = Impulse.ar(~tempo*2/[1,2,3,4]);
        var sig = LFSaw.ar(base/(2**(([2,5,7,9]).log2/12)));
        var env;
        imp = BufDelayN.ar(b.bufnum,imp,
            SinOsc.kr(~tempo/120/[1,2,3,4]/.x(2..24).log2).range(0.0001,0.5) + 
            SinOsc.kr(~tempo/12.0001/[1,2,3,4]/.x(2..24).log2).range(0.0001,0.05) + 
            SinOsc.kr(~tempo/1.20001/[1,2,3,4]/.x(2..24).log2).range(0.0001,0.005) 
        );
        env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3]),imp);
        sig = sig * env;
        sig = BufDelayN.ar(z.bufnum,sig,
            SinOsc.kr(~tempo/1200/[1,2,3,4]/.x(2..24).log2).range(0.0001,0.5) + 
            SinOsc.kr(~tempo/120.001/[1,2,3,4]/.x(2..24).log2).range(0.0001,0.05) + 
            SinOsc.kr(~tempo/12.0001/[1,2,3,4]/.x(2..24).log2).range(0.0001,0.005) 
        );
        sig = MoogFF.ar(sig,1500+LFSaw.ar(~tempo/4/(1..25)).exprange(0.0001,15000),1.7);
        sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
        Splay.ar(sig,0.75,0.1335);
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
    ~kick.quant=[16,0];
    ~kick.fadeTime=0.02;
    ~kick={
        //  |       |       |       |       |  
        var pat = [
            1,0,0,0, 1,0,0,0, 1,0,0,0,
            1,0,0,0, 1,1,0,0, 1,0,0,0,
            1,0,0,0, 1,0,1,0, 1,0,0,0,
            1,0,0,0, 1,0,0,1, 1,1,1,1,
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.25],[3,-3]),imp * hit);
        var sig = SinOsc.ar(40+(env**40*90),env**40*8pi) + BrownNoise.ar(env**40);
        sig = sig * env;
        sig = BufDelayN.ar(k.bufnum,sig,LFSaw.ar(~tempo/12).range(0,1/~tempo/12));
        Splay.ar(sig,0,0.25);
    };
    ~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;

// hat synth ///////////////////////////////////////

(
    ~hat.ar(2);
    ~hat.quant=[16,0];
    ~hat.fadeTime=0.02;
    ~hat={
        //  |       |       |       |       |  
        var pat = [
            1,0,0,0, 1,0,0,0, 1,0,0,0, 
            1,0,0,0, 1,0,0,0, 1,0,0,0, 
            1,0,0,0, 1,0,0,0, 1,0,0,0, 
            1,0,0,0, 1,0,0,0, 1,0,0,0, 
        ].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15],[3,-3]),imp * hit);
        var sig = PinkNoise.ar(env**10);
        sig = sig * env;
        sig = BufDelayN.ar(h.bufnum,sig,LFSaw.ar(~tempo/2).range(0,1/~tempo/12));
        Splay.ar(sig,0.75,0.5);
    };
    ~hat.play;
);
~hat.stop(4);
~hat.clear;
~hat.pause;
~hat.resume;

(
    //s.latency=0.2;
    //p.clock.tempo_(120/60);
    p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
    ~tick.kr(1);
    ~tick.quant = 16;
    ~counter.quant = 16;
    ~counter = {PulseCount.kr(~tick.kr);};
    ~tick = { Impulse.kr( ~tempo * 4 ); };
);
