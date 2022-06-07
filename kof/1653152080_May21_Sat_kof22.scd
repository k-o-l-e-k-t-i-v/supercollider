


p.push();

~tempo={121.35/120}

// oneone synth ///////////////////////////////////////

(
~oneone.ar(2);
~oneone.quant=8;
~oneone.fadeTime=4;
~oneone={
    var mod = 1/Duty.kr(4/~tempo,0,Dseq([1,2,1.5,1.33333],inf)).lag(1/4);
    var sig = OnePole.ar(LFSaw.ar([50,60]*4*(1+(1/(1..12)))),SinOsc.ar(~tempo*4/(1+(1/(1..12)))));
    sig = Perlin3.ar(LFSaw.ar(~tempo/24).cos+1/2,LFSaw.ar(~tempo/48).sin+1/2,sig+LFSaw.ar(~tempo/240/(1..12))*16/8+1);
    sig = LeakDC.ar(sig);
    sig= Resonz.ar(sig,440*mod*(1+(1/(1..12))),0.1);

  Splay.ar(sig,0.95,0.95);
};
~oneone.play;
);
~oneone.stop(4);
~oneone.clear;
~oneone.pause;
~oneone.resume;
