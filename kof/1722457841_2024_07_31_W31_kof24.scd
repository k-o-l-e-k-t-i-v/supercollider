





p.push();



// 149.8


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
    var series = (1..64);
    var freq = series/series.size+1**0.5 * 1265.71; // 17.5cm
    var sig = SinOsc.ar(freq,mul:0.4) * Pulse.ar(4/series);
    Splay.ar(sig,1,0.05);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
