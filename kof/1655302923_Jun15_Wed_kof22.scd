p.push();

~tempo_sun = {114.077/60}
~tempo_moon = {23.5166/60}
// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.quant=24;
    ~one.fadeTime=4;
    ~one={
        var sig = SinOsc.ar(440/[1,2,3,4,5]) * Decay.ar(Impulse.ar(~tempo_sun/(1..5)),1.0);
        sig = SinOsc.ar(880/[1,2,3,4]) * Decay.ar(Impulse.ar(~tempo_moon/(1..4)),1.0) + sig;
        Splay.ar(sig,0.85,0.25);
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
