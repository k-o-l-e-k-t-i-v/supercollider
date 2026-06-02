


p.push();
p.bpm(72);

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=5;
~one={
    var note = Duty.kr([1,1/2,1/4]/~tempo,0,Dseq( [] ++ ([1,5,8] +.x [12,0,24,0,36,0] +.x [0,7,0,-4,0,1,-1,0]).pyramid,inf));
    var base = 2**(note / 12 + 1);
    var sig = SinOsc.ar(50*base,mul:0.5) * SinOsc.ar(49.97*base,mul:0.5);
    sig = sig.softclip;
    Splay.ar(sig,0.15,0.75);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
