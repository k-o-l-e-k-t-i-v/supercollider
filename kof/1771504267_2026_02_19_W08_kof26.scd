p.push();
p.bpm(85);

// beep synth ///////////////////////////////////////

(
~beep.ar(2);
~beep.quant=4;
~beep.fadeTime=2;
~beep={
    var sig = SinOsc.ar(440*(1/([1,5,8,12]/12+1**2))) * Pulse.ar(~tempo/[1,2,3,4]).softclip;
    Splay.ar(sig,0.95,0.5);
};
~beep.play;
);
~beep.stop(4);
~beep.clear;
~beep.pause;
~beep.resume;
