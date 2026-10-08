p.push();


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(150*(2**([1,2,3,4]/12)+1),SinOsc.ar(4.2))*LFSaw.ar([4,2,1,3]);
  Splay.ar(sig,0.5,0.15);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
