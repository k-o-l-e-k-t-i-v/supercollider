p.push();

p.tempo(89.45);

// lame synth ///////////////////////////////////////

(
~lame.ar(2);
~lame.quant=4;
~lame.fadeTime=2;
~lame={
    var ramp = LFSaw.ar(~tempo/48,mul:2pi);
    var noise = Perlin3.ar(ramp.cos,ramp.sin,ramp/2pi);
    var sig = SinOsc.ar(49.9+noise) * SinOsc.ar(50-noise) + SinOsc.ar(440*noise,mul:0.1) * Pulse.ar(2/~tempo);
    sig  = CombN.ar(sig,1/~tempo,1/~tempo,~tempo)/4+sig;
    sig = GVerb.ar(sig,3,90)/16 + sig;
    Splay.ar(sig,0.5,0.25);
};
~lame.play;
);
~lame.stop(4);
~lame.clear;
~lame.pause;
~lame.resume;
