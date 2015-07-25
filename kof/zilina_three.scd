



// pulse synth ///////////////////////////////////////

(
    ~pulse.quant=4;
    ~pulse.fadeTime=0.02;
    ~pulse={
        var env = Pulse.ar(2/4/fib(8));
        var sig = SinOsc.ar(70!2 + (env*10));
        sig =  GVerb.ar(sig,100,3,0.02,0.02,90);
        sig = sig * env;
        Splay.ar(sig,0.0,0.10125);
    };
    e.addMix(~pulse,postVol:true);
    ~pulse.play;
);
~pulse.stop(30);
~pulse.clear;
