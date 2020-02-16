
p.push();


// four synth ///////////////////////////////////////

(
    ~four.ar(2);
    ~four.quant=2;
    ~four.fadeTime=4;
    ~four={
        var f = 50 + SinOsc.kr(~tempo/[1,2,3,4],mul:2);
        var sig = [
            SinOsc.ar(f[0]),
            LFPulse.ar(f[1]),
            LFSaw.ar(f[2]),
            LFTri.ar(f[3])

        ];
        sig = sig[0] + sig[1] + sig[2] - sig[3];
        Splay.ar(sig,0.5,0.15);
    };
    ~four.play;
);
~four.stop(4);
~four.clear;
~four.pause;
~four.resume;
