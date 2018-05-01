

p.push();
p.bpm(143.5);





// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.clock = p.clock;
    ~one.quant=4;
    ~one.fadeTime=0.334;
    ~one={
        var hit = Pulse.ar(LFTri.ar(~tempo/[1,2,3,4]/64).exprange(~tempo/16,~tempo*4));
        var sig = SinOsc.ar(5000/(1..8).nthPrime,hit);
        sig = sig * hit;
        Splay.ar(sig,0.95,0.0365,SinOsc.ar(~tempo/[1,1.1332]));
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
