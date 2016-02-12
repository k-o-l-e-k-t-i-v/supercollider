// History, as it was on Wed Jun 10 21:11:36 2015.

[
[ 0, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
    var sig = SinOsc.ar(43.2+((1..8)/10) );
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)/4),0.1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 15.448138655, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
    var sig = SinOsc.ar(43.2+((1..8)/10) );
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)/4),0.1);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 26.210270286, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
    var sig = SinOsc.ar(43.2+((1..8)/10) );
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)/4),0.25);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 46.534808723, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
    var sig = SinOsc.ar(43.2+((1..8)/10) );
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)/4),0.15);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 58.530160518, 'me', "~one.stop(2);" ],
[ 81.771909868, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
    var sig = SinOsc.ar(43.2*2+((1..8)/10) );
  sig = sig * Decay.ar(Impulse.ar(1/4,(0..7)/8),0.15);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 91.605956497, 'me', "thisProcess.stop;" ],
[ 125.18652335, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
    var sig = SinOsc.ar(43.2*2+((1..8)/10) ) * LFSaw.ar(1/4).exprange(0.001,1);
    sig = sig * Decay.ar(Impulse.ar(1/4,(0..7)/8),0.15) * LFPulse.ar(1/4);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 131.724493659, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
    var sig = SinOsc.ar(43.2*4+((1..8)/10) ) * LFSaw.ar(1/4).exprange(0.001,1);
    sig = sig * Decay.ar(Impulse.ar(1/4,(0..7)/8),0.15) * LFPulse.ar(1/4);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 137.686818205, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
    var sig = SinOsc.ar(43.2*4+((1..8)/100) ) * LFSaw.ar(1/4).exprange(0.001,1);
    sig = sig * Decay.ar(Impulse.ar(1/4,(0..7)/8),0.15) * LFPulse.ar(1/4);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 142.22726572, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
    var sig = SinOsc.ar(43.2*4+((1..8)/100) ) * LFSaw.ar(1/4).exprange(0.001,1);
    sig = sig * Decay.ar(Impulse.ar(1/4,(0..7)/8),0.15) * LFPulse.ar(1/4);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 150.76461924, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
    var sig = SinOsc.ar(43.2*4+((1..8)/100) ) * LFSaw.ar(1/4).exprange(0.001,1);
    sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)/8),0.15) * LFPulse.ar(1/4);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 156.850584632, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
    var sig = SinOsc.ar(43.2*4+((1..8)/100) ) * LFSaw.ar(1/4).exprange(0.001,1);
    sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)/8),0.15) * LFPulse.ar(1/4);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 162.611042217, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
    var sig = SinOsc.ar(43.2*8+((1..8)/100) ) * LFSaw.ar(1/4).exprange(0.001,1);
    sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)/8),0.15) * LFPulse.ar(1/4);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 165.2897546, 'me', "~one.stop(2);" ],
[ 168.488418816, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
    var sig = SinOsc.ar(43.2*8+((1..8)/100) ) * LFSaw.ar(1/4).exprange(0.001,1);
    sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)/8),0.15) * LFPulse.ar(1/4);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 172.645972235, 'me', "thisProcess.stop;" ],
[ 176.268539224, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
    var sig = SinOsc.ar(43.2*8+((1..8)/100) ) * LFSaw.ar(1/4).exprange(0.001,1);
    sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)/8),0.15) * LFPulse.ar(1/4);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 181.639359126, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
    var sig = SinOsc.ar(43.2*8+((1..8)/100) ) * LFSaw.ar(1/4).exprange(0.001,1);
    sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.15) * LFPulse.ar(1/4);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 188.414677177, 'me', "thisProcess.stop;" ],
[ 192.813693226, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
    var sig = SinOsc.ar(43.2*16+((1..8)/100) ) * LFSaw.ar(1/4).exprange(0.001,1);
    sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.15) * LFPulse.ar(1/4);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 197.570796085, 'me', "thisProcess.stop;" ],
[ 200.462021009, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
    var sig = SinOsc.ar(43.2*16+((1..8)/100) ) * LFSaw.ar(1/4).exprange(0.001,1);
    sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.15) * LFPulse.ar(1/4);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 209.447999975, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
    var sig = SinOsc.ar(43.2*16+((1..8)/100) ) * LFSaw.ar(1/4).exprange(0.001,1);
    sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)/8),0.15) * LFPulse.ar(1/4);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 212.6429551, 'me', "thisProcess.stop;" ],
[ 215.663785021, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
    var sig = SinOsc.ar(43.2+((1..8)/100) ) * LFSaw.ar(1/4).exprange(0.001,1);
    sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)/8),0.15) * LFPulse.ar(1/4);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 223.628517738, 'me', "thisProcess.stop;" ],
[ 226.39568197, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
    var sig = SinOsc.ar(43.2+((1..8)/100) ) * LFSaw.ar(1/4).exprange(0.001,1);
    sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)/8),0.15) * LFPulse.ar(1/4);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 230.487156615, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
    var sig = SinOsc.ar(43.2+((1..8)/100) ) * LFSaw.ar(1/4).exprange(0.001,1);
    sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)/8),0.25) * LFPulse.ar(1/4);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 234.653913511, 'me', "thisProcess.stop;" ],
[ 238.438660542, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
    var sig = SinOsc.ar(43.2*8+((1..8)/100) ) * LFSaw.ar(1/4).exprange(0.001,1);
    sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)/8),0.25) * LFPulse.ar(1/4);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 240.103113853, 'me', "thisProcess.stop;" ],
