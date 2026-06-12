s.boot();
p=ProxySpace.push();


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
  var sig = SinOsc.ar(50*([1,5,8]/12+1**2)) * LFSaw.ar(4/[1,2,3]);
  sig = CombN.ar(sig,1,1/4*[1,2,3],1);
  Splay.ar(sig,0.05,0.35);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
