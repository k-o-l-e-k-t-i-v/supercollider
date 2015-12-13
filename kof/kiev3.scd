

// osc synth ///////////////////////////////////////

(
~osc.ar(2);
~osc.quant=2;
~osc.fadeTime=2;
~osc={
    var sig = SinOsc.ar(16000/16*(1..16) + SinOsc.kr(800/fib(16)).range(-400,400),mul:0.1);
    sig = sig * LFPulse.ar(4/(1..16));
    Splay.ar(sig,0.5,~n1);
};
~osc.play;
);
~osc.stop(4);
~osc.clear;
~osc.pause;
~osc.resume;
