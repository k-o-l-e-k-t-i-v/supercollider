p.push();


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=0;
~one.fadeTime=0.4;
~one={
    var sig = SinOsc.ar(80!2);
    Splay.ar(sig,0.5,0.025);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
