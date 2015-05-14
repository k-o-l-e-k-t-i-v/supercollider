

p=ProxySpace.push(s.reboot);

(
    ~morph={
        var fd = LFSaw.ar(1/8/[8,17,33,65,71]);
        var sig = LFSaw.ar(4320/fd.range(1,43.2)) + SinOsc.ar(43.2!2,mul:0.5);
        sig = PitchShift.ar(sig,0.15*(1..8),fd.exprange(1.0001,4));
        sig = BPF.ar(sig,LFTri.ar(1/12/(1..8)).exprange(11.1,10200),SinOsc.ar(1/4/[2,4,8]).range(0.1,2));
        sig = GVerb.ar(sig,LFTri.ar(1/8/[1,2,4,8]).range(2,100)) + LPF.ar(sig,150,2);
        sig = CompanderD.ar(sig,1/75,1/[1,2,3,4],1/2);

        sig = Splay.ar(sig.flat,0.75);
    };
    ~morph.play;
)
