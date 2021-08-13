
s.boot
p.push();




// dry synth ///////////////////////////////////////

(
~dry.ar(2);
~dry.quant=24;
~dry.fadeTime=4;
~dry={
    var sig = Pulse.ar(4/(1..12).nthPrime);
    Splay.ar(sig,0.5,0.25);
};
~dry.play;
);
~dry.stop(4);
~dry.clear;
~dry.pause;
~dry.resume;

// white synth ///////////////////////////////////////

(
~white.ar(2);
~white.quant=1;
~white.fadeTime=4;
~white={
    var sig = WhiteNoise.ar(0.05)*Pulse.ar(4/(1..12).nthPrime);
    Splay.ar(sig,0.5,0.25);
};
~white.play;
);
~white.stop(4);
~white.clear;
~white.pause;
~white.resume;

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=24;
~one.fadeTime=4;
~one={
    var mod = Duty.kr(24/[1,2,3,4]/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
    var sig =
    LFSaw.ar([75/mod+SinOsc.ar(4/[1,2,3]),75*mod,1/24])*2pi+LFSaw.ar(1/24,mul:4);
    sig = Perlin3.ar(sig[0].cos,sig[1].sin,sig[2].cos);
    sig = CombC.ar(sig,1/24/[1,2,3,4],1/8/[1,2,3,4],1/4);
    
    //sig = sig * Pulse.ar(8/[1,2,3,4]) + (sig/2);
    sig=  sig * Decay.ar(Impulse.ar(8/[1,2,3,4,5],0.1));
    sig = LPF.ar(sig,[50,1500,15000])+HPF.ar(sig,14000);
    Splay.ar(sig,0.95,0.2525);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
)


// sw synth ///////////////////////////////////////

(
~sw.ar(2);
~sw.quant=8;
~sw.fadeTime=0.2;
~sw={
    var mod = Duty.kr(24,0,Dseq([1,2,1.5,1.33333],inf));
     //         |       |       |       |       |  
    var pat = [1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr % pat.size);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var sig = [
    SinOsc.ar(50!2)+1*pi,
    WhiteNoise.ar(0.1!2),
    LFSaw.ar([75*mod+SinOsc.ar(4/[1,2,3]),75*mod,1/24])*2pi+LFSaw.ar(1/24,mul:4),
    PinkNoise.ar(0.1!2),
    ];
    
    sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig)*2pi;
    sig = Perlin3.ar(sig.cos,sig.sin,sig.sin);
    Splay.ar(sig,0.95,0.05);
};
~sw.play;
);
~sw.stop(4);
~sw.clear;
~sw.pause;
~sw.resume;

// two synth ///////////////////////////////////////

(
~two.ar(2);
~two.quant=2;
~two.fadeTime=4;
~two={
    var sig = LFSaw.ar([50,50.01,1/24],add:1,mul:2pi) *
    Pulse.ar(4/(1..12).nthPrime);
    sig = Perlin3.ar(sig[0].cos,sig[1].sin,sig[2].sin);              
    Splay.ar(sig,0.5,0.25);
};
~two.play;
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;


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
~kick.quant=[16,0];
~kick.fadeTime=0.02;
~kick={
    //  |       |       |       |       |  
    var pat = [
        1,0,0,0, 1,0,0,0, 1,0,1,0, 1,0,1,0,
        1,0,0,0, 1,0,1,0, 1,0,0,0, 1,0,1,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,1,0,
        1,0,0,0, 1,0,1,0, 1,0,0,0, 1,1,1,1,
    ].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3]),imp * hit);
    var sig = SinOsc.ar(40!2+(env**40*200),env**20*2pi);
    sig = sig * env;
    Splay.ar(sig,0.05,0.95);
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
~one.quant=2;
~one.fadeTime=4;
~one={
    var sig = LFSaw.ar(1/[1/50,1/750,4,1/4])*2pi;
    sig = Perlin3.ar(sig[0],sig[1],sig[2]);
    sig = LPF.ar(sig,15000);
    sig = CompanderD.ar(sig,~kick.ar,1/4,1,1);
    Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
