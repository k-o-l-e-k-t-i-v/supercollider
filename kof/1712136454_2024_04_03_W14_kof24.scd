p.push



// bronze rezonator ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
    var f = 16650;
    var sig = SinOsc.ar(f);
    Splay.ar(sig,0.5,0.05);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
