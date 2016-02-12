// History, as it was on Tue Jun  2 21:37:06 2015.

[
[ 0, 'me', "(
~boring.quant=2;
~boring.fadeTime=2;
~boring={
  var sig = WhiteNoise.ar(0.1!8);
  sig = BBandPass.ar(sig,15000/(1..8)+1000,2) * LFSaw.ar(1/4/fib(8)).exprange(0.0001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~boring.play;
m.addMix(~boring,postVol:true);
);" ],
[ 13.181428354, 'me', "(
~boring.quant=2;
~boring.fadeTime=2;
~boring={
  var sig = WhiteNoise.ar(0.2!8);
  sig = BBandPass.ar(sig,15000/(1..8)+1000,2) * LFSaw.ar(1/4/fib(8)).exprange(0.0001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~boring.play;
m.addMix(~boring,postVol:true);
);" ],
[ 15.780754036, 'me', "(
~boring.quant=2;
~boring.fadeTime=2;
~boring={
  var sig = WhiteNoise.ar(0.5!8);
  sig = BBandPass.ar(sig,15000/(1..8)+1000,2) * LFSaw.ar(1/4/fib(8)).exprange(0.0001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~boring.play;
m.addMix(~boring,postVol:true);
);" ],
[ 41.459302641, 'me', "(
~boring.quant=2;
~boring.fadeTime=2;
~boring={
  var sig = WhiteNoise.ar(0.5!8);
  sig = BBandPass.ar(sig,15000/(1..8)+1000,2) * LFSaw.ar(1/4/fib(8)).exprange(0.0001,1);
  sig = CombN.ar(sig,1,1,16);
  Splay.ar(sig.flat,0.25,0.5);
};
~boring.play;
m.addMix(~boring,postVol:true);
);" ],
[ 106.456562239, 'me', "(
~boring.quant=2;
~boring.fadeTime=2;
~boring={
  var sig = WhiteNoise.ar(0.5!8);
  sig = BBandPass.ar(sig,15000/(1..8)+1000,2) * LFSaw.ar(1/4/fib(8)).exprange(0.0001,1);
  sig = CombN.ar(sig,1,1,16);
  sig = Resonz.ar(sig,LFSaw.ar(4/fib(8)).exprange(50.0001,16000));
  Splay.ar(sig.flat,0.25,0.5);
};
~boring.play;
m.addMix(~boring,postVol:true);
);" ],
[ 139.495284973, 'me', "(
~boring.quant=2;
~boring.fadeTime=2;
~boring={
  var sig = WhiteNoise.ar(0.5!8);
  sig = BBandPass.ar(sig,15000/(1..8)+1000,2) * LFSaw.ar(1/4/fib(8)).exprange(0.0001,1);
  sig = CombN.ar(sig,1,1,16);
  sig = Resonz.ar(sig,LFSaw.ar(4/fib(8)).exprange(50.0001,16000));
  sig = GVerb.ar(sig,(1..8)/8+10);
  Splay.ar(sig.flat,0.25,0.5);
};
~boring.play;
m.addMix(~boring,postVol:true);
);" ],
[ 167.411616019, 'me', "(
~boring.quant=2;
~boring.fadeTime=2;
~boring={
  var sig = WhiteNoise.ar(0.5!8) + LFSaw.ar(50,mul:0.1);
  sig = BBandPass.ar(sig,15000/(1..8)+1000,2) * LFSaw.ar(1/4/fib(8)).exprange(0.0001,1);
  sig = CombN.ar(sig,1,1,16);
  sig = Resonz.ar(sig,LFSaw.ar(4/fib(8)).exprange(50.0001,16000));
  sig = GVerb.ar(sig,(1..8)/8+10);
  Splay.ar(sig.flat,0.25,0.5);
};
~boring.play;
m.addMix(~boring,postVol:true);
);" ],
[ 175.534948897, 'me', "(
~boring.quant=2;
~boring.fadeTime=2;
~boring={
  var sig = WhiteNoise.ar(0.5!8) + LFSaw.ar(50,mul:0.5);
  sig = BBandPass.ar(sig,15000/(1..8)+1000,2) * LFSaw.ar(1/4/fib(8)).exprange(0.0001,1);
  sig = CombN.ar(sig,1,1,16);
  sig = Resonz.ar(sig,LFSaw.ar(4/fib(8)).exprange(50.0001,16000));
  sig = GVerb.ar(sig,(1..8)/8+10);
  Splay.ar(sig.flat,0.25,0.5);
};
~boring.play;
m.addMix(~boring,postVol:true);
);" ],
[ 210.88274211, 'me', "(
~boring.quant=2;
~boring.fadeTime=2;
~boring={
  var sig = WhiteNoise.ar(0.5!8) + LFSaw.ar(50*[1,1.5,1.25,2,4,8,16,32],mul:0.75/(1..8));
  sig = BBandPass.ar(sig,15000/(1..8)+1000,2) * LFSaw.ar(1/4/fib(8)).exprange(0.0001,1);
  sig = CombN.ar(sig,1,1,16);
  sig = Resonz.ar(sig,LFSaw.ar(4/fib(8)).exprange(50.0001,16000));
  sig = GVerb.ar(sig,(1..8)/8+10);
  Splay.ar(sig.flat,0.25,0.5);
};
~boring.play;
m.addMix(~boring,postVol:true);
);" ],
[ 241.473071242, 'me', "(
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
);" ],
[ 276.995883555, 'me', "~boring.stop(60);" ],
];