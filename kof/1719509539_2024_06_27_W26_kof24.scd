

p.push();


// divisor synth ///////////////////////////////////////

(
~divisor.ar(2);
~divisor.quant=4;
~divisor.fadeTime=2;
~divisor={
    var base = 2520;
    var notes = [-1,2,4,8,10];
    var scale = Duty.kr(36/[1,2,3]/~tempo,0,Dseq((2**(notes/12)+1),inf));
    var harm = 2520/(1..9)*scale;
    var sig = SinOsc.ar(harm,0,LFTri.kr(1/36/(1..9)));
    Splay.ar(sig,0.5,0.25);
};
~divisor.play;
);
~divisor.stop(4);
~divisor.clear;
~divisor.pause;
~divisor.resume;
