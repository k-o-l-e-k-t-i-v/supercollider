


p.push();


~tempo={120/120}


(
    ~tick.kr(1);
    ~tick.clock = p.clock;
    ~tick.quant=0;
    ~tick = { Impulse.kr(~tempo * 4); };
    ~counter = {PulseCount.kr(~tick.kr);};
);




// unity synth ///////////////////////////////////////

(
~unity.ar(2);
~unity.quant=12;
~unity.fadeTime=4;
~unity={
    var mod = Duty.kr(4/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
    var a = Duty.kr(3/~tempo,0,Dseq([40,80,40,6000],inf));
    var b = Duty.kr(4/~tempo,0,Dseq([80,40,200,40],inf));
    var c = Duty.kr(2/~tempo,0,Dseq([40,4000,40,1200]/mod,inf));
    var base = [40,c,a,b];
    var sig = SinOsc.ar(~tempo/[1,2,3,4]+(1/~tempo)*(base*[1,2,3,4]),mul:1-LFSaw.kr(~tempo/[1,2,3,4]+(1/~tempo))/[1,2,3,4]);
    //sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
    sig = sig * Pulse.ar(~tempo*4/[1,2,3,4]);
    sig = CombN.ar(sig,1/~tempo,[1,2,3,4]/~tempo,1);
    sig = LeakDC.ar(sig);
    sig = GVerb.ar(sig,90)/14+sig;
    Splay.ar(sig,0.05,0.025);
};
~unity.play;
);
~unity.stop(50);
~unity.clear;
~unity.pause;
~unity.resume;



// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=12;
~kick.fadeTime=0.02;
~kick={
    //  |       |       |       |       |  
    var pat = [
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    ].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.05],[3,-3]),imp * hit);
    var sig = SinOsc.ar(40**(env**20*80),env**4*4pi);
    sig = sig * env;
    sig = LPF.ar(sig,500);
    Splay.ar(sig,0.05,0.15);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;


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
