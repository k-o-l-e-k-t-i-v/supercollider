p.push();


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
    var harm = 2**((1..24)/24+1);
    var sig = SinOsc.ar(440*harm,mul:0.2);
    Splay.ar(sig,0.5,0.7);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
