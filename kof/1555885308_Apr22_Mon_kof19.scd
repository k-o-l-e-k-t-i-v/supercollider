

p.push();
// mimione synth ///////////////////////////////////////

~x={var sig = MouseX.kr(0.1,4);sig.poll;};
~x.poll;

(
~mimione.ar(2);
~mimione.quant=2;
~mimione.fadeTime=4;
~mimione={
    var f = [65,60,67].midicps/.x[1,2,4,1/2];
  var sig = SinOsc.ar(LFNoise1.kr(1/51!8).range(f*1.05,f*0.95));
  sig = Perlin3.ar(sig,LFTri.ar(~x.kr),LFTri.ar(1/16));
  Splay.ar(sig,0.5,0.25);
};
~mimione.play;
);
~mimione.stop(4);
~mimione.clear;
~mimione.pause;
~mimione.resume;



