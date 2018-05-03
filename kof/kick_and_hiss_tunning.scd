
p.push();
p.bpm(45);


(
    s.latency = 0.486;
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
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.002,4.13] * LFSaw.ar(~tempo/[1,2,3,4],add:0.25).lag(0.013),[3,-3]),imp * hit)};
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
            1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,1,
            1,0,1,0, 1,0,1,0, 1,0,1,0, 0,1,1,1,
        ].rotate(3);

        var alpha = LFSaw.ar(~tempo/[1,2,3,4]/16,add:1.013);
        var beta = LFTri.ar(~tempo/[1,2,3,4]/32,add:1.013);
        
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.0013,0.12513],[3,-3]),imp * hit);
        var sig = WhiteNoise.ar(env**alpha) + GrayNoise.ar(0.97!4 + (env**beta*0.4));
        sig = HPF.ar(sig,13000*LFSaw.ar(~tempo/[1,2,3,4])+1000);
        sig = sig * env;
        Splay.ar(sig,0.65,0.75);
    };
    ~hihat.play;
);
~hihat.stop(4);
~hihat.clear;
~hihat.pause;
~hihat.resume;
