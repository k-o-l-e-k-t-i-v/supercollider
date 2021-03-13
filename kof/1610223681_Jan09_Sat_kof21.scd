
p.push();

~tempo={128/120};

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=0;
~one.fadeTime=5;
~one={
    var sig = LFSaw.ar( SinOsc.ar(~tempo.kr/((1..99).nthPrime.sqrt)/24).range(5,500) );
    sig = LPF.ar(sig,500);
  Splay.ar(sig,0.05,0.15);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
