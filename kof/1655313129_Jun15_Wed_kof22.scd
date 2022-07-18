s.boot;
p.push();



~tempo={102.863/120};

239.944/120

// cosmic synth ///////////////////////////////////////

(
    ~cosmic.ar(2);
    ~cosmic.quant=8;
    ~cosmic.fadeTime=4;
    ~cosmic={
        var puls = Pulse.ar(~tempo*2/[1,2,3,4,5]);
        var sig = SinOsc.ar(50!2,puls) * puls;
        Splay.ar(sig,0.95,0.15);
    };
    ~cosmic.play;
);
~cosmic.stop(4);
~cosmic.clear;
~cosmic.pause;
~cosmic.resume;
