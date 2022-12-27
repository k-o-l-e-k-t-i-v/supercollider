

p.push();



~tempo={110/60}


110/60


// titi synth ///////////////////////////////////////

(
~titi.ar(2);
~titi.quant=10;
~titi.fadeTime=0;
~titi={
    var phase = LFNoise1.kr(~tempo*4)/100;
    var env = Decay2.ar(Impulse.ar(~tempo*2/[1,2,3,4],phase),0.02,0.5);
    var sig = SinOsc.ar(35+(env**40*250),env**40*2pi);
    sig = sig * env;
    Splay.ar(sig,1,0.75);
};
~titi.play;
);
~titi.stop(4);
~titi.clear;
~titi.pause;
~titi.resume;


// hiss synth ///////////////////////////////////////

(
~hiss.ar(2);
~hiss.quant=10;
~hiss.fadeTime=0;
~hiss={
    var sig = WhiteNoise.ar(0.1!2);
    var phase = LFNoise1.kr(~tempo*4)/100+0.5pi;
    var env = Decay2.ar(Impulse.ar(~tempo*2/[1,2,3,4],phase),0.02,0.125);
    sig = sig * env;
     Splay.ar(sig,0.25,0.65);
};
~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;


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
