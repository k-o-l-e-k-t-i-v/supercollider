p.push();

~tempo={120.00/60.0};


// lf synth ///////////////////////////////////////

(
~lf.ar(2);
~lf.quant=0;
~lf.fadeTime=1;
~lf={
    var sig = LFPulse.ar(~tempo/[1,2,3,4],(1..8).nthPrime.normalize*LFSaw.ar(~tempo/(1..8).normalize));
    sig = HPF.ar(sig,2000*[1,2,3,4]);
    Splay.ar(sig,0.05,0.95);
};
~lf.play;
);
~lf.stop(4);
~lf.clear;
~lf.pause;
~lf.resume;


