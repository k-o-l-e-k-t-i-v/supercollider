p.push();
p.bpm(110)

// zero synth ///////////////////////////////////////

(
~zero.ar(2);
~zero.quant=4;
~zero.fadeTime=2;
~zero={
    var tem = 2**(([1,5,8,0]/12)+1);
    var cps = 80*[4,2,1] + LFSaw.ar(~tempo * ([1,-1]));
    var sig = SinOsc.ar(tem+cps,LFSaw.ar(tem).exprange(0.001,2pi));
    Splay.ar(sig,6/7,0.05);
};
~zero.play;
);
~zero.stop(4);
~zero.clear;
~zero.pause;
~zero.resume;

s.scope
