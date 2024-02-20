

p.push();



// water synth ///////////////////////////////////////

(
~water.ar(2);
~water.quant=0;
~water.fadeTime=8;
~water={
    var harm = 2**((([1,12,-12,-24,5,8].scramble)/12)+1)/[4,1,8,1/2,1/4,16].scramble;
    var sig = SinOsc.ar(LFTri.ar([40.01001,4.0009221,8.0123,80.01].scramble).range(432,440) * harm);
    sig = LPF.ar(sig,1280);
    sig = LeakDC.ar(sig);
    Splay.ar(sig,0.995,0.035);
};
~water.play;
);
~water.stop(4);
~water.clear;
~water.pause;
~water.resume;

Tdef('rebuild',{loop {15.wait; ~water.rebuild;}}).play;

