

p.push();
~tempo={121.35/60};
// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=4;
~one={
    var mod = 2;
    var harm = (1+(1/(1..12)));
    var base = 432*mod/[1,2,4,8] + SinOsc.kr(~tempo*4/harm);
    var sig = SinOsc.ar(harm *.x base,mul: 1/(1+(harm).normalize)) * (LFTri.kr(~tempo*2/harm )**1.7);
    Splay.ar(sig,0.05,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
