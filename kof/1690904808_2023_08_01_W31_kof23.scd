

p.push();

~tempo = {110/120}

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=0.2;
~one={
    var pat  = Duty.kr(4/~tempo,0,Dseq(4/[[1,2,3],[1,2]],inf)) + LFNoise1.kr(~tempo*4!3).range(0.001,0.002);
    var freq = 50 * (2**(([1,5,8]/12)+1)) ;
    var pulse = CombN.ar(Pulse.ar(~tempo*pat), 1/4/~tempo , 1/4/~tempo , 3);
    var sig = SinOsc.ar(freq, pulse.softclip*2pi) * pulse;
    sig = LeakDC.ar(sig);
    Splay.ar(sig,0.25,0.025);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
