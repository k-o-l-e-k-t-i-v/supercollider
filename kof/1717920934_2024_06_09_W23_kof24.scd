

p.push();

// 20cm = 857.5hz
// 10cm = 1715 Hz

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
    var harm = 2**([1,5,8]/12)+1;
    var freq = 1715*harm;
    var sig = SinOsc.ar(freq!2);
    Splay.ar(sig,0.5,0.05);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
