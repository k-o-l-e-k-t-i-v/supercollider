



// select synth ///////////////////////////////////////

(
~select.ar(2);
~select.quant=12;
~select.fadeTime=0;
~select={
    var sig = [
        SinOsc.ar(40!2),
        DC.ar(0),
        SinOsc.ar(16000!2,mul:0.1),
        WhiteNoise.ar(0.1!2)
    ];

    sig = Select.ar(LFSaw.ar(~tempo/4)*4,sig);
    //sig = GVerb.ar(sig)/16;//+sig;
    //sig = sig;
    Splay.ar(sig,0.05,0.25);
};
~select.play;
);
~select.stop(4);
~select.clear;
~select.pause;
~select.resume;
