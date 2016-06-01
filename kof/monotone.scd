

// monotone synth ///////////////////////////////////////

(
    ~monotone.ar(2);
    ~monotone.quant=2;
    ~monotone.fadeTime=4;
    ~monotone={
        var high = {ExpRand(1500,15000,Impulse.ar(1/4)).round(500)};
        var sig = SinOsc.ar(high,mul:0.6) * Pulse.ar(8) * ToggleFF.ar(CoinGate.ar(0.5,Impulse.ar(4!2)));
        sig = sig + (SinOsc.ar(100,Pulse.ar(4)*2pi) * Pulse.ar(2) * ToggleFF.ar(CoinGate.ar(0.5,Impulse.ar(4!2))));
        sig = sig + (SinOsc.ar(50,Pulse.ar(4)*2pi) * Pulse.ar(4) * ToggleFF.ar(CoinGate.ar(0.5,Impulse.ar(4!2))));
        sig = sig + (SinOsc.ar(1500,mul:0.5) * Pulse.ar(8) * ToggleFF.ar(CoinGate.ar(0.5,Impulse.ar(4!2))));
        sig = sig + (SinOsc.ar(1500*2,mul:0.05) * Pulse.ar(1) * ToggleFF.ar(CoinGate.ar(0.15,Impulse.ar(4!2))));
        sig = sig + (SinOsc.ar(1500/1.5,mul:0.05) * Pulse.ar(1/4) * ToggleFF.ar(CoinGate.ar(0.15,Impulse.ar(4!2))));
        sig = AllpassN.ar(sig,1,1,4);
        sig = Limiter.ar(sig);
        sig = GVerb.ar(sig,60,4)/16+sig;
        Splay.ar(sig,0.95,0.5);
    };
    ~monotone.play;
);
~monotone.stop(4);
~monotone.clear;
~monotone.pause;
~monotone.resume;
