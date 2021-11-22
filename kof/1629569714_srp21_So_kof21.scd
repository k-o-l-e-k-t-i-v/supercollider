


p.push();



// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=8;
~one.fadeTime=10;
~one={
    var mod= Duty.kr(24/[4,2,1/4]/~tempo,0,Dseq([1,2,1.5,1.33333],inf)).lag(1/15);
    var let = LFSaw.ar( [[1.01,1.001,1.0005],50,150.01*mod/[1,1.5,1.25,4/3,1/4]])+LFSaw.ar(1/60)*2pi;
    var phase = Perlin3.ar(let[0].sin,let[1].cos,let[2].sin);
    var sig = SinOsc.ar(1/[1,2,3,4,5,6,7],phase);
    Splay.ar(sig,0.95,0.05);
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

// left synth ///////////////////////////////////////

(
~left.ar(2);
~left.quant=[16,0];
~left.fadeTime=0.02;
~left={
    //  |       |       |       |       |  
    var pat = [
        1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
        1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
        1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
        1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    ].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3]),imp * hit);
    var sig = SinOsc.ar(30!2);
    sig = sig * env;
    Splay.ar(sig,0.75,0.5);
};
~left.play;
);
~left.stop(4);
~left.clear;
~left.pause;
~left.resume;
