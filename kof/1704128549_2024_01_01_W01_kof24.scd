

p.push();

~tempo = {110/120};

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=3;
~one={
    var sig = SinOsc.ar(40!2,Pulse.ar(~tempo*[4,3]/[1,2,3,4]));
    Splay.ar(sig,0.5,0.05);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
