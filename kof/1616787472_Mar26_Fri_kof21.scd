

~tempo = {121.34/120};

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=4;
~one={
    var base = 432*4 / [2,8] / Duty.kr([3,24,4]/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
    var sig = SinOsc.ar( base*((1+(1/((1..5).scramble)))) + SinOsc.kr(~tempo*4,mul:2) , mul:1/(1..5)) * (Decay2.ar(Impulse.ar(~tempo*4/[1,2,3,4] + SinOsc.kr(~tempo*2/(1..5).nthPrime,mul:0.0001)),0.002,0.6*[1,4,8])**1.5);
    sig = Vibrato.ar(sig,[3,4,5,6]);
    sig = CombN.ar(sig,4/~tempo,2/~tempo,4);
  Splay.ar(sig,0.5,0.05);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
