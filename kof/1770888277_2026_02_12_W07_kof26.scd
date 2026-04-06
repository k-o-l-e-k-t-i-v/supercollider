p.push();

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
    var freq = [] +.x (Duty.kr(4/~tempo,0,Dseq([69,71,73,71],inf))).midicps +.x
    (Duty.kr(4/~tempo,0,Dseq([69,73,76],inf))).midicps +.x 
    (Duty.kr(4/~tempo,0,Dseq([76,74,73,74],inf))).midicps;
    var sig = [
        SinOsc.ar(freq,mul:0.2),
        WhiteNoise.ar(0.2),
        LFSaw.ar(freq,mul:0.2),
        LFPulse.ar(4,mul:0.2)
    ];
    var seek = LFSaw.ar(~tempo/4*[1,2,3,4])**2*4;
    sig = SelectX.ar(seek,sig);
    Splay.ar(sig,0.95,0.5);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
