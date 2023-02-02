

p.push();



~tempo = {110/60}


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


// tritone synth ///////////////////////////////////////

(
~tritone.ar(2);
~tritone.quant=24;
~tritone.fadeTime=0.4;
~tritone={
    var mod = Duty.kr([1,2,3,4]/~tempo,0,Dseq([1,4,2,8],inf));
    var long = Duty.kr([4,3,2,1]/~tempo,0,Dseq([1,2,1.5,1.33333],inf)) * mod;
    var mmod = [1,24,8,1];
    var over = Duty.kr([2,4]/~tempo,0,Dseq([1,2,1.5,1.33333,1/2,1,1/4,1/8],inf));
    var mel = Duty.kr(mmod/[1,2,3,4]/~tempo,0,Dseq([1,1.2,1,1.5] /.x [long,over] *.x [over,long],inf));
    var sig = [] ++ SinOsc.ar(1200*[1/mel+1,mel]*mmod) ++ SinOsc.ar(1200*[mel,1/mel+1]) ++ SinOsc.ar(1200*[1/mel+1,mel]) ++ SinOsc.ar(1200*[mel,1/mel+1]);
    sig = RLPF.ar(sig,LFNoise1.kr(~tempo/[1,2,3,4]).range(2000,12000));
    sig = sig * Decay.ar(Impulse.ar(~tempo*4/[[] ++ [1,2,3,4].nthPrime++[1,2,3,4]]),0.25*[1,2,3,4]);
    sig = CombL.ar(sig,1/~tempo,1/[1,2,3,4]/~tempo,~tempo*1)/8+sig;
    sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
    Splay.ar(sig,0.75,0.015);
};
~tritone.play;
);
~tritone.stop(4);
~tritone.clear;
~tritone.pause;
~tritone.resume;


1200/[40,50,60]

[15,12,10]/10



// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=4;
~kick.fadeTime=0.02;
~kick={
    //  |       |       |       |       |  
    var pat = [
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1,
    ].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3]),imp * hit);
    var sig = SinOsc.ar([40,50,60]**(env*200)*(1200),env**20*8pi);
    sig = sig * env;
    Splay.ar(sig,1.0,0.25);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;


// hiss synth ///////////////////////////////////////

(
~hiss.ar(2);
~hiss.quant=24;
~hiss.fadeTime=0.02;
~hiss={
    //  |       |       |       |       |  
    var pat = [
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    ].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.002,[0.15,1.5,0.025]],[3,-3]),imp * hit)};
    var sig = WhiteNoise.ar(0.75!2);
    sig = HPF.ar(sig,5000);
    sig = sig * env;
    sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
    Splay.ar(sig,0.75,0.25);
};
~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;

(
    ~tick.kr(1);
    ~tick.clock = p.clock;
    ~tick.quant=8;
    ~tick = { Impulse.kr(~tempo * 4); };
    ~counter = {PulseCount.kr(~tick.kr);};
);
