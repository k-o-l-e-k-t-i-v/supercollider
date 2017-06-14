(
    p.push();
    p.bpm(120);
    s.latency = 0.7;
)

(
    //s.latency=0.2;
    //p.clock.tempo_(120/60);
    p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
    ~tick.kr(1);
    ~tick.clock = p.clock;
    ~tick.quant = 16;
    ~counter.clock = p.clock;
    ~counter.quant = 16;
    ~counter = {PulseCount.kr(~tick.kr);};
    ~tick = { Impulse.kr( ~tempo * 4 ); };
);


// kick synth ///////////////////////////////////////

(
    ~kick.ar(2);
    ~kick.clock = p.clock;
    ~kick.quant=[16,0];
    ~kick.fadeTime=0.02;
    ~kick={
        //  |       |       |       |       |  
        var pat = [
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3]),imp * hit);
        var sig = SinOsc.ar(55+(env**40*150),env**40*8pi);
        sig = sig * env;
        Splay.ar(sig,0.1,0.75);
    };
    ~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;


// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.clock = p.clock;
    ~one.quant=16;
    ~one.fadeTime=4;
    ~one={
        var note = Duty.ar(8/~tempo*[1,4,8,16,32,64],0,Dseq([60,65,60,67,65,55,67,69,55,60,58,60,61].midicps,inf));
        //var note = Duty.ar(8/~tempo*[1,2,3],0,Dseq([60,48,60,36,60,72,60,84].midicps,inf));
        var f = note / [1,2,1.5,1/2].scramble *.x [1,2,1/2,4] + SinOsc.kr((4..20),mul:0.5);
        var q = LFNoise2.kr(~tempo/16/(1..16)).exprange(0.0001,0.3);
        var sig = Crackle.ar(LFTri.ar(~tempo/((1..16)*10)).range(0.001,1.9));
        sig = LeakDC.ar(sig);
        sig = RLPF.ar(sig,f,q);
        sig = HPF.ar(sig,55);
        sig = HPF.ar(sig,55);
        sig = Normalizer.ar(sig) * LFTri.ar(~tempo/(1..16)) * LFTri.ar(f/10);
        sig = sig * Pulse.ar(~tempo*2/(1..16) + SinOsc.kr(~tempo/(8..28)).range(-0.001,0.001));
        sig = CombN.ar(sig,1/f,2/f,LFNoise2.kr(~tempo/16!16).exprange(2.001,4)/(1..16));
        sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
        sig = LPF.ar(sig,f*4);
        Splay.ar(sig,0.75,0.13335,SinOsc.kr((~tempo/((1..16)*0.51))));
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;




