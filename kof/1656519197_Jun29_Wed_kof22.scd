



p.push();
p.bpm(134)


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=8;
~one.fadeTime=4;

~one={
    var freq = Duty.kr([4,2]/~tempo,0,Dseq([1,2,1.5,1.33333],inf))   * [36,60].midicps * [4,2,1/8,1];
    var pattern = Duty.kr([1,2,3,4]/4/~tempo,0,Dseq([[1,2,3,4],[4,3,2,1],[4,8,16,32],[4,96,16,32]],inf)).lag(1/16);
    var sig = RLPF.ar(PinkNoise.ar(0.9!4),freq,LFTri.kr(pattern/2).exprange(0.001,1.8));
    sig = Compander.ar(sig,Pulse.ar(pattern).abs,1/2,1/2,1) * Pulse.ar(pattern);
  Splay.ar(sig,0.85,0.35);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
