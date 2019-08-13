p.push


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=15;
~one={
    var mod = Duty.kr([16,15]/~tempo,0,Dseq([1,2,1.5,1.33333],inf)).lag(3);
  var sig = SinOsc.ar(29.97/[4,1/2.001,1/[3.00001,3]])+LFSaw.ar(1/600);
  sig = Perlin3.ar(sig[0],sig[1],sig[2]);
  sig = SinOsc.ar(sig.range(50,1500),sig*2pi);
  sig = Resonz.ar(sig,[150,125]/mod,0.12)*5;
  Splay.ar(sig,0.95,0.5);
};
~one.play;
);
~one.stop(60);
~one.clear;
~one.pause;
~one.resume;
