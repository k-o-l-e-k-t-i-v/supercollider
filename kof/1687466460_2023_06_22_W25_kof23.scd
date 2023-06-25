


s.boot();


p=ProxySpace.push();
p=NetProxy.push();


// mel synth ///////////////////////////////////////

(
~mel.ar(2);
~mel.quant=4;
~mel.fadeTime=1;
~mel={
    var base = LFSaw.ar(4/[1,2,3]).range(1,(2**(([1,5,8]/12)))) * 432;
    var overtones = 2**(([1,3,[7,9,11]]/12));
    var x = LFSaw.ar(base*overtones/16).range(0,overtones*base);
    var y = LFSaw.ar(base*overtones/16).range(overtones*base,0);
    var sig = LFSaw.ar([x,y,overtones+0.01]).range(0,2pi);
    sig = Perlin3.ar(sig[0].sin,sig[1].cos,sig[2].sin) + SinOsc.ar(base*overtones);
    sig = LeakDC.ar(sig);
    Splay.ar(sig,0.5,0.15);
};
~mel.play;
);
~mel.stop(4);
~mel.clear;
~mel.pause;
~mel.resume;


(
    ~tick.kr(1);
    ~tick.clock = p.clock;
    ~tick.quant=24;
    ~tick = { Impulse.kr(~tempo * 4); };
    ~counter = {PulseCount.kr(~tick.kr);};
);		

// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=24;
~kick.fadeTime=0.02;
~kick={
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
    var sig = SinOsc.ar(50!2,env**20*8pi);
    sig = sig * env;
    Splay.ar(sig,0.75,0.5);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;
