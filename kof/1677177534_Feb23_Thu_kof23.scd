p.push()

~tempo = {60/110}

~tempo

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=8;
~one.fadeTime=0;
~one={
    var sig = SinOsc.ar([40,80,40*4/3,40*5/4],Pulse.ar(~tempo*4/[1,2,3,4])) * Pulse.ar(~tempo*4/1,2,3,4]);
    sig = CombC.ar(sig,2/~tempo,4/~tempo,~tempo);
    Splay.ar(sig,0.15,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
