

p.push();

// 2820.25 / 20
~tempo = {141.013/120};

// Earth dia
// c / 6378 km ➞ 47.0041Hz

// earth synth ///////////////////////////////////////

(
~earth.ar(2);
~earth.quant=4;
~earth.fadeTime=2;
~earth={
    var sig = SinOsc.ar(47.0041*[1,2,4,8]) * SinOsc.kr(47.0041/10/[1,2,3,4],add:1,mul:0.5);
    Splay.ar(sig,0.5,0.25);
};
~earth.play;
);
~earth.stop(4);
~earth.clear;
~earth.pause;
~earth.resume;
