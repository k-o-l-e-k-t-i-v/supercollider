
p.push();
p.bpm(115);


(
    s.latency = 0.1913;
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
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        ];
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.13],[3,-3]),imp * hit);
        var sig = SinOsc.ar(33!2+(env**19.337*230),env**20*8pi);
        sig = sig * env;
        Splay.ar(sig,0.75,0.5);
    };
    ~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;


// hihat synth ///////////////////////////////////////

(
    ~hihat.ar(2);
    ~hihat.clock = p.clock;
    ~hihat.quant=[16,0];
    ~hihat.fadeTime=0.02;
    ~hihat={
        //  |       |       |       |       |  
        var pat = [
            1,0,0,0, 0,0,0,0, 1,0,1,0, 1,0,1,1,
            1,0,0,0, 0,0,0,0, 1,0,1,0, 0,1,1,1,
        ].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15],[3,-3]),imp * hit);
        var sig = WhiteNoise.ar(0.5!2 + (env**20*0.2));
        sig = sig * env;
        Splay.ar(sig,0.65,0.25);
    };
    ~hihat.play;
);
~hihat.stop(4);
~hihat.clear;
~hihat.pause;
~hihat.resume;
