


(
  p=ProxySpace.push(s.reboot);
  e=ProxySubmix.new(\filter);
);



// ring synth ///////////////////////////////////////

(
~ring.quant=1;
~ring.fadeTime=0.02;
~ring={
  var sig = LFSaw.ar([43.2,4300.1],mul:0.5);
  sig = sig + Decimator.ar(~ring.ar,44100,24*SinOsc.ar(1/4/fib(8)).exprange(0.00001,1));
  sig = RLPF.ar(sig,8000*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+90);
  sig = GVerb.ar(sig,40)/8+sig/3;
  Splay.ar(sig.flat.softclip,0.25,0.75);
};
~ring.play;
);
~ring.stop(7);
~ring.clear;
