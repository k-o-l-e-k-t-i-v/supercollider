



p.push();

~one.rebuild;

// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.quant=0;
    ~one.fadeTime=0.1;
    ~one={
        var vardar = SinOsc.ar(1/4/0.864).range(0.001,1);
        var oct = Duty.kr(vardar/32/~tempo,0,Dseq([1,10,100,1000],inf));
        var detune = SinOsc.ar([1,1.01]/0.864) * [0.001,0.002];
        var mod = SinOsc.ar(1574.074*oct+detune) * 2pi / 1000;
        var sig = SinOsc.ar(15.74074-(detune*pi),mod) * Pulse.ar([16,16.0001]);
        Splay.ar(sig,0.95,0.95);
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
