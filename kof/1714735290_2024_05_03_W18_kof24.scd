


p.push();



// centuner synth ///////////////////////////////////////

(
~centuner.ar(2);
~centuner.quant=4;
~centuner.fadeTime=2;
~centuner={
    var harm = 2**(([47.5,100.5,301,402,503]/1000)+1);
    var sig = SinOsc.ar(423 * harm);
    Splay.ar(sig,0.5,0.15);
};
~centuner.play;
);
~centuner.stop(4);
~centuner.clear;
~centuner.pause;
~centuner.resume;
