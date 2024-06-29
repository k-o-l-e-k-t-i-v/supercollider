
p.push();

// swipe synth ///////////////////////////////////////

~tempo={110/60}

(
~swipe.ar(2);
~swipe.quant=4;
~swipe.fadeTime=2;
~swipe={
    var harm = [1,5,8]/12+1**2;
    var sig = SinOsc.ar(LFSaw.ar(LFSaw.kr(8/~tempo)*[50,60]).exprange(1.0001,16000));
    Splay.ar(sig,1,0.25);
};
~swipe.play;
);
~swipe.stop(4);
~swipe.clear;
~swipe.pause;
~swipe.resume;
