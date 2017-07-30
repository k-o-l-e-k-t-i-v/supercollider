

p.push();
p.bpm(240);

// jedna synth ///////////////////////////////////////

(
    ~jedna.ar(2);
    ~jedna.clock = p.clock;
    ~jedna.quant=2;
    ~jedna.fadeTime=4;
    ~jedna={
        var oct = TWChoose.kr(Impulse.kr(~tempo/64!3),[0,1,2,3] *.x [0,12],(8..1),1);
        var f = TWChoose.kr(Impulse.kr(~tempo/128!3),[60,64,67,65,71,61]-12+oct,[1,1,1,0.2,0.1,0.1],1).midicps * 4;

        var f1 = f *.x [1,1.5,2];
        var f2 = f1 / 4 + 0.01;
        var f3 = f2 + 0.02 * 8;

        var sig = 
        SelectX.ar(LFTri.ar(~tempo/32/[1,2,3]).range(0,f1.size()+1),Formant.ar(f1,f2,f3,mul:LFNoise2.kr(~tempo/16!3))) +.x
        SelectX.ar(LFTri.ar(~tempo/16/[1,2,3]).range(0,f1.size()+1),VarSaw.ar(f1,mul:LFNoise2.kr(~tempo/32!3))) *.x
        SelectX.ar(LFTri.ar(~tempo/12/[1,2,3]).range(0,f1.size()+1),SinOsc.ar(f1,f2/4,mul:LFNoise2.kr(~tempo/64!3))) / 4;
        sig = CombN.ar(sig,1/f1,8/f1,1);
        sig = LPF.ar(sig,1400);
        Splay.ar(sig,0.5,0.75);
    };
    ~jedna.play;
);
~jedna.stop(4);
~jedna.clear;
~jedna.pause;
~jedna.resume;
