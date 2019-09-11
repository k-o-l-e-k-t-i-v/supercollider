

p.push();

p.bpm(88)

// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.quant=2;
    ~one.fadeTime=4;
    ~one={
        var sig = SinOsc.ar([50,5000.001/[1,2,1.5,4,8,16]],Pulse.ar(~tempo/[1,2,3])) * Pulse.ar(~tempo*4/[1,2,3,4,5]);
        sig = (CombL.ar(sig,1/50,1/50,1)*LFPulse.ar(~tempo/1/[1,2,3,4])) + (sig * LFPulse.ar(~tempo/4/[1,2,3,4]));
        sig = LeakDC.ar(sig);
        sig = GVerb.ar(sig/2,LFTri.kr(~tempo/8).range(40,80));
        Splay.ar(sig,0.95,0.05);
    };
    ~one[10]->{|in| BPF.ar(in,1500,0.02);};
    ~one[12]->{|in| CombL.ar(in,1/50,1/50,1/~tempo);};
    ~one[14]->{|in| in * LFTri.ar(~tempo/4/[1,2]);};
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
