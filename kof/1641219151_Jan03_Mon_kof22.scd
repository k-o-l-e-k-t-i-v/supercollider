p.push();
p.bpm(120)

// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.quant=8;
    ~one.fadeTime=0.4;
    ~one={
        var ran = LFSaw.ar(~tempo*4,mul:0.2);
        var sig = LFSaw.ar(~tempo/24/[1,2,1.5,24,48,64]) * 2pi;
        var freq = Perlin3.ar(sig[0].cos+1*ran,sig[1].sin+1*ran,sig.sin+1*ran);
        var oo = SinOsc.ar(freq*5500+55) * Pulse.ar(~tempo*1.5/[1,2,3,4],LFSaw.ar(~tempo/24/[1,2,3,4]));
        oo = CombL.ar(oo,4/~tempo,24/~tempo,4*~tempo);
        Splay.ar(oo,0.95,0.25);
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
