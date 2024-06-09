p.push();

~eye = {6.32474 * 100.0} // GHz


// eyewob synth ///////////////////////////////////////

(
~eyewob.ar(2);
~eyewob.quant=0;
~eyewob.fadeTime=2;
~eyewob={
    var sig = SinOsc.ar(~eye);
    Splay.ar(sig,0.5,0.15);
};
~eyewob.play;
);
~eyewob.stop(4);
~eyewob.clear;
~eyewob.pause;
~eyewob.resume;

