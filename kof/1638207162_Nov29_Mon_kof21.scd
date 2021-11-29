

p.push();

  ~tempo = {121.25/120};

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=24;
~one.fadeTime=0.4;
~one={
    var sig = SinOsc.ar(35*[1,1/4,1/8,32/16],Pulse.ar(~tempo*[1,4,8,1/4])) * Pulse.ar(~tempo*4/[1,2,3,4]);
    var curve = LFNoise1.kr(~tempo/2400/[1,2,3,4])+1.001;
    //sig = sig * Pulse.ar(~tempo*4);
    sig = [
        CombN.ar(sig,~tempo/4,~tempo/[3,4,45.01],1/4),
         HPF.ar(sig,4000),
        CombL.ar(sig,~tempo/2,~tempo/[3,4,450.01],1),
         HPF.ar(sig,40),
        CombC.ar(sig,~tempo/1,~tempo/[3,4,45.01],4),
         HPF.ar(sig,1400),
        SinOsc.ar(440/2,mul:0.2),
         HPF.ar(sig,2400),
        LPF.ar(sig,500),
         HPF.ar(sig,3400),
        SinOsc.ar(440/1.5,mul:0.4),
         HPF.ar(sig,1400),
        HPF.ar(sig,5000),
         HPF.ar(sig,5400),
        SinOsc.ar(440*[1,2,1.5,1.25],mul:0.5),
        WhiteNoise.ar(0.2!2),
        LFSaw.ar(35,mul:0.2),
        BrownNoise.ar(0.5!4)
    ];

    sig = SelectX.ar(LFSaw.ar(~tempo*1/24/[1,2,3,4])**curve*(sig.size+1),sig);
    sig = LeakDC.ar(sig);
    sig = CompanderD.ar(sig,sig,3/4,1,0.1);
    Splay.ar(sig,0.35,0.45);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


(
    ~tick.kr(1);
    ~tick.clock = p.clock;
    ~tick.quant=1;
    ~tick = { Impulse.kr(~tempo * 4); };
    ~counter = {PulseCount.kr(~tick.kr);};
);		


// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=[24,0];
~kick.fadeTime=0.02;
~kick={
    //  |       |       |       |       |  
    var pat = [
        1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
        1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
        1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
        1,0,0,0, 0,0,0,0, 1,0,0,0, 1,1,1,1,
    ].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3]),imp * hit);
    var sig = SinOsc.ar(35!2+(env**20*200),env**20*2pi) * Pulse.ar(~tempo*8);
    sig = sig * env;
    Splay.ar(sig,0.95,0.95);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;
