


(
~boring.quant=2;
~boring.fadeTime=2;
~boring={
  var sig = WhiteNoise.ar(0.5!8) + LFSaw.ar(50*[1,1.5,1.25,2,4,8,16,32],mul:1/(1..8));
  sig = BBandPass.ar(sig,15000/(1..8)+1000,2) * LFSaw.ar(1/4/fib(8)).exprange(0.0001,1);
  sig = CombN.ar(sig,1,1,16);
  sig = Resonz.ar(sig,LFSaw.ar(4/fib(8)).exprange(50.0001,16000));
  sig = GVerb.ar(sig,(1..8)/8+10);
  Splay.ar(sig.flat,0.25,0.5);
};
~boring.play;
m.addMix(~boring,postVol:true);
);
~boring.stop(60);

History.end

