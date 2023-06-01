
s.boot

p = ProxySpace.push(s)



// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=16;
~one.fadeTime=1;
~one={
    var detune = LFNoise1.kr(~tempo/(1..8))*10;
    var sig = SinOsc.ar([40,400,4000,8000]/(1+(1..8))+detune) * Pulse.ar(~tempo*4/[1,2,3,4]);
    sig = CompanderD.ar(sig,3/4,1,1/4);
    sig = GVerb.ar(sig,60,3)/4+sig;
    Splay.ar(sig,0.85,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear(4);
~one.pause;
~one.resume;


(
~tempo={110/120};
    ~tick.kr(1);
    //~tick.clock = p.clock;
    ~tick.quant=4;
    ~tick = { Impulse.kr(~tempo.kr * 4); };
    ~counter = {PulseCount.kr(~tick.kr);};
);	


// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=4;
~kick.fadeTime=0.02;
~kick={
    //  |       |       |       |       |  
    var pat = [
        1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
        1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
        1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
        1,0,0,0, 0,0,0,0, 1,0,0,0, 1,1,1,1,
    ].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.75],[3,-3]),imp * hit);
    var sig = SinOsc.ar(40 ** 10 * env);
    sig = sig * env;
    Splay.ar(sig,0.75,0.95);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;
