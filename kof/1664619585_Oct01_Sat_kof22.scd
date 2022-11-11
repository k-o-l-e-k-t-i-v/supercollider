

p.push();

// wiki synth ///////////////////////////////////////

TChoose

(
~wiki.ar(2);
~wiki.quant=2;
~wiki.fadeTime=0.02;
~wiki={
    var harm = [1024/729,256/243,128/81,32/27,16/9,4/3,1,3/2,9/8,27/16,81/64,243/128,729/512];
    var rhy = 8/[1,2,3,4];
    var base = Duty.kr(4/[1,2,3],0,Dseq([60,72,60,48],inf)).midicps;
    var harmonics =  TChoose.kr(Impulse.ar(rhy),harm); //(1+(1/(1..12)));
    //  |       |       |       |       |  
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.04,0.5],[3,-3]),Impulse.ar(rhy));
    var sig = SinOsc.ar(base/harmonics,2pi/(1..3),0.45/(1..3));
    sig = sig * env;
    Splay.ar(sig,0.95,1);
};
~wiki.play;
);
~wiki.stop(4);
~wiki.clear;
~wiki.pause;
~wiki.resume;
