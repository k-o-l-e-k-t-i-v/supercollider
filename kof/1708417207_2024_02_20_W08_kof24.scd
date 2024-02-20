

p.push();
~tempo={110/120};


// water synth ///////////////////////////////////////

(
~water.ar(2);
~water.quant=0;
~water.fadeTime=5.5;
~water={
    var harm = 2**((([1,10,-10,-20,1,2,3,4].scramble)/10)+1)/[4,1,8,1/2,1/4,16].scramble;
    var sig = SinOsc.ar(LFTri.ar([43.01001,4.3209221,44.0123].scramble).exprange(431.99,440.01) * harm);
    sig = LPF.ar(sig,[432/2,220]*1.5*harm);
    sig = CompanderD.ar(sig,3/4,1/2,1)/2+sig;
    sig = LeakDC.ar(sig);
    Splay.ar(sig,0.15,0.135);
};
~water.play;
);
~water.stop(4);
~water.clear;
~water.pause;
~water.resume;

Tdef('rebuild',{loop {(10.9).wait; ~water.rebuild;}}).play;


120/110

