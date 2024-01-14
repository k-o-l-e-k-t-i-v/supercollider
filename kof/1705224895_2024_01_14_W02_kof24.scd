s.boot;
p.push();

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
    var t = LFSaw.ar(1/[1,2,4]*440)*1/2;
    var sig = LPF.ar( Fold.ar(t*(2**([1,5,8]/12)+1))  , 16000);
    sig = LeakDC.ar(sig);
    Splay.ar(sig,0.5,0.05);
};
~one.play;
);
s.scope;
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
