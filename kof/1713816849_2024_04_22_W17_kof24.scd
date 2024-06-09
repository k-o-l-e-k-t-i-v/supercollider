

p.push();

~tempo = {110/120};
~freq = {7490};

// oscillator synth ///////////////////////////////////////

(
~oscillator.ar(2);
~oscillator.quant=4;
~oscillator.fadeTime=2;
~oscillator={
    var harm= (2**(([1,5,8]/12)++1));
    var sig = SinOsc.ar(~freq/10*harm,mul:LFSaw.kr(~tempo*2/[1,2,3,4])**0.85 );
    Splay.ar(sig,0.5,0.25);
};
~oscillator.play;
);
~oscillator.stop(4);
~oscillator.clear;
~oscillator.pause;
~oscillator.resume;
