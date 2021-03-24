
p.push()
~tempo={121.35/60}

// harmonics synth ///////////////////////////////////////

(
~harmonics.ar(2);
~harmonics.quant=2;
~harmonics.fadeTime=4;
~harmonics={
    var mod = 1/8;
    var freq = (1+(1/(1..12))) * 440/mod + SinOsc.kr(~tempo/4/[1,2,3,4]);
    var sig = SinOsc.ar(freq,SinOsc.ar(freq/16)*2pi );
    Splay.ar(sig,0.05,0.025,LFTri.kr(~tempo/4),true);
};
~harmonics.play;
);
~harmonics.stop(4);
~harmonics.clear;
~harmonics.pause;
~harmonics.resume;
