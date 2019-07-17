p.push
p.bpm(89)

// one synth ///////////////////////////////////////

(
~one.stop(0.1);
  
    ~one.quant=0;
    ~one.fadeTime=0;
    ~one={
        var f = 60/[1.5,1,1.333334].choose;
        var detune = SinOsc.kr(~tempo*8/[1,2,800].normalize);
        var sig = SinOsc.ar(f+detune,mul:[1,2,3].normalize) + (LFTri.ar(~tempo/16/[1,2,3],(1..16).normalize) ** LFNoise2.kr(~tempo/[1,2,3]/16).range(1/16,1));
        sig = sig * LFTri.ar(~tempo/[1,2,3]/16) + LFSaw.ar(~tempo/16,add:pi,mul:1/4);
        sig = Perlin3.ar(sig[0],sig[1],sig[2]);
        sig = LeakDC.ar(sig);
        Splay.ar(sig,0.5,0.25);
    };
    ~one.play;
);
~one.clear;
~one.pause;
~one.resume;
