// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=4;
~one={
    var comb = [1,3,5,7]*4 + LFSaw.kr(4/[1,2,3,4]);
    var sig = SinOsc.ar(400*(1+(12/(13-comb).log2)));
  Splay.ar(sig,0.5,0.005);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
