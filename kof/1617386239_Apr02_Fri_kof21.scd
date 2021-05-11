

p.push();
((1..12).nthPrime)
~tempo = {0.864};

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=0;
~one.fadeTime=1;
~one={
    var harm = 1+(1/(1..28).sputter(0.2,4)); //(1+(1/((2..25).nthPrime%(1..24).nthPrime)));
  var base = 432 * harm;
    var sig = SinOsc.ar(base,mul:0.2) * Decay.ar( Impulse.ar(4 / (1..4) * ~tempo),0.5 * (1..4).nthPrime );
    //sig = CombN.ar(sig,1/~tempo/4,1/~tempo/4,1);
  Splay.ar(sig,0.25,0.05);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

[1..20,0.2]
