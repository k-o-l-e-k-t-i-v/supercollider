


p.push();


// swipe synth ///////////////////////////////////////

(
~swipe.ar(2);
~swipe.quant=4;
~swipe.fadeTime=2;
~swipe={
    var sig = SinOsc.ar(LFSaw.ar(1/[1,2,3,4]).range(16,16000),phase:0,mul:Pulse.ar([4.001,4.002]/[1,2,3,4]));
    Splay.ar(sig,0.95,0.05);
};
~swipe.play;
);
~swipe.stop(4);
~swipe.clear;
~swipe.pause;
~swipe.resume;
