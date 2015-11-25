


// seven synth ///////////////////////////////////////

(
    ~seven.ar(2);
    ~seven.quant=2;
    ~seven.fadeTime=0.2;
    ~seven={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)/[4,4,3,2]%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.00001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = [
            SinOsc.ar(50+(env**50*500)),
            SinOsc.ar(1500!2),
            LFSaw.ar(5000!2),
            SinOsc.ar(50!2),
        ];
        sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
        sig = sig * env;
        Splay.ar(sig,0.75,~n7);
    };
    ~seven.play;
);
~seven.stop(4);
~seven.clear;
~seven.pause;
~seven.resume;
