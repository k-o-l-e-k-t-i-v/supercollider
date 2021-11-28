

p.push();

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=4;
~one={
    var sig = SinOsc.ar(50!2);
    Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


p.bpm(123.35/120*2)

(
    ~tick.kr(1);
    ~tick.clock = p.clock;
    ~tick.quant=1;
    ~tick = { Impulse.kr(~tempo * 4); };
    ~counter = {PulseCount.kr(~tick.kr);};
);	


// oneone synth ///////////////////////////////////////

(
~oneone.ar(2);
~oneone.quant=[24,0];
~oneone.fadeTime=0.02;
~oneone={
    //  |       |       |       |       |  
    var pat = [
        1,0,0,0, 0,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 0,0,0,0, 1,0,0,0, 1,0,1,0,
        1,0,0,0, 0,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 0,0,0,0, 1,0,0,0, 1,0,1,0,
    ].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5/[1,2,3,4]],[3,-3]),imp * hit)};
    var sig = SinOsc.ar(45!2+(env**10*100),SinOsc.ar(45/2*10)*2pi) + Pulse.ar(90);
    sig = sig * env;
    Splay.ar(sig,0.95,0.25);
};
~oneone.play;
);
~oneone.stop(4);
~oneone.clear;
~oneone.pause;
~oneone.resume;
