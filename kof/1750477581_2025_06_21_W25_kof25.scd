p.push();

// sweep synth ///////////////////////////////////////

(
~sweep.ar(2);
~sweep.quant=4;
~sweep.fadeTime=2;
~sweep={
    var saw = LFSaw.ar(1/1560)**1.98;
    var amp =  1/(saw**2);
    var sig = SinOsc.ar(saw+4 * 19000);
    Splay.ar(sig,0,0.5);
};
~sweep.play;
);
~sweep.stop(4);
~sweep.clear;
~sweep.pause;
~sweep.resume;
