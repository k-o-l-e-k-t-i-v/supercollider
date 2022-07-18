


p.push();
~tempo={89/90}

// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.quant=24;
    ~one.fadeTime=4;
    ~one={
        var sig = SinOsc.ar(50!2,pi+Pulse.ar(~tempo*4/[1,2,3,4]));
        sig = sig + (Decay.ar(Dust.ar(~tempo*16)+Impulse.ar(~tempo*2/[1,2,3,4]),1/16)*WhiteNoise.ar(0.4!2));
        Splay.ar(sig,0.5,0.015);
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
