

p.push();



// luck synth ///////////////////////////////////////

(
~luck.ar(2);
~luck.quant=4;
~luck.fadeTime=2;
~luck={
    var base = 220*(2**(LFSaw.kr(11).range(1,12).round(1)/12));
    var one = Duty.kr(1/4/~tempo,0,Dseq([1,5],inf));
    var two = Duty.kr(1/~tempo,0,Dseq([1,5,8],inf));
    var thr = Duty.kr(4/~tempo,0,Dseq([1,5,8,12],inf));
    var harm = 2**([one,two,thr]/12);
    var sig = SinOsc.ar(base * harm, mul:1/harm);
    Splay.ar(sig,0.5,0.25);
};
~luck.play;
);
~luck.stop(4);
~luck.clear;
~luck.pause;
~luck.resume;
