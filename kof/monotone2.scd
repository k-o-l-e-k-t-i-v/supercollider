
ExpRand.help

// monotone synth ///////////////////////////////////////

(
    ~monotone.ar(2);
    ~monotone.quant=2;
    ~monotone.fadeTime=4;
    ~monotone={
        /////////////////////////////////////////////
        var mod = Duty.kr(8/[1,2,3,4],0,Dseq([1,2,4,4/3,1/2,1/4],inf));
        var high = {TRand.ar(36,72,Impulse.ar(1/8/[1,2,3,4])).round(12).midicps*2/[1,1.3333,1.5,2]/mod};
        var l1 = DelayN.ar(high,1,1);
        var l2 = DelayN.ar(l1,1,1);
        var l3 = DelayN.ar(l2,1,1);
        var l4 = DelayN.ar(l3,1,1);
        ///////////////////////////////////////////
        var sig = SinOsc.ar(high,mul:0.25) * LFSaw.ar(1/2/[1,2,3,4]) * ToggleFF.ar(CoinGate.ar(0.5,Impulse.ar(4!2)));
        sig = sig + (SinOsc.ar(l1,mul:0.25) * LFSaw.ar(1/[1,2,3,4]) * ToggleFF.ar(CoinGate.ar(0.25,Impulse.ar(4!2))));
        sig = sig + (SinOsc.ar(l2/10,mul:0.25) * Pulse.ar(4/[1,2,3,4]) * ToggleFF.ar(CoinGate.ar(0.25,Impulse.ar(4!2))));
        sig = sig + (SinOsc.ar(l3/2,mul:0.05) * Pulse.ar(1/8/[1,2,3,4]) * ToggleFF.ar(CoinGate.ar(0.5,Impulse.ar(4!2))));
        sig = sig + (SinOsc.ar(l4/1.5,mul:0.05) * Pulse.ar(1/16/[1,2,3,4]) * ToggleFF.ar(CoinGate.ar(0.15,Impulse.ar(4!2))));
        sig = sig + (SinOsc.ar(1500/1.3333,mul:0.05) * Pulse.ar(1/4/[1,2,3,4]) * ToggleFF.ar(CoinGate.ar(0.15,Impulse.ar(4!2))));
        /////////////////////////////////////////////
        sig = AllpassN.ar(sig,1/4,1/2,1);
        sig = Limiter.ar(sig) + BrownNoise.ar(0.001!2);
        sig = CompanderD.ar(sig,3/4,1/2,1/2);
        sig = GVerb.ar(sig,100,4)/6+sig/1.5;
        ////////////////////////////////////////////////
        Splay.ar(sig,0.95,0.5,SinOsc.kr([4,3]));
    };
    ~monotone.play;
);
~monotone.stop(4);
~monotone.clear;
~monotone.pause;
~monotone.resume;
