

p=ProxySpace.push(s);


// formant synth ///////////////////////////////////////

(
~formant.ar(2);
~formant.quant=4;
~formant.fadeTime=2;
~formant={
  var base = 60.midicps;
  var sig = Formant.ar(base,base/2,base*2) * 0.2;
  Splay.ar(sig,0.5,0.25);
};
~formant.play;
);
~formant.stop(4);
~formant.clear;
~formant.pause;
~formant.resume;
