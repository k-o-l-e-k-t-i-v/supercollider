RecordBuf.help
i

(
    p=ProxySpace.push(s.reboot);
    p.makeTempoClock;
);

b = Buffer.alloc(s, 44100 * 4.0, 1);


// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.quant=2;
    ~one.fadeTime=0.1;
    ~one={
        var t = LFSaw.ar([1/4,1/2,50]) * 1/4;
        var sig = RLPF.ar(Perlin3.ar(t[0],t[1],t[2]),LFNoise1.ar(1/4).range(500,15000)) + LocalIn.ar(1);
        sig = Normalizer.ar(sig);
        DelayN.ar(sig,1/50,1/50);
        sig = LPF.ar(sig,15000);
        LocalOut.ar(sig/1.001);
        RecordBuf.ar(sig,0,1,0.9,loop:1);
        sig = PlayBuf.ar(1,0,LFTri.ar(1/4).exprange(0.02,10),loop:1);
        //sig = sig;

        Splay.ar(sig,0.5,0.95);
    };
    ~one.play;
    ~one[10] = \filter -> {|sig| DWGReverb.ar(LPF.ar(HPF.ar(sig,300),5500),[4000,4100])};
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


PlayBuf.help
