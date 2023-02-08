
p.push();



// twohun synth ///////////////////////////////////////

(
~twohun.ar(2);
~twohun.quant=4;
~twohun.fadeTime=0.4;
~twohun={
    var sig = LFPulse.ar([40,50]);
    sig/8;
};
~twohun.play;
);
~twohun.stop(4);
~twohun.clear;
~twohun.pause;
~twohun.resume;