[ 296.836261471, 'me', "thisProcess.stop;" ],
[ 297.177727288, 'me', "(
~two.fadeTime=2;
~two={
  var sig = LFSaw.ar(5000!2) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
  sig = GVerb.ar(sig)/8 + sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 300.237473224, 'me', "thisProcess.stop;" ],
[ 304.159587507, 'me', "(
~two.quant=2;
~two.fadeTime=2;
~two={
  var sig = LFSaw.ar(5000!2) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
  sig = GVerb.ar(sig)/8 + sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 309.111139926, 'me', "thisProcess.stop;" ],
[ 313.386258708, 'me', "(
~two.quant=2;
~two.fadeTime=2;
~two={
  var sig = LFSaw.ar(5000!2) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
  sig = GVerb.ar(sig)/8 + sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 317.051503067, 'me', "thisProcess.stop;" ],
[ 322.635942879, 'me', "(
~two.quant=2;
~two.fadeTime=2;
~two={
  var sig = LFSaw.ar(5000!2) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
  sig = GVerb.ar(sig)/8 + sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 327.00114167, 'me', "thisProcess.stop;" ],
[ 331.487743227, 'me', "(
~two.quant=2;
~two.fadeTime=2;
~two={
  var sig = LFSaw.ar(5000!2) * Decay.ar(Impulse.ar(1/2,(0..3)/4),1);
  sig = GVerb.ar(sig)/8 + sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 333.88410113, 'me', "thisProcess.stop;" ],
[ 336.668787025, 'me', "(
~two.quant=2;
~two.fadeTime=2;
~two={
  var sig = LFSaw.ar(5000!2) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
  sig = GVerb.ar(sig)/8 + sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 340.528800116, 'me', "thisProcess.stop;" ],
[ 341.894943384, 'me', "(
~two.quant=2;
~two.fadeTime=2;
~two={
  var sig = LFSaw.ar(5000!2) * Decay.ar(Impulse.ar(1/8,(0..3)/4),1);
  sig = GVerb.ar(sig)/8 + sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 343.945083321, 'me', "thisProcess.stop;" ],
[ 347.201398355, 'me', "(
~two.quant=2;
~two.fadeTime=2;
~two={
  var sig = LFSaw.ar(5000!2) * Decay.ar(Impulse.ar(1/8,(0..3)/4),1);
  sig = GVerb.ar(sig)/8 + sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 347.425408057, 'me', "thisProcess.stop;" ],
[ 348.021521964, 'me', "(
~two.quant=2;
~two.fadeTime=2;
~two={
  var sig = LFSaw.ar(5000!2) * Decay.ar(Impulse.ar(1/8,(0..3)/4),1);
  sig = GVerb.ar(sig)/8 + sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 351.707446194, 'me', "thisProcess.stop;" ],
[ 355.462798817, 'me', "(
~two.quant=2;
~two.fadeTime=2;
~two={
  var sig = LFSaw.ar(5000!2) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
  sig = GVerb.ar(sig)/8 + sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 359.822182448, 'me', "thisProcess.stop;" ],
[ 362.470414268, 'me', "(
~two.quant=2;
~two.fadeTime=2;
~two={
  var sig = LFSaw.ar(5000!2) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
  sig = GVerb.ar(sig)/8 + sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 365.15493075, 'me', "thisProcess.stop;" ],
[ 383.959402677, 'me', "(
~two.quant=2;
~two.fadeTime=2;
~two={
  var sig = LFSaw.ar(5000!2) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = CombN.ar(sig,1,1/20,8);
    sig = GVerb.ar(sig)/8 + sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 387.752172103, 'me', "thisProcess.stop;" ],
[ 391.981628822, 'me', "(
~two.quant=2;
~two.fadeTime=2;
~two={
  var sig = LFSaw.ar(5000!2) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = CombN.ar(sig,1,1/20,8);
    sig = GVerb.ar(sig)/8 + sig;
  Splay.ar(sig.flat,0.25,0.025);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 397.078111486, 'me', "thisProcess.stop;" ],
[ 406.209110062, 'me', "(
~two.quant=2;
~two.fadeTime=2;
~two={
  var sig = LFSaw.ar(5000!2) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = CombN.ar(sig,1,1/20,8) * LFSaw.ar(1/4).exprange(0.001,1);
    sig = GVerb.ar(sig)/8 + sig;
  Splay.ar(sig.flat,0.25,0.025);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 431.111053427, 'me', "(
~two.quant=2;
~two.fadeTime=2;
~two={
  var sig = LFSaw.ar(5000!2) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = CombN.ar(sig,1,1/10,8) * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig)/8 + sig;
  Splay.ar(sig.flat,0.25,0.025);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 444.776762725, 'me', "(
~two.quant=2;
~two.fadeTime=2;
~two={
  var sig = LFSaw.ar(5000/2!2) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = CombN.ar(sig,1,1/2,8) * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig)/8 + sig;
  Splay.ar(sig.flat,0.25,0.025);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 451.877461981, 'me', "(
~two.quant=2;
~two.fadeTime=2;
~two={
  var sig = LFSaw.ar(5000/1.5!2) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = CombN.ar(sig,1,1/20,8) * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig)/8 + sig;
  Splay.ar(sig.flat,0.25,0.025);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 460.890534836, 'me', "(
~two.quant=2;
~two.fadeTime=2;
~two={
  var sig = LFSaw.ar(5000/1.5!2) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = CombN.ar(sig,1,1/20,8) * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig)/8 + sig;
  Splay.ar(sig.flat,0.25,0.125);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 469.144955062, 'me', "(
~two.quant=2;
~two.fadeTime=2;
~two={
  var sig = LFSaw.ar(5000/1.25!2) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = CombN.ar(sig,1,1/20,8) * LFSaw.ar(1/8/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig)/8 + sig;
  Splay.ar(sig.flat,0.25,0.125);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 472.557327771, 'me', "(
~two.quant=2;
~two.fadeTime=2;
~two={
  var sig = LFSaw.ar(5000/1.25!2) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = CombN.ar(sig,1,1/20,8) * LFSaw.ar(4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig)/8 + sig;
  Splay.ar(sig.flat,0.25,0.125);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 476.697698567, 'me', "(
~two.quant=2;
~two.fadeTime=2;
~two={
  var sig = LFSaw.ar(5000/1.25!2) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = CombN.ar(sig,1,1/20,8) * LFSaw.ar(4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig)/8 + sig;
  Splay.ar(sig.flat,0.25,0.025);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 481.012983582, 'me', "(
~two.quant=2;
~two.fadeTime=2;
~two={
  var sig = LFSaw.ar(5000/1.5!2) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = CombN.ar(sig,1,1/20,8) * LFSaw.ar(4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig)/8 + sig;
  Splay.ar(sig.flat,0.25,0.025);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 486.11818444, 'me', "(
~two.quant=2;
~two.fadeTime=2;
~two={
  var sig = LFSaw.ar(5000/1.25!2) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = CombN.ar(sig,1,1/20,8) * LFSaw.ar(4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig)/8 + sig;
  Splay.ar(sig.flat,0.25,0.025);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 499.755831018, 'me', "(
~two.quant=2;
~two.fadeTime=2;
~two={
  var sig = LFSaw.ar(5000/1.25!2) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = sig  * LFSaw.ar(4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig)/8 + sig;
  Splay.ar(sig.flat,0.25,0.025);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 505.711476983, 'me', "(
~two.quant=2;
~two.fadeTime=2;
~two={
  var sig = LFSaw.ar(5000/1.25!2) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = sig  * LFSaw.ar(4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig)/4 + sig;
  Splay.ar(sig.flat,0.25,0.025);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 511.595584491, 'me', "(
~two.quant=2;
~two.fadeTime=2;
~two={
  var sig = LFSaw.ar(5000/1.25!2) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = sig  * LFSaw.ar(4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10)/4 + sig;
  Splay.ar(sig.flat,0.25,0.025);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 514.98617571, 'me', "(
~two.quant=2;
~two.fadeTime=2;
~two={
  var sig = LFSaw.ar(5000/1.25!2) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = sig  * LFSaw.ar(4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10)/4 + sig;
  Splay.ar(sig.flat,0.25,0.125);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 519.469523714, 'me', "(
~two.quant=2;
~two.fadeTime=2;
~two={
  var sig = LFSaw.ar(500/1.25!2) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = sig  * LFSaw.ar(4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10)/4 + sig;
  Splay.ar(sig.flat,0.25,0.125);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 526.762856692, 'me', "(
~two.quant=2;
~two.fadeTime=2;
~two={
  var sig = LFSaw.ar(500/(1.25*pi)) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = sig  * LFSaw.ar(4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10)/4 + sig;
  Splay.ar(sig.flat,0.25,0.125);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 528.695853536, 'me', "(
~two.quant=2;
~two.fadeTime=2;
~two={
  var sig = LFSaw.ar(500/(1.25*pi)) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = sig  * LFSaw.ar(8/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10)/4 + sig;
  Splay.ar(sig.flat,0.25,0.125);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 534.429437767, 'me', "(
~two.quant=2;
~two.fadeTime=2;
~two={
  var sig = LFSaw.ar(500/(1.5*pi)) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = sig  * LFSaw.ar(8/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10)/4 + sig;
  Splay.ar(sig.flat,0.25,0.125);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 542.471972067, 'me', "(
~two.quant=2;
~two.fadeTime=2;
~two={
  var sig = LFSaw.ar(500/(1.25*pi)) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = sig  * LFSaw.ar(8/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10)/4 + sig;
  Splay.ar(sig.flat,0.25,0.125);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 548.922258822, 'me', "(
~two.quant=2;
~two.fadeTime=4;
~two={
  var sig = LFSaw.ar(500/(1.25*pi)) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = sig  * LFSaw.ar(8/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10)/4 + sig;
  Splay.ar(sig.flat,0.25,0.125);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 552.065942854, 'me', "(
~two.quant=2;
~two.fadeTime=4;
~two={
  var sig = LFSaw.ar(500/(1.25*pi)) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = sig  * LFSaw.ar(4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10)/4 + sig;
  Splay.ar(sig.flat,0.25,0.125);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 556.938613633, 'me', "(
~two.quant=2;
~two.fadeTime=4;
~two={
  var sig = LFSaw.ar(500/(1.5*pi)) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = sig  * LFSaw.ar(4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10)/4 + sig;
  Splay.ar(sig.flat,0.25,0.125);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 562.435831624, 'me', "(
~two.quant=2;
~two.fadeTime=4;
~two={
  var sig = LFSaw.ar(500/(1.5*0.5pi)) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = sig  * LFSaw.ar(4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10)/4 + sig;
  Splay.ar(sig.flat,0.25,0.125);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 565.203956257, 'me', "(
~two.quant=2;
~two.fadeTime=4;
~two={
  var sig = LFSaw.ar(500/(1.5*0.25pi)) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = sig  * LFSaw.ar(4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10)/4 + sig;
  Splay.ar(sig.flat,0.25,0.125);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 567.786296944, 'me', "(
~two.quant=2;
~two.fadeTime=4;
~two={
  var sig = LFSaw.ar(500/(1.25*0.25pi)) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = sig  * LFSaw.ar(4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10)/4 + sig;
  Splay.ar(sig.flat,0.25,0.125);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 574.37489949, 'me', "(
~two.quant=2;
~two.fadeTime=4;
~two={
  var sig = LFSaw.ar(500/(1.5*0.25pi)) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = sig  * LFSaw.ar(4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10)/4 + sig;
  Splay.ar(sig.flat,0.25,0.125);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 579.812497068, 'me', "(
~two.quant=2;
~two.fadeTime=4;
~two={
  var sig = LFSaw.ar(500/(1.25*0.25pi)) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = sig  * LFSaw.ar(4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10)/4 + sig;
  Splay.ar(sig.flat,0.25,0.125);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 586.209649921, 'me', "(
~two.quant=2;
~two.fadeTime=4;
~two={
  var sig = LFSaw.ar(500/(1.25*0.5pi)) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = sig  * LFSaw.ar(4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10)/4 + sig;
  Splay.ar(sig.flat,0.25,0.125);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 588.524401918, 'me', "(
~two.quant=2;
~two.fadeTime=4;
~two={
  var sig = LFSaw.ar(500/(1.25*0.5pi)) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = sig  * LFSaw.ar(4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10)/4 + sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 591.64445589, 'me', "(
~two.quant=2;
~two.fadeTime=4;
~two={
  var sig = LFSaw.ar(500/(1.25*0.5pi)) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = sig  * LFSaw.ar(4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10)/4 + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 597.312506554, 'me', "(
~two.quant=2;
~two.fadeTime=4;
~two={
  var sig = LFSaw.ar(500/(1.25*0.5pi)) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = sig  * LFSaw.ar(4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10)/4 + sig;
  Splay.ar(sig.flat,0.25,0.125);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 599.33170387, 'me', "(
~two.quant=2;
~two.fadeTime=4;
~two={
  var sig = LFSaw.ar(50/(1.25*0.5pi)) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = sig  * LFSaw.ar(4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10)/4 + sig;
  Splay.ar(sig.flat,0.25,0.125);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 603.887235801, 'me', "(
~two.quant=2;
~two.fadeTime=4;
~two={
  var sig = LFSaw.ar(50/(1.25*0.5pi)) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = sig  * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10)/4 + sig;
  Splay.ar(sig.flat,0.25,0.125);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 609.027574011, 'me', "(
~two.quant=2;
~two.fadeTime=4;
~two={
  var sig = LFSaw.ar(50/(1.25*0.5pi)) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = sig  * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10)/4 + sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 610.249384033, 'me', "(
~two.quant=2;
~two.fadeTime=4;
~two={
  var sig = LFSaw.ar(50/(1.25*0.5pi)) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = sig  * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10)/4 + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 613.431447329, 'me', "(
~two.quant=2;
~two.fadeTime=4;
~two={
  var sig = LFSaw.ar(50/(1.25*0.5pi)) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = sig  * LFSaw.ar(4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10)/4 + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 615.161127053, 'me', "(
~two.quant=2;
~two.fadeTime=4;
~two={
  var sig = LFSaw.ar(50/(1.5*0.5pi)) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = sig  * LFSaw.ar(4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10)/4 + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 617.04352224, 'me', "(
~two.quant=2;
~two.fadeTime=4;
~two={
  var sig = LFSaw.ar(50/(1.5*0.25pi)) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = sig  * LFSaw.ar(4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10)/4 + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 621.46912126, 'me', "(
~two.fadeTime=4;
~two={
  var sig = LFSaw.ar(50/(1.5pi)) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = sig  * LFSaw.ar(4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10)/4 + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 630.759787635, 'me', "thisProcess.stop;" ],
[ 631.704762932, 'me', "thisProcess.stop;" ],
[ 639.590635482, 'me', "(
~two.quant=2;
~two.fadeTime=4;
~two={
  var sig = LFSaw.ar(50/(1.5pi)) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = sig  * LFSaw.ar(4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10)/4 + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 642.257114231, 'me', "(
~two.quant=2;
~two.fadeTime=4;
~two={
  var sig = LFSaw.ar(50/(1.5pi)) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = sig  * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10)/4 + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 644.149760771, 'me', "(
~two.quant=2;
~two.fadeTime=4;
~two={
  var sig = LFSaw.ar(50/(1.25pi)) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = sig  * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10)/4 + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 649.872206271, 'me', "(
~two.quant=2;
~two.fadeTime=4;
~two={
  var sig = LFSaw.ar(500/(1.25pi)) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = sig  * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10)/4 + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 655.088673187, 'me', "(
~two.quant=2;
~two.fadeTime=4;
~two={
  var sig = LFSaw.ar(500/(1.25pi)) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = sig  * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10)/4 + sig;
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 660.213781535, 'me', "(
~two.quant=2;
~two.fadeTime=4;
~two={
  var sig = LFSaw.ar(500/(1.25pi)) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = sig  * LFSaw.ar(4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10)/4 + sig;
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 667.192268355, 'me', "(
~two.quant=2;
~two.fadeTime=4;
~two={
  var sig = LFSaw.ar(500/(1.5pi)) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = sig  * LFSaw.ar(4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10)/4 + sig;
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 680.524687957, 'me', "(
~two.quant=2;
~two.fadeTime=4;
~two={
  var sig = LFSaw.ar(500/(1.5pi)) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = sig  * LFSaw.ar(4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10)/2 + sig;
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 689.956818945, 'me', "(
~two.quant=2;
~two.fadeTime=4;
~two={
  var sig = LFSaw.ar(50*(1.5pi)) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = sig  * LFSaw.ar(4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10)/2 + sig;
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 694.072850933, 'me', "(
~two.quant=2;
~two.fadeTime=4;
~two={
  var sig = LFSaw.ar(50*(1.25pi)) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = sig  * LFSaw.ar(4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10)/2 + sig;
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 699.486272446, 'me', "(
~two.quant=2;
~two.fadeTime=4;
~two={
  var sig = LFSaw.ar(500*(1.25pi)) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = sig  * LFSaw.ar(4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10)/2 + sig;
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 704.435526514, 'me', "(
~two.quant=2;
~two.fadeTime=4;
~two={
  var sig = LFSaw.ar(5000*(1.25pi)) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = sig  * LFSaw.ar(4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10)/2 + sig;
  Splay.ar(sig.flat,0.25,0.1);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 707.21615901, 'me', "(
~two.quant=2;
~two.fadeTime=4;
~two={
  var sig = LFSaw.ar(5000*(1.25pi)) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = sig  * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10)/2 + sig;
  Splay.ar(sig.flat,0.25,0.1);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 710.506517652, 'me', "(
~two.quant=2;
~two.fadeTime=4;
~two={
  var sig = LFSaw.ar(5000*(1.25pi)) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = sig  * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,100)/2 + sig;
  Splay.ar(sig.flat,0.25,0.1);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 716.024627232, 'me', "(
~two.quant=2;
~two.fadeTime=4;
~two={
  var sig = LFSaw.ar(5000*(1.25pi)) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = sig  * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,100)/4 + sig;
  Splay.ar(sig.flat,0.25,0.1);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 720.085818633, 'me', "(
~two.quant=2;
~two.fadeTime=4;
~two={
  var sig = LFSaw.ar(5000*(1.25pi)) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = sig  * LFSaw.ar(4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,100)/4 + sig;
  Splay.ar(sig.flat,0.25,0.1);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 723.177997633, 'me', "(
~two.quant=2;
~two.fadeTime=4;
~two={
  var sig = LFSaw.ar(5000*(1.25pi)) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
    sig = sig  * LFSaw.ar(4).exprange(0.001,1);
    sig = GVerb.ar(sig,100)/4 + sig;
  Splay.ar(sig.flat,0.25,0.1);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 726.726624051, 'me', "thisProcess.stop;" ],
[ 757.796991476, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(50!2) * Pulse.ar(4);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 771.605885174, 'me', "thisProcess.stop;" ],
[ 779.653089767, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(50!2) * Pulse.ar(2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 791.233543786, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(75!2) * Pulse.ar(2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 796.7838717, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(75!2) * Pulse.ar(4);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 797.779272943, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(75!2) * Pulse.ar(8);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 801.277103933, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(75!2) * Pulse.ar(8);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 804.049538929, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(75!2) * Pulse.ar(8);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.95);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 809.337366906, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(75!2) * Pulse.ar(8);
  sig = sig;
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 811.686057745, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(75!2) * Pulse.ar(16);
  sig = sig;
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 813.579629457, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(75!2) * Pulse.ar(32);
  sig = sig;
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 813.596298194, 'me', "    var sig = LFSaw.ar(75!2) * Pulse.ar(32);" ],
[ 814.538903528, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(75!2) * Pulse.ar(32);
  sig = sig;
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 816.337652428, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(75!2) * Pulse.ar(64);
  sig = sig;
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 818.345788426, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(75!2) * Pulse.ar(128);
  sig = sig;
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 823.141116546, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(75!2) * Pulse.ar(1);
  sig = sig;
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 830.437859793, 'me', "~quad.stop(7);" ],
[ 837.713498864, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(75!2) * Pulse.ar(1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.1);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 843.945065131, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(75!2) * Pulse.ar(1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.1);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 849.369424152, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(75!2) * Pulse.ar(1/2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.1);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 851.640160686, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(75!2) * Pulse.ar(1/4);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.1);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 853.637136151, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(75!2) * Pulse.ar(1/2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.1);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 855.746339285, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(75!2) * Pulse.ar(1/2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.1);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 857.238854917, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(75!2) * Pulse.ar(1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.1);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 858.69936037, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(75!2) * Pulse.ar(4);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.1);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 862.769102171, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(75!2) * Pulse.ar(2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.1);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 864.427820629, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(75!2) * Pulse.ar(4);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.1);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 866.014782267, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(75!2) * Pulse.ar(2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.1);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 867.391119127, 'me', "(
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(75!2) * Pulse.ar(4);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.1);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 868.738257225, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(75!2) * Pulse.ar(2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.1);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 870.286676805, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(75!2) * Pulse.ar(4);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.1);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 872.281724113, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(75!2) * Pulse.ar(2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.1);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 873.598709017, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(75!2) * Pulse.ar(4);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.1);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 875.635356553, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(75!2) * Pulse.ar(2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.1);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 879.392202722, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(75!2) * Pulse.ar(2);
  sig = sig;
  Splay.ar(sig.flat,0.25,5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 881.86703563, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(75!2) * Pulse.ar(2);
  sig = sig;
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 882.124840889, 'me', "thisProcess.stop;" ],
[ 906.933466885, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(7500!2) * Pulse.ar(1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 911.211177603, 'me', "thisProcess.stop;" ],
[ 913.714179184, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(7500!2) * Pulse.ar(1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 916.744981213, 'me', "thisProcess.stop;" ],
[ 918.637330366, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(7500!2) * Pulse.ar(1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 920.808027697, 'me', "thisProcess.stop;" ],
[ 942.272317838, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(7500!2) * LFPulse.ar(1/4/fib(8));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 946.176882474, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(7500!2) * LFPulse.ar(1/4/fib(8));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 948.576771506, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(7500!2) * LFPulse.ar(1/4/fib(8));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.125);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 961.105192165, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(7500/([1,2,4,8]*pi)) * LFPulse.ar(1/4/fib(8));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.125);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 966.046907465, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(7500/([1,2,4,8]*pi)) * LFPulse.ar(1/4/fib(8));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 968.06845629, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(750/([1,2,4,8]*pi)) * LFPulse.ar(1/4/fib(8));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 970.43619022, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(7500/([1,2,4,8]*pi)) * LFPulse.ar(1/4/fib(8));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 974.239149202, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(7500/([1,2,4,8]*pi)) * LFPulse.ar(4/fib(8));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 979.32445778, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(7500/([1,2,4,8]*pi)) * LFPulse.ar(4/fib(8));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 991.863134966, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(7500/([1,2,4,8]*pi)) * LFPulse.ar(4/fib(8));
  sig = GVerb.ar(sig,10);

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 996.279494013, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(17500/([1,2,4,8]*pi)) * LFPulse.ar(4/fib(8));
  sig = GVerb.ar(sig,10);

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1002.472292945, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(17500/([1,2,4,8]*pi)) * LFPulse.ar(4/fib(8));
  sig = GVerb.ar(sig,10);

  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1007.217475748, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(1750/([1,2,4,8]*pi)) * LFPulse.ar(4/fib(8));
  sig = GVerb.ar(sig,10);

  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1011.15861247, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(1750/([1,2,4,8]*pi)) * LFPulse.ar(4/fib(8));
  sig = GVerb.ar(sig,10);

  Splay.ar(sig.flat,0.25,0.55);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1013.922106166, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(1750/([1,2,4,8]*pi)) * LFPulse.ar(4/fib(8));
  sig = GVerb.ar(sig,10);

  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1016.297775422, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(1750/([1,2,4,8]*pi)) * LFPulse.ar(4/fib(8));
  sig = GVerb.ar(sig,10);

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1017.354003961, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(1750/([1,2,4,8]*pi)) * LFPulse.ar(4/fib(8));
  sig = GVerb.ar(sig,10);

  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1024.053074724, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(17500/([1,2,4,8]*pi)) * LFPulse.ar(4/fib(8));
  sig = GVerb.ar(sig,10);

  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1029.66616872, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(17500/([1,2,4,8]*pi)) * LFPulse.ar(1/4/fib(8));
  sig = GVerb.ar(sig,10);

  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1035.448623769, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(1750/([1,2,4,8]*pi)) * LFPulse.ar(1/4/fib(8));
  sig = GVerb.ar(sig,10);

  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1065.285392896, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
  var sig = LFSaw.ar(70!2) * Pulse.ar(4/fib(8));
  
    sig = GVerb.ar(sig,100);

  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1078.463888934, 'me', "thisProcess.stop;" ],
[ 1079.544581834, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
  var sig = LFSaw.ar(70!2) * Pulse.ar(4/fib(8));
  
    sig = GVerb.ar(sig,100);

  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1084.49972973, 'me', "thisProcess.stop;" ],
[ 1084.670736895, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
  var sig = LFSaw.ar(70!2) * Pulse.ar(4/fib(8));
  
    sig = GVerb.ar(sig,100);

  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1088.451276811, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
  var sig = LFSaw.ar(70!2) * Pulse.ar(4/fib(8));
  
    sig = GVerb.ar(sig,100);

  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1091.206794654, 'me', "thisProcess.stop;" ],
[ 1093.505801534, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
  var sig = LFSaw.ar(70!2) * Pulse.ar(4/fib(8));
  
    sig = GVerb.ar(sig,100);

  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1095.930414106, 'me', "thisProcess.stop;" ],
[ 1096.192254781, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
  var sig = LFSaw.ar(70!2) * Pulse.ar(4/fib(8));
  
    sig = GVerb.ar(sig,100);

  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1099.398678218, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
  var sig = LFSaw.ar(70!2) * Pulse.ar(4/fib(8));
  
    sig = GVerb.ar(sig,100);

  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1100.713717505, 'me', "thisProcess.stop;" ],
[ 1102.888832988, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
  var sig = LFSaw.ar(70!2) * Pulse.ar(4/fib(8));
  
    sig = GVerb.ar(sig,100);

  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1107.019831327, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
  var sig = LFSaw.ar(70!2) * Pulse.ar(4/fib(8));
  
    sig = GVerb.ar(sig,100);

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1113.653626564, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
  var sig = LFSaw.ar(70!2) * Pulse.ar(4/fib(8));
  
    sig = GVerb.ar(sig,10);

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1119.052561768, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
  var sig = LFSaw.ar(70!2) * Pulse.ar(1/4/fib(8));
  
    sig = GVerb.ar(sig,10);

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1122.390548418, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
  var sig = LFSaw.ar(70!2) * Pulse.ar(4/fib(8));
  
    sig = GVerb.ar(sig,10);

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1130.312918878, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(70*[1,2,4,8]) * Pulse.ar(4/fib(8));
  
    sig = GVerb.ar(sig,10);

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1136.375430193, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(70*[1,2,4,8]) * Pulse.ar(4/fib(8));
  
    sig = GVerb.ar(sig,10);

  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1138.705911686, 'me', "(
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(70*[1,2,4,8]) * Pulse.ar(4/fib(8));
  
    sig = GVerb.ar(sig,100);

  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1142.960570222, 'me', "thisProcess.stop;" ],
[ 1143.512984131, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(70*[1,2,4,8]) * Pulse.ar(4/fib(8));
  
    sig = GVerb.ar(sig,100);

  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1146.91389252, 'me', "thisProcess.stop;" ],
[ 1148.384424893, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(70*[1,2,4,8]) * Pulse.ar(4/fib(8));
  
    sig = GVerb.ar(sig,100);

  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1153.156995607, 'me', "thisProcess.stop;" ],
[ 1154.756279502, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar(70*[1,2,4,8]) * Pulse.ar(4/fib(8));
  
    sig = GVerb.ar(sig,100);

  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1159.09866833, 'me', "(
~quad.quant=2;
~quad.fadeTime=0.02;
~quad={
    var sig = LFSaw.ar(70*[1,2,4,8]) * Pulse.ar(4/fib(8));
  
    sig = GVerb.ar(sig,100);

  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1159.76904027, 'me', "thisProcess.stop;" ],
[ 1162.961851341, 'me', "(
~quad.quant=2;
~quad.fadeTime=0.02;
~quad={
    var sig = LFSaw.ar(70*[1,2,4,8]) * Pulse.ar(4/fib(8));
  
    sig = GVerb.ar(sig,100);

  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1163.842218559, 'me', "thisProcess.stop;" ],
[ 1165.081891359, 'me', "(
~quad.quant=2;
~quad.fadeTime=0.02;
~quad={
    var sig = LFSaw.ar(70*[1,2,4,8]) * Pulse.ar(4/fib(8));
  
    sig = GVerb.ar(sig,100);

  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1166.771385049, 'me', "thisProcess.stop;" ],
[ 1169.243083766, 'me', "(
~quad.quant=2;
~quad.fadeTime=0.02;
~quad={
    var sig = LFSaw.ar(70*[1,2,4,8]) * Pulse.ar(4/fib(8));
  
    sig = GVerb.ar(sig,100);

  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1169.394401994, 'me', "thisProcess.stop;" ],
[ 1170.214156477, 'me', "(
~quad.quant=2;
~quad.fadeTime=0.02;
~quad={
    var sig = LFSaw.ar(70*[1,2,4,8]) * Pulse.ar(4/fib(8));
  
    sig = GVerb.ar(sig,100);

  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1172.258187153, 'me', "thisProcess.stop;" ],
[ 1175.854005525, 'me', "(
~quad.quant=2;
~quad.fadeTime=0.02;
~quad={
    var sig = LFSaw.ar(70*[1,2,4,8]) * Pulse.ar(4/fib(8));
  
    sig = GVerb.ar(sig,10);

  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1176.992156747, 'me', "thisProcess.stop;" ],
[ 1212.334074374, 'me', "(
~quad.quant=2;
~quad.fadeTime=0.02;
~quad={
    var sig = LFSaw.ar(50*[1,1.5]) * Pulse.ar(1/4/fib(8));
  
    sig = GVerb.ar(sig,10) * LFPulse.ar(4);

  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1215.465668701, 'me', "thisProcess.stop;" ],
[ 1216.138909584, 'me', "(
~quad.quant=2;
~quad.fadeTime=0.02;
~quad={
    var sig = LFSaw.ar(50*[1,1.5]) * Pulse.ar(1/4/fib(8));
  
    sig = GVerb.ar(sig,10) * LFPulse.ar(1/4);

  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1219.626672301, 'me', "thisProcess.stop;" ],
[ 1220.734169048, 'me', "(
~quad.quant=2;
~quad.fadeTime=0.02;
~quad={
    var sig = LFSaw.ar(50*[1,1.5]) * Pulse.ar(1/4/fib(8));
  
    sig = GVerb.ar(sig,10) * LFPulse.ar(1/4);

  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1223.192731837, 'me', "thisProcess.stop;" ],
[ 1225.206218804, 'me', "(
~quad.quant=2;
~quad.fadeTime=0.02;
~quad={
    var sig = LFSaw.ar(50*[1,1.5]) * Pulse.ar(1/4/fib(8));
  
    sig = GVerb.ar(sig,10) * LFPulse.ar(1/4);

  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1227.176478367, 'me', "thisProcess.stop;" ],
[ 1229.334207101, 'me', "(
~quad.quant=2;
~quad.fadeTime=0.02;
~quad={
    var sig = LFSaw.ar(50*[1,1.5]) * Pulse.ar(1/4/fib(8));
  
    sig = GVerb.ar(sig,10) * LFPulse.ar(1/4);

  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1231.287180285, 'me', "thisProcess.stop;" ],
[ 1233.276846749, 'me', "(
~quad.quant=2;
~quad.fadeTime=0.02;
~quad={
    var sig = LFSaw.ar(50*[1,1.5]) * Pulse.ar(1/4/fib(8));
  
    sig = GVerb.ar(sig,10) * LFPulse.ar(1/4);

  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1236.546063652, 'me', "thisProcess.stop;" ],
[ 1243.247729904, 'me', "(
~quad.quant=2;
~quad.fadeTime=0.02;
~quad={
    var sig = LFSaw.ar(50*[1,1.5]) * Pulse.ar(1/4/fib(8));
  
    sig = GVerb.ar(sig,100) * LFPulse.ar(1/4);

  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1245.923159657, 'me', "thisProcess.stop;" ],
[ 1249.633763368, 'me', "(
~quad.quant=2;
~quad.fadeTime=0.02;
~quad={
    var sig = LFSaw.ar(50*[1,1.5]) * Pulse.ar(1/4/fib(8));
  
    sig = GVerb.ar(sig,100) * LFPulse.ar(1/4);

  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1251.659959348, 'me', "thisProcess.stop;" ],
[ 1254.399631351, 'me', "(
~quad.quant=2;
~quad.fadeTime=0.02;
~quad={
    var sig = LFSaw.ar(50*[1,1.5]) * Pulse.ar(1/4/fib(8));
  
    sig = GVerb.ar(sig,100) * LFPulse.ar(1/4);

  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1257.591344365, 'me', "thisProcess.stop;" ],
[ 1280.774756172, 'me', "(
~quad.quant=2;
~quad.fadeTime=0.02;
~quad={
    var sig = LFSaw.ar(50*[1,1.5],mul:0.1) * Pulse.ar(4/fib(8));
  
    sig = GVerb.ar(sig,100) * LFPulse.ar(1/4);

  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1290.081961318, 'me', "(
~quad.quant=2;
~quad.fadeTime=0.02;
~quad={
    var sig = LFSaw.ar(50*[1,1.5],mul:0.1) * Pulse.ar(4/fib(8));
  
    sig = GVerb.ar(sig,100) * LFPulse.ar(1/4);

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1297.526771259, 'me', "(
~quad.quant=2;
~quad.fadeTime=0.02;
~quad={
    var sig = LFSaw.ar(50*[1,1.5],mul:0.1) * Pulse.ar(4/fib(8));
  
    sig = GVerb.ar(sig,10) * LFPulse.ar(1/4);

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1314.267701487, 'me', "(
~quad.quant=2;
~quad.fadeTime=0.02;
~quad={
    var sig = LFSaw.ar(50*[1,1.5,8],mul:0.1) * Pulse.ar(4/fib(8));
  
    sig = GVerb.ar(sig,10) * LFPulse.ar(1/4);

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1324.65113835, 'me', "(
~quad.quant=2;
~quad.fadeTime=0.02;
~quad={
    var sig = LFSaw.ar(50*[1,1.5,4],mul:0.1) * Pulse.ar(4/fib(8));
  
    sig = GVerb.ar(sig,10) * LFPulse.ar(1/4);

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1330.394961754, 'me', "(
~quad.quant=2;
~quad.fadeTime=0.02;
~quad={
    var sig = LFSaw.ar(50*[1,1.5,4*1.5],mul:0.1) * Pulse.ar(4/fib(8));
  
    sig = GVerb.ar(sig,10) * LFPulse.ar(1/4);

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1335.405727244, 'me', "(
~quad.quant=2;
~quad.fadeTime=0.02;
~quad={
    var sig = LFSaw.ar(50*[1,1.5,4*1.25],mul:0.2) * Pulse.ar(4/fib(8));
  
    sig = GVerb.ar(sig,10) * LFPulse.ar(1/4);

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1341.254714317, 'me', "(
~quad.quant=2;
~quad.fadeTime=0.02;
~quad={
    var sig = LFSaw.ar(50*[1,1.5,4*1.25],mul:0.2) * Pulse.ar(4/fib(8));
  
    sig = GVerb.ar(sig,10) * LFPulse.ar(4);

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1355.807017398, 'me', "(
~quad.quant=2;
~quad.fadeTime=0.02;
~quad={
    var sig = LFSaw.ar(50*[1,1.5,4*1.5],mul:0.2) * Pulse.ar(4/fib(8));
  
    sig = GVerb.ar(sig,10) * LFPulse.ar(4);

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1365.90155903, 'me', "(
~quad.quant=2;
~quad.fadeTime=0.02;
~quad={
    var sig = LFSaw.ar(50*[1,1.5,4*1.25],mul:0.2) * Pulse.ar(4/fib(8));
  
    sig = GVerb.ar(sig,10) * LFPulse.ar(4);

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1372.405260741, 'me', "(
~quad.quant=2;
~quad.fadeTime=0.02;
~quad={
    var sig = LFSaw.ar(50*[1,1.25,4*1.25],mul:0.2) * Pulse.ar(4/fib(8));
  
    sig = GVerb.ar(sig,10) * LFPulse.ar(4);

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1378.329930419, 'me', "(
~quad.quant=2;
~quad.fadeTime=0.02;
~quad={
    var sig = LFSaw.ar(50*[1,1.25,8*1.25],mul:0.2) * Pulse.ar(4/fib(8));
  
    sig = GVerb.ar(sig,10) * LFPulse.ar(4);

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1383.978408383, 'me', "(
~quad.quant=2;
~quad.fadeTime=0.02;
~quad={
    var sig = LFSaw.ar(50*[1,1.25,4*1.25],mul:0.2) * Pulse.ar(4/fib(8));
  
    sig = GVerb.ar(sig,10) * LFPulse.ar(4);

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1389.94707751, 'me', "(
~quad.quant=2;
~quad.fadeTime=0.02;
~quad={
    var sig = LFSaw.ar(50*[1,1.25,4*1.25],mul:0.2) * Pulse.ar(4/fib(8));
  
    sig = GVerb.ar(sig,10) * LFPulse.ar(4);

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1396.810982339, 'me', "(
~quad.quant=2;
~quad.fadeTime=0.02;
~quad={
    var sig = LFSaw.ar(50*[1,1.25,4*1.25],mul:0.2) * Pulse.ar(8/fib(8));
  
    sig = GVerb.ar(sig,10) * LFPulse.ar(4);

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1406.110694976, 'me', "(
~quad.quant=2;
~quad.fadeTime=0.02;
~quad={
    var sig = LFSaw.ar(50*[1,1.25,4*1.25],mul:0.2) * Pulse.ar(8/fib(8));
  
    sig = GVerb.ar(sig,10) * LFPulse.ar(8);

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1410.350119921, 'me', "(
~quad.quant=2;
~quad.fadeTime=0.02;
~quad={
    var sig = LFSaw.ar(50*[1,1.25,4*1.5],mul:0.2) * Pulse.ar(8/fib(8));
  
    sig = GVerb.ar(sig,10) * LFPulse.ar(8);

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1414.367335296, 'me', "(
~quad.quant=2;
~quad.fadeTime=0.02;
~quad={
    var sig = LFSaw.ar(50*[1,1.5,4*1.5],mul:0.2) * Pulse.ar(8/fib(8));
  
    sig = GVerb.ar(sig,10) * LFPulse.ar(8);

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1419.197545121, 'me', "(
~quad.quant=2;
~quad.fadeTime=0.02;
~quad={
    var sig = LFSaw.ar(50*[1,1.25,4*1.5],mul:0.2) * Pulse.ar(8/fib(8));
  
    sig = GVerb.ar(sig,10) * LFPulse.ar(8);

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1421.37359805, 'me', "(
~quad.quant=2;
~quad.fadeTime=0.02;
~quad={
    var sig = LFSaw.ar(50*[1,1.25,8*1.5],mul:0.2) * Pulse.ar(8/fib(8));
  
    sig = GVerb.ar(sig,10) * LFPulse.ar(8);

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1425.309705321, 'me', "(
~quad.quant=2;
~quad.fadeTime=0.02;
~quad={
    var sig = LFSaw.ar(50*[1,1.25,2*1.5],mul:0.2) * Pulse.ar(8/fib(8));
  
    sig = GVerb.ar(sig,10) * LFPulse.ar(8);

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1426.895238236, 'me', "(
~quad.quant=2;
~quad.fadeTime=0.02;
~quad={
    var sig = LFSaw.ar(50*[1,1.25,4*1.5],mul:0.2) * Pulse.ar(8/fib(8));
  
    sig = GVerb.ar(sig,10) * LFPulse.ar(8);

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1429.226904611, 'me', "(
~quad.quant=2;
~quad.fadeTime=0.02;
~quad={
    var sig = LFSaw.ar(50*[1,1.25,8*1.5],mul:0.2) * Pulse.ar(8/fib(8));
  
    sig = GVerb.ar(sig,10) * LFPulse.ar(8);

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1431.573868212, 'me', "(
~quad.quant=2;
~quad.fadeTime=0.02;
~quad={
    var sig = LFSaw.ar(50*[1,1.25,16*1.5],mul:0.2) * Pulse.ar(8/fib(8));
  
    sig = GVerb.ar(sig,10) * LFPulse.ar(8);

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1434.711504623, 'me', "(
~quad.quant=2;
~quad.fadeTime=0.02;
~quad={
    var sig = LFSaw.ar(50*[1,1.25,8*1.5],mul:0.2) * Pulse.ar(8/fib(8));
  
    sig = GVerb.ar(sig,10) * LFPulse.ar(8);

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1438.038894344, 'me', "(
~quad.quant=2;
~quad.fadeTime=0.02;
~quad={
    var sig = LFSaw.ar(50*[1,1.25,16*1.25],mul:0.2) * Pulse.ar(8/fib(8));
  
    sig = GVerb.ar(sig,10) * LFPulse.ar(8);

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1442.372240952, 'me', "(
~quad.quant=2;
~quad.fadeTime=0.02;
~quad={
    var sig = LFSaw.ar(50*[1,1.25,16*1.125],mul:0.2) * Pulse.ar(8/fib(8));
  
    sig = GVerb.ar(sig,10) * LFPulse.ar(8);

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1445.806981635, 'me', "(
~quad.quant=2;
~quad.fadeTime=0.02;
~quad={
    var sig = LFSaw.ar(50*[1,1.25,8*1.125],mul:0.2) * Pulse.ar(8/fib(8));
  
    sig = GVerb.ar(sig,10) * LFPulse.ar(8);

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1447.288307576, 'me', "(
~quad.quant=2;
~quad.fadeTime=0.02;
~quad={
    var sig = LFSaw.ar(50*[1,1.5,8*1.125],mul:0.2) * Pulse.ar(8/fib(8));
  
    sig = GVerb.ar(sig,10) * LFPulse.ar(8);

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1449.466441837, 'me', "(
~quad.quant=2;
~quad.fadeTime=0.02;
~quad={
    var sig = LFSaw.ar(50*[2,1.5,8*1.125],mul:0.2) * Pulse.ar(8/fib(8));
  
    sig = GVerb.ar(sig,10) * LFPulse.ar(8);

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1451.296157697, 'me', "(
~quad.quant=2;
~quad.fadeTime=0.02;
~quad={
    var sig = LFSaw.ar(50*[2,1.25,8*1.125],mul:0.2) * Pulse.ar(8/fib(8));
  
    sig = GVerb.ar(sig,10) * LFPulse.ar(8);

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1474.02256899, 'me', "~quad.stop(7);" ],
[ 1591.829487735, 'me', "(
~whisper.quant=2;
~whisper.fadeTime=2;
~whisper={
    var sig = WhiteNoise.ar(0.1!2);
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~whisper,postVol:true);
~whisper.play;
);" ],
[ 1597.623766889, 'me', "(
~whisper.quant=2;
~whisper.fadeTime=2;
~whisper={
    var sig = WhiteNoise.ar(0.2!2);
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~whisper,postVol:true);
~whisper.play;
);" ],
[ 1599.405545302, 'me', "(
~whisper.quant=2;
~whisper.fadeTime=2;
~whisper={
    var sig = WhiteNoise.ar(0.4!2);
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~whisper,postVol:true);
~whisper.play;
);" ],
[ 1603.88431819, 'me', "(
~whisper.quant=2;
~whisper.fadeTime=2;
~whisper={
    var sig = WhiteNoise.ar(0.5!2);
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~whisper,postVol:true);
~whisper.play;
);" ],
[ 1605.231944288, 'me', "(
~whisper.quant=2;
~whisper.fadeTime=2;
~whisper={
    var sig = WhiteNoise.ar(0.2!2);
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~whisper,postVol:true);
~whisper.play;
);" ],
[ 1615.22383144, 'me', "(
~whisper.quant=2;
~whisper.fadeTime=2;
~whisper={
    var sig = WhiteNoise.ar(0.5!2);
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~whisper,postVol:true);
~whisper.play;
);" ],
[ 1625.317721334, 'me', "~whisper.stop(7);" ],
[ 1823.786147274, 'me', "~tome.stop(7);" ],
[ 1880.522547251, 'me', "~tome.stop(7);" ],
[ 2080.503539553, 'me', "~tome.stop(7);" ],
];