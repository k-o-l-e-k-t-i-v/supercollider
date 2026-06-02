
p.push();
p.bpm(72);


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
    var base = 432 / Duty.kr(4/~tempo,0,Dseq([1,2,1.5,1.33333],inf)).lag(1);
    var tones = 2**[4,7,11]/12 * base;
    var sig = SinOsc.ar(base) * Decay2.ar(Impulse.ar(~tempo*2/[1,2,3],0.04,1.0) );
    Splay.ar(sig,0.5,0.5);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
