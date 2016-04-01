// History, as it was on Thu Jun 11 02:12:11 2015.

[
[ 0, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = SinOsc.ar(1500*LFSaw.ar(1/4/[1,2]).exprange(0.001,1));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.015);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 8.022383916, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = SinOsc.ar(15000*LFSaw.ar(1/4/[1,2]).exprange(0.001,1));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.015);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 12.544382282, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = SinOsc.ar(15000*LFSaw.ar(1/4/[1,2]).exprange(0.001,1));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 19.616440725, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = SinOsc.ar(15000*LFSaw.ar(1/4/[1,2]).exprange(0.001,1));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 25.036123699, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = SinOsc.ar(15000*LFSaw.ar(1/16/[1,2]).exprange(0.001,1));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 28.791923583, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = SinOsc.ar(15000*LFSaw.ar(1/32/[1,2]).exprange(0.001,1));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 32.855843812, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = SinOsc.ar(15000*LFSaw.ar(1/640/[1,2]).exprange(0.001,1));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 49.844794402, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = SinOsc.ar(15000*LFSaw.ar(1/640/[1,2]).exprange(0.001,1));
  sig = sig;
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 98.98600106, 'me', "(
~one.quant=2;
~one.fadeTime=9;
~one={
  var sig = LFSaw.ar(15000*LFSaw.ar(1/640/[1,2]).exprange(0.001,1)+(1..8));
  sig = sig;
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 107.308673884, 'me', "(
~one.quant=2;
~one.fadeTime=9;
~one={
  var sig = LFSaw.ar(15x000*LFSaw.ar(1/640/[1,2]).exprange(0.001,1)+(1..8));
  sig = sig;
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 110.889935153, 'me', "(
~one.quant=2;
~one.fadeTime=9;
~one={
  var sig = LFSaw.ar(1500*LFSaw.ar(1/640/[1,2]).exprange(0.001,1)+(1..8));
  sig = sig;
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 122.182824443, 'me', "(
~one.quant=2;
~one.fadeTime=9;
~one={
  var sig = LFSaw.ar(150*LFSaw.ar(1/640/[1,2]).exprange(0.001,1)+(1..8));
  sig = sig;
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 142.967404008, 'me', "(
~one.quant=2;
~one.fadeTime=9;
~one={
  var sig = LFSaw.ar(150*LFSaw.ar(1/640/[1,2]).exprange(0.001,1)+(1..8));
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)/4),1);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 160.69661537, 'me', "(
~one.quant=2;
~one.fadeTime=9;
~one={
  var sig = LFSaw.ar(15000*LFSaw.ar(1/640/[1,2]).exprange(0.001,1)+(1..8));
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)/4),1);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 175.343375519, 'me', "(
~one.quant=2;
~one.fadeTime=9;
~one={
  var sig = LFSaw.ar(150*LFSaw.ar(1/640/[1,2]).exprange(0.001,1)+(1..8));
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)/4),1);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 186.715384093, 'me', "(
~one.quant=2;
~one.fadeTime=9;
~one={
  var sig = LFSaw.ar(432*LFSaw.ar(1/640/[1,2]).exprange(0.001,1)+(1..8));
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)/4),1);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 192.904980737, 'me', "(
~one.quant=2;
~one.fadeTime=9;
~one={
  var sig = SinOsc.ar(432*LFSaw.ar(1/640/[1,2]).exprange(0.001,1)+(1..8));
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)/4),1);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 211.32683259, 'me', "(
~one.quant=2;
~one.fadeTime=9;
~one={
  var sig = SinOsc.ar(432*[1,2,1.5,1.25]);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)/4),1);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 244.13331336, 'me', "(
~one.quant=2;
~one.fadeTime=9;
~one={
  var sig = SinOsc.ar(432*[1,2,1.5,1.25]*1.5);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)/4),1);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 276.875701013, 'me', "(
~one.quant=2;
~one.fadeTime=9;
~one={
  var sig = SinOsc.ar(432*[1,2,1.5,1.25]*1.5);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)/4),1);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 285.717277741, 'me', "(
~one.quant=2;
~one.fadeTime=9;
~one={
  var sig = SinOsc.ar(4320*[1,2,1.5,1.25]*1.5);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)/4),1);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 300.054667333, 'me', "(
~one.quant=2;
~one.fadeTime=9;
~one={
  var sig = SinOsc.ar(4320*[1,2,1.5,1.25]*1.5);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)/4),0.5);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 305.608829687, 'me', "(
~one.quant=2;
~one.fadeTime=9;
~one={
  var sig = SinOsc.ar(432*[1,2,1.5,1.25]*1.5);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)/4),0.5);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 317.381552993, 'me', "(
~one.quant=2;
~one.fadeTime=9;
~one={
  var sig = SinOsc.ar(432*[1,2,1.5,1.25]*1.5);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)/4),0.5);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 323.269031684, 'me', "(
~one.quant=2;
~one.fadeTime=9;
~one={
  var sig = SinOsc.ar(432*[1,2,1.5,1.25]*1.5);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)/4),0.25);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 333.787889122, 'me', "(
~one.quant=2;
~one.fadeTime=9;
~one={
  var sig = SinOsc.ar(432*[1,2,1.5,1.25,1,1,1,1]*1.5);
  sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 343.71405729, 'me', "(
~one.quant=2;
~one.fadeTime=9;
~one={
  var sig = SinOsc.ar(432*pi*[1,2,1.5,1.25,1,1,1,1]*1.5);
  sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 353.134884001, 'me', "(
~one.quant=2;
~one.fadeTime=9;
~one={
  var sig = SinOsc.ar(432*pi*[1,2,1.5,1.25,1,1,1,1]*1.25);
  sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 380.5748028, 'me', "(
~one.quant=2;
~one.fadeTime=9;
~one={
  var sig = SinOsc.ar(432*pi*[1,2,1.5,1.25,1,1,1,1]*1.5);
  sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 480.632623757, 'me', "(
~one.quant=2;
~one.fadeTime=9;
~one={
  var sig = SinOsc.ar(4320*pi*[1,2,1.5,1.25,1,1,1,1]*1.5) ++ WhiteNoise.ar(0.1!2);
  sig = SelectX.ar(LFSaw.ar(1/4).exprange(0.001,sig.size),sig);
  sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 497.138495938, 'me', "(
~one.quant=2;
~one.fadeTime=9;
~one={
  var sig = SinOsc.ar(4320*pi*[1,2,1.5,1.25,1,1,1,1]*1.5) ++ WhiteNoise.ar(0.3!2);
  sig = SelectX.ar(LFSaw.ar(1/4).exprange(0.001,sig.size+0.1),sig);
  sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 503.422613357, 'me', "(
~one.quant=2;
~one.fadeTime=9;
~one={
  var sig = SinOsc.ar(4320*pi*[1,2,1.5,1.25,1,1,1,1]*1.5) ++ WhiteNoise.ar(0.4!2);
  sig = SelectX.ar(LFSaw.ar(1/4).exprange(0.001,sig.size+0.1),sig);
  sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 506.660873357, 'me', "(
~one.quant=2;
~one.fadeTime=9;
~one={
  var sig = SinOsc.ar(4320*pi*[1,2,1.5,1.25,1,1,1,1]*1.5) ++ WhiteNoise.ar(0.7!2);
  sig = SelectX.ar(LFSaw.ar(1/4).exprange(0.001,sig.size+0.1),sig);
  sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 511.197852302, 'me', "(
~one.quant=2;
~one.fadeTime=9;
~one={
  var sig = SinOsc.ar(4320*pi*[1,2,1.5,1.25,1,1,1,1]*1.5) ++ WhiteNoise.ar(0.7!2);
  sig = SelectX.ar(LFSaw.ar(1/4).exprange(0.001,sig.size+1),sig);
  sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 514.358750153, 'me', "(
~one.quant=2;
~one.fadeTime=9;
~one={
  var sig = SinOsc.ar(4320*pi*[1,2,1.5,1.25,1,1,1,1]*1.5) ++ WhiteNoise.ar(0.7!2);
  sig = SelectX.ar(LFSaw.ar(1/4).range(0.001,sig.size+1),sig);
  sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 531.203159833, 'me', "(
~one.quant=2;
~one.fadeTime=9;
~one={
  var sig = SinOsc.ar(4320*pi*[1,2,1.5,1.25,1,1,1,1]*1.25) ++ WhiteNoise.ar(0.7!2);
  sig = SelectX.ar(LFSaw.ar(1/4).range(0.001,sig.size+1),sig);
  sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 589.95507428, 'me', "(
~one.quant=2;
~one.fadeTime=9;
~one={
  var sig = SinOsc.ar(4320*pi*[1,2,1.5,1.25,1,1,1,1]*1.5) ++ WhiteNoise.ar(0.7!2);
  sig = SelectX.ar(LFSaw.ar(1/4).range(0.001,sig.size+1),sig);
  sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 594.173064232, 'me', "(
~one.quant=2;
~one.fadeTime=9;
~one={
  var sig = SinOsc.ar(4320*pi*[1,2,1.5,1.25,1,1,1,1]*2) ++ WhiteNoise.ar(0.7!2);
  sig = SelectX.ar(LFSaw.ar(1/4).range(0.001,sig.size+1),sig);
  sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 619.420228323, 'me', "(
~one.quant=2;
~one.fadeTime=9;
~one={
  var sig = SinOsc.ar(4320/(pi*[1,2,1.5,1.25,1,1,1,1])*2) ++ WhiteNoise.ar(0.7!2);
  sig = SelectX.ar(LFSaw.ar(1/4).range(0.001,sig.size+1),sig);
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 635.393102201, 'me', "(
~one.quant=2;
~one.fadeTime=9;
~one={
  var sig = SinOsc.ar(4320/(pi*[1,2,1.5,1.25,1,1,1,1])*1.5) ++ WhiteNoise.ar(0.7!2);
  sig = SelectX.ar(LFSaw.ar(1/4).range(0.001,sig.size+1),sig);
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 643.657387334, 'me', "(
~one.quant=2;
~one.fadeTime=9;
~one={
  var sig = SinOsc.ar(4320/(pi*[1,2,1.5,1.25,1,1,1,1])*1.25) ++ WhiteNoise.ar(0.7!2);
  sig = SelectX.ar(LFSaw.ar(1/4).range(0.001,sig.size+1),sig);
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 646.300681148, 'me', "(
~one.quant=2;
~one.fadeTime=9;
~one={
  var sig = SinOsc.ar(432/(pi*[1,2,1.5,1.25,1,1,1,1])*1.25) ++ WhiteNoise.ar(0.7!2);
  sig = SelectX.ar(LFSaw.ar(1/4).range(0.001,sig.size+1),sig);
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 664.221074948, 'me', "(
~one.quant=2;
~one.fadeTime=9;
~one={
  var sig = SinOsc.ar(432/(pi*[1,2,1.5,1.25,1,1,1,1])*1.25) ++ HPF.ar(WhiteNoise.ar(0.7!2),1200);
  sig = SelectX.ar(LFSaw.ar(1/4).range(0.001,sig.size+1),sig);
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 675.277306445, 'me', "(
~one.quant=2;
~one.fadeTime=9;
~one={
  var sig = SinOsc.ar(432/(pi*[1,2,1.5,1.25,1,1,1,1])*4) ++ HPF.ar(WhiteNoise.ar(0.7!2),12000);
  sig = SelectX.ar(LFSaw.ar(1/4).range(0.001,sig.size+1),sig);
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 679.650209062, 'me', "(
~one.quant=2;
~one.fadeTime=9;
~one={
  var sig = SinOsc.ar(4320/(pi*[1,2,1.5,1.25,1,1,1,1])*4) ++ HPF.ar(WhiteNoise.ar(0.7!2),12000);
  sig = SelectX.ar(LFSaw.ar(1/4).range(0.001,sig.size+1),sig);
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 688.417427379, 'me', "(
~one.quant=2;
~one.fadeTime=9;
~one={
  var sig = SinOsc.ar(4320/2/(pi*[1,2,1.5,1.25,1,1,1,1])*4) ++ HPF.ar(WhiteNoise.ar(0.7!2),12000);
  sig = SelectX.ar(LFSaw.ar(1/4).range(0.001,sig.size+1),sig);
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 691.394290715, 'me', "(
~one.quant=2;
~one.fadeTime=9;
~one={
  var sig = SinOsc.ar(4320/1.5/(pi*[1,2,1.5,1.25,1,1,1,1])*4) ++ HPF.ar(WhiteNoise.ar(0.7!2),12000);
  sig = SelectX.ar(LFSaw.ar(1/4).range(0.001,sig.size+1),sig);
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 693.407798173, 'me', "(
~one.quant=2;
~one.fadeTime=9;
~one={
  var sig = SinOsc.ar(4320/1.25/(pi*[1,2,1.5,1.25,1,1,1,1])*4) ++ HPF.ar(WhiteNoise.ar(0.7!2),12000);
  sig = SelectX.ar(LFSaw.ar(1/4).range(0.001,sig.size+1),sig);
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 695.287229508, 'me', "(
~one.quant=2;
~one.fadeTime=9;
~one={
  var sig = SinOsc.ar(4320/1.125/(pi*[1,2,1.5,1.25,1,1,1,1])*4) ++ HPF.ar(WhiteNoise.ar(0.7!2),12000);
  sig = SelectX.ar(LFSaw.ar(1/4).range(0.001,sig.size+1),sig);
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 701.73934504, 'me', "(
~one.quant=2;
~one.fadeTime=9;
~one={
  var sig = SinOsc.ar(4320/1.125/(2pi*[1,2,1.5,1.25,1,1,1,1])*4) ++ HPF.ar(WhiteNoise.ar(0.7!2),12000);
  sig = SelectX.ar(LFSaw.ar(1/4).range(0.001,sig.size+1),sig);
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 706.196163407, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320/1.125/(2pi*[1,2,1.5,1.25,1,1,1,1])*4) ++ HPF.ar(WhiteNoise.ar(0.7!2),12000);
  sig = SelectX.ar(LFSaw.ar(1/4).range(0.001,sig.size+1),sig);
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 710.204851967, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320/1.125/(1.5pi*[1,2,1.5,1.25,1,1,1,1])*4) ++ HPF.ar(WhiteNoise.ar(0.7!2),12000);
  sig = SelectX.ar(LFSaw.ar(1/4).range(0.001,sig.size+1),sig);
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 713.128880603, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320/1.125/(1.25pi*[1,2,1.5,1.25,1,1,1,1])*4) ++ HPF.ar(WhiteNoise.ar(0.7!2),12000);
  sig = SelectX.ar(LFSaw.ar(1/4).range(0.001,sig.size+1),sig);
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 717.86184712, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320/1.125/(1.25pi*[1,2,1.5,1.25,1,1,1,1])*2) ++ HPF.ar(WhiteNoise.ar(0.7!2),12000);
  sig = SelectX.ar(LFSaw.ar(1/4).range(0.001,sig.size+1),sig);
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 725.865158452, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320/1.125/(1.25pi*[1,2,1.5,1.25,1,1,1,1])*2) ++ HPF.ar(WhiteNoise.ar(0.7!2),12000);
  sig = SelectX.ar(LFSaw.ar(1/4/fib(7)).range(0.001,sig.size+1),sig);
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 727.461149397, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320/1.125/(1.25pi*[1,2,1.5,1.25,1,1,1,1])*2) ++ HPF.ar(WhiteNoise.ar(0.7!2),12000);
  sig = SelectX.ar(LFSaw.ar(1/4/fib(8)).range(0.001,sig.size+1),sig);
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 735.744778223, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320/1.125/(1.25pi*[1,2,1.5,1.25,1,1,1,1])*2) ++ HPF.ar(WhiteNoise.ar(0.7!2),12000);
  sig = SelectX.ar(LFSaw.ar(1/4/fib(8)).range(0.001,sig.size+1),sig);
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 743.056710907, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320/1.125/(1.25pi*[1,2,1.5,1.25,1,1,1,1])*2) ++ HPF.ar(WhiteNoise.ar(0.7!2),12000);
  sig = SelectX.ar(LFSaw.ar(1/4/fib(8)).range(0.001,sig.size+1),sig);
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 753.111043776, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320/1.125/(1.25pi*[1,2,1.5,1.25,1,1,1,1])*2,mul:0.2) ++ HPF.ar(WhiteNoise.ar(0.7!2),12000);
  sig = SelectX.ar(LFSaw.ar(1/4/fib(8)).range(0.001,sig.size+1),sig);
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 761.81451307, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320/1.125/(1.25pi*[1,2,1.5,1.25,1,1,1,1])*2,mul:0.2) ++ HPF.ar(WhiteNoise.ar(0.7!2),12000);
  sig = SelectX.ar(LFSaw.ar(1/4/fib(8)).range(0.001,sig.size+1),sig);
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,0.1,0,4);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 767.700518677, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320/1.5/(1.25pi*[1,2,1.5,1.25,1,1,1,1])*2,mul:0.2) ++ HPF.ar(WhiteNoise.ar(0.7!2),12000);
  sig = SelectX.ar(LFSaw.ar(1/4/fib(8)).range(0.001,sig.size+1),sig);
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,0.1,0,4);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 774.693439313, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(432*1.5/(1.25pi*[1,2,1.5,1.25,1,1,1,1])*2,mul:0.2) ++ HPF.ar(WhiteNoise.ar(0.7!2),12000);
  sig = SelectX.ar(LFSaw.ar(1/4/fib(8)).range(0.001,sig.size+1),sig);
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,0.1,0,4);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 812.406132185, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.5/(1.25pi*[1,2,1.5,1.25,1,1,1,1])*2,mul:0.2) ++ HPF.ar(WhiteNoise.ar(0.7!2),12000);
  sig = SelectX.ar(LFSaw.ar(1/4/fib(8)).range(0.001,sig.size+1),sig);
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,0.1,0,4);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 829.034497002, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.25/(1.25pi*[1,2,1.5,1.25,1,1,1,1])*2,mul:0.2) ++ HPF.ar(WhiteNoise.ar(0.7!2),12000);
  sig = SelectX.ar(LFSaw.ar(1/4/fib(8)).range(0.001,sig.size+1),sig);
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,0.1,0,4);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 833.268244555, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.25/(1.5pi*[1,2,1.5,1.25,1,1,1,1])*2,mul:0.2) ++ HPF.ar(WhiteNoise.ar(0.7!2),12000);
  sig = SelectX.ar(LFSaw.ar(1/4/fib(8)).range(0.001,sig.size+1),sig);
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,0.1,0,4);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 839.17399357, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.25/(1.5pi*[1,2,1.5,1.25,1,1,1,1])*2,mul:0.4) ++ HPF.ar(WhiteNoise.ar(0.7!2),12000);
  sig = SelectX.ar(LFSaw.ar(1/4/fib(8)).range(0.001,sig.size+1),sig);
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,0.1,0,4);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 846.60949336, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.25/(1.5pi*[1,2,1.5,1.25,1,1,1,1])*2,mul:0.4) ++ HPF.ar(WhiteNoise.ar(0.7!2),1200);
  sig = SelectX.ar(LFSaw.ar(1/4/fib(8)).range(0.001,sig.size+1),sig);
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,0.1,0,4);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 863.660654484, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.25/(1.5pi*[1,2,1.5,1.25,1,1,1,1])*2,mul:0.4) ++ HPF.ar(WhiteNoise.ar(0.7!2),LFSaw.ar(1/4).exprange(10.001,1000));
  sig = SelectX.ar(LFSaw.ar(1/4/fib(8)).range(0.001,sig.size+1),sig);
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,0.1,0,4);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 866.662601464, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.25/(1.5pi*[1,2,1.5,1.25,1,1,1,1])*2,mul:0.4) ++ HPF.ar(WhiteNoise.ar(0.7!2),LFSaw.ar(1/4).exprange(10.001,10000));
  sig = SelectX.ar(LFSaw.ar(1/4/fib(8)).range(0.001,sig.size+1),sig);
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,0.1,0,4);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 869.47289708, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.25/(1.5pi*[1,2,1.5,1.25,1,1,1,1])*2,mul:0.4) ++ HPF.ar(WhiteNoise.ar(0.7!2),LFSaw.ar(4).exprange(10.001,10000));
  sig = SelectX.ar(LFSaw.ar(1/4/fib(8)).range(0.001,sig.size+1),sig);
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,0.1,0,4);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 882.397798682, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.25/(1.5pi*[1,2,1.5,1.25,1,1,1,1])*2,mul:0.5) ++ HPF.ar(WhiteNoise.ar(0.7!2),LFSaw.ar(4).exprange(10.001,10000));
  sig = SelectX.ar(LFSaw.ar(1/4/fib(8)).range(0.001,sig.size+1),sig);
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,0.1,0,4);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 885.981998191, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.25/(1.25pi*[1,2,1.5,1.25,1,1,1,1])*2,mul:0.5) ++ HPF.ar(WhiteNoise.ar(0.7!2),LFSaw.ar(4).exprange(10.001,10000));
  sig = SelectX.ar(LFSaw.ar(1/4/fib(8)).range(0.001,sig.size+1),sig);
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,0.1,0,4);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 887.5721341, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.5/(1.25pi*[1,2,1.5,1.25,1,1,1,1])*2,mul:0.5) ++ HPF.ar(WhiteNoise.ar(0.7!2),LFSaw.ar(4).exprange(10.001,10000));
  sig = SelectX.ar(LFSaw.ar(1/4/fib(8)).range(0.001,sig.size+1),sig);
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,0.1,0,4);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 889.383198391, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(432*1.5/(1.25pi*[1,2,1.5,1.25,1,1,1,1])*2,mul:0.5) ++ HPF.ar(WhiteNoise.ar(0.7!2),LFSaw.ar(4).exprange(10.001,10000));
  sig = SelectX.ar(LFSaw.ar(1/4/fib(8)).range(0.001,sig.size+1),sig);
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,0.1,0,4);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 893.938860817, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(432*1.5/(1.25pi*[1,2,1.5,1.25,1,1,1,1])*2,mul:0.75) ++ HPF.ar(WhiteNoise.ar(0.7!2),LFSaw.ar(4).exprange(10.001,10000));
  sig = SelectX.ar(LFSaw.ar(1/4/fib(8)).range(0.001,sig.size+1),sig);
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,0.1,0,4);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 904.317188787, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(432*1.5/(1.25pi*[1,2,1.5,1.25,1,1,1,1])*2,mul:0.75) ++ HPF.ar(WhiteNoise.ar(0.7!2),LFSaw.ar(4).exprange(100.001,12000));
  sig = SelectX.ar(LFSaw.ar(1/4/fib(8)).range(0.001,sig.size+1),sig);
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,0.1,0,4);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 913.201541583, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(432*1.5/(1.25pi*[1,2,1.5,1.25,1,1,1,1])*2,mul:0.75) ++ HPF.ar(WhiteNoise.ar(0.7!2),LFSaw.ar(4).exprange(100.001,12000));
  sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,0.1,0,4);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 927.588391812, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(432*1.5/(1.25pi*[1,2,1.5,1.25,1,1,1,1])*2,mul:0.75) ++ HPF.ar(WhiteNoise.ar(0.7!2),LFSaw.ar(4).exprange(100.001,12000));
  sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 985.864691628, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(432*1.5/(1.25pi*[1,2,1.5,1.25,1,1,1,1])*2,mul:0.75) ++ HPF.ar(WhiteNoise.ar(0.7!2),LFSaw.ar(4).exprange(100.001,12000));
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  sig = sig * Pulse.ar(4/fib(8));
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 998.655309215, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(432*1.5/(1.25pi*[1,2,1.5,1.25,1,1,1,1])*2,mul:0.75) ++ HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(4).exprange(100.001,12000));
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  sig = sig * Pulse.ar(4/fib(8));
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1002.640994495, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.5/(1.25pi*[1,2,1.5,1.25,1,1,1,1])*2,mul:0.75) ++ HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(4).exprange(100.001,12000));
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  sig = sig * Pulse.ar(4/fib(8));
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1011.887972131, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.25/(1.25pi*[1,2,1.5,1.25,1,1,1,1])*2,mul:0.75) ++ HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(4).exprange(100.001,12000));
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  sig = sig * Pulse.ar(4/fib(8));
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1017.219772389, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.5/(1.25pi*[1,2,1.5,1.25,1,1,1,1])*2,mul:0.75) ++ HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(4).exprange(100.001,12000));
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  sig = sig * Pulse.ar(4/fib(8));
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1019.783813243, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.5/(1.5pi*[1,2,1.5,1.25,1,1,1,1])*2,mul:0.75) ++ HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(4).exprange(100.001,12000));
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  sig = sig * Pulse.ar(4/fib(8));
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1023.678344228, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.5/(1.5pi*[1,2,1.5,1.25,1,1,1,1]),mul:0.75) ++ HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(4).exprange(100.001,12000));
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  sig = sig * Pulse.ar(4/fib(8));
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1030.612556756, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.5/(1.5pi*[1,2,1.5,1.25,1,1,1,1]),mul:0.75) ++ HPF.ar(WhiteNoise.ar(0.2!2),LFSaw.ar(4).exprange(100.001,12000));
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  sig = sig * Pulse.ar(4/fib(8));
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0,4);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1047.411976255, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.5/(1.5pi*[1,2,1.5,1.25,1,1,1,1]),mul:0.75) ++ HPF.ar(WhiteNoise.ar(0.2!2),LFSaw.ar(4).exprange(100.001,12000));
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  sig = sig * Pulse.ar(4/fib(8));
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,0.1,0.1,1);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1057.253380538, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.5/(1.5pi*[1,2,1.5,1.25,1,1,1,1]),mul:0.75) ++ HPF.ar(WhiteNoise.ar(0.2!2),LFSaw.ar(4).exprange(100.001,12000));
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  sig = sig * Pulse.ar(4/fib(8));
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  //sig = Greyhole.ar(sig,0.1,0.1,1);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1067.085176533, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.25/(1.5pi*[1,2,1.5,1.25,1,1,1,1]),mul:0.75) ++ HPF.ar(WhiteNoise.ar(0.2!2),LFSaw.ar(4).exprange(100.001,12000));
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  sig = sig * Pulse.ar(4/fib(8));
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  //sig = Greyhole.ar(sig,0.1,0.1,1);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1070.826494949, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.5/(1.5pi*[1,2,1.5,1.25,1,1,1,1]),mul:0.75) ++ HPF.ar(WhiteNoise.ar(0.2!2),LFSaw.ar(4).exprange(100.001,12000));
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  sig = sig * Pulse.ar(4/fib(8));
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  //sig = Greyhole.ar(sig,0.1,0.1,1);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1075.215955034, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.25/(1.5pi*[1,2,1.5,1.25,1,1,1,1]),mul:0.75) ++ HPF.ar(WhiteNoise.ar(0.2!2),LFSaw.ar(4).exprange(100.001,12000));
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  sig = sig * Pulse.ar(4/fib(8));
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  //sig = Greyhole.ar(sig,0.1,0.1,1);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1078.475225967, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.5/(1.5pi*[1,2,1.5,1.25,1,1,1,1]),mul:0.75) ++ HPF.ar(WhiteNoise.ar(0.2!2),LFSaw.ar(4).exprange(100.001,12000));
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  sig = sig * Pulse.ar(4/fib(8));
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  //sig = Greyhole.ar(sig,0.1,0.1,1);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1080.079878092, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.5/(1.25pi*[1,2,1.5,1.25,1,1,1,1]),mul:0.75) ++ HPF.ar(WhiteNoise.ar(0.2!2),LFSaw.ar(4).exprange(100.001,12000));
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  sig = sig * Pulse.ar(4/fib(8));
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  //sig = Greyhole.ar(sig,0.1,0.1,1);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1086.012566978, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.5/(1.25pi*[1,2,1.5,1.25,1,1,1,1]),mul:0.75) ++ HPF.ar(WhiteNoise.ar(0.2!2),LFSaw.ar(4).exprange(100.001,12000));
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  sig = sig * Pulse.ar(1/4/fib(8));
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  //sig = Greyhole.ar(sig,0.1,0.1,1);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1098.399741542, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.5/(1.25pi*[1,2,1.5,1.25,1,1,1,1]),mul:0.75) ++ HPF.ar(WhiteNoise.ar(0.2!2),LFSaw.ar(4).exprange(100.001,12000));
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  sig = sig * Pulse.ar(1/4/fib(8));
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,0.1,0.1,1);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1107.824935548, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.5/(1.25pi*[1,2,1.5,1.25,1,1,1,1]),mul:0.75) ++ HPF.ar(WhiteNoise.ar(0.2!2),LFSaw.ar(4).exprange(100.001,12000));
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  sig = sig * Pulse.ar(1/4/fib(8));
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,1,0.1,1);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1112.543820415, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.5/(1.25pi*[1,2,1.5,1.25,1,1,1,1]),mul:0.75) ++ HPF.ar(WhiteNoise.ar(0.2!2),LFSaw.ar(4).exprange(100.001,12000));
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  sig = sig * Pulse.ar(1/4/fib(8));
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,1,0.1,8);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1117.015701479, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.5/(1.25pi*[1,2,1.5,1.25,1,1,1,1]),mul:0.75) ++ HPF.ar(WhiteNoise.ar(0.2!2),LFSaw.ar(4).exprange(100.001,12000));
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  sig = sig * Pulse.ar(1/4/fib(8));
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,4,0.1,8);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1123.37486098, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.5/(1.25pi*[1,2,1.5,1.25,1,1,1,1]),mul:0.75) ++ HPF.ar(WhiteNoise.ar(0.2!2),LFSaw.ar(4).exprange(100.001,12000));
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  sig = sig * Pulse.ar(1/4/fib(8));
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  //sig = Greyhole.ar(sig,4,0.1,8);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1136.360187978, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.5/(1.25pi*[1,2,1.5,1.25,1,1,1,1]),mul:0.75) ++ HPF.ar(WhiteNoise.ar(0.2!2),LFSaw.ar(4).exprange(100.001,12000));
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  sig = sig * Pulse.ar(1/8/fib(8));
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  //sig = Greyhole.ar(sig,4,0.1,8);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1150.322014226, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.5/(1.25pi*[1,2,1.5,1.25,1,1,1,1]),mul:0.75) ++ HPF.ar(WhiteNoise.ar(0.2!2),LFSaw.ar(4).exprange(100.001,12000));
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  //sig = Greyhole.ar(sig,4,0.1,8);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1155.04709511, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.5/(1.25pi*[1,2,1.5,1.25,1,1,1,1]),mul:0.75) ++ HPF.ar(WhiteNoise.ar(0.2!2),LFSaw.ar(4).exprange(100.001,12000));
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  //sig = Greyhole.ar(sig,4,0.1,8);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1160.636117737, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.5/(1.25pi*[1,2,1.5,1.25,1,1,1,1]),mul:0.75) ++ HPF.ar(WhiteNoise.ar(0.2!2),LFSaw.ar(4).exprange(100.001,12000));
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  //sig = Greyhole.ar(sig,4,0.1,8);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1163.914590739, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.5/(1.25pi*[1,2,1.5,1.25,1,1,1,1]),mul:0.75) ++ HPF.ar(WhiteNoise.ar(0.2!2),LFSaw.ar(4).exprange(100.001,12000));
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,4,0.1,8);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1191.188837718, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.5/(1.25pi*[1,2,1.5,1.25,1,1,1,1]),mul:0.75) ++ HPF.ar(WhiteNoise.ar(0.2!2),LFSaw.ar(4).exprange(100.001,12000));
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,4,0.1,8);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1199.809482252, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(432*1.5/(1.25pi*[1,2,1.5,1.25,1,1,1,1]),mul:0.75) ++ HPF.ar(WhiteNoise.ar(0.2!2),LFSaw.ar(4).exprange(100.001,12000));
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,4,0.1,8);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1205.874659025, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(432*1.25/(1.25pi*[1,2,1.5,1.25,1,1,1,1]),mul:0.75) ++ HPF.ar(WhiteNoise.ar(0.2!2),LFSaw.ar(4).exprange(100.001,12000));
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,4,0.1,8);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1218.921335116, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(432*1.25/(1.25pi*[1,2,1.5,1.25,1,1,1,1]),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,4,0.1,8);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1229.710670163, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.25/(1.25pi*[1,2,1.5,1.25,1,1,1,1]),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,4,0.1,8);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1235.228202114, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.5/(1.25pi*[1,2,1.5,1.25,1,1,1,1]),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,4,0.1,8);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1240.968432157, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.5/(1.25pi*[1,2,1.5,1.25,1,1,1,1]),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,4,0.01,8);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1248.267083772, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.25/(1.25pi*[1,2,1.5,1.25,1,1,1,1]),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,4,0.01,8);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1252.408529178, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.25/(1.5pi*[1,2,1.5,1.25,1,1,1,1]),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,4,0.01,8);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1255.176741131, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.25/(1.5pi*[1,2,1.25,1.25,1,1,1,1]),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,4,0.01,8);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1258.597610018, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.25/(1.5pi*[1,2,1.25,1.5,1,1,1,1]),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,4,0.01,8);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1261.193766216, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.25/(1.5pi*[1,4,1.25,1.5,1,1,1,1]),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,4,0.01,8);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1264.196117264, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.25/(1.5pi*[1,0.5,1.25,1.5,1,1,1,1]),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,4,0.01,8);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1266.516054455, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.25/(1.5pi*[1,0.5,0.25,1.5,1,1,1,1]),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,4,0.01,8);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1270.628488337, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.25/(1.5pi*[1,0.5,0.25,0.5,1,1,1,1]),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,4,0.01,8);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1275.885548725, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.5/(1.5pi*[1,0.5,0.25,0.5,1,1,1,1]),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,4,0.01,8);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1281.309379986, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.25/(1.5pi*[1,0.5,0.25,0.5,1,1,1,1]),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,4,0.01,8);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1286.56283281, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*0.25/(1.5pi*[1,0.5,0.25,0.5,1,1,1,1]),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,4,0.01,8);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1301.779646646, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*0.25/(1.5pi*[1,0.5,0.25,0.5,1,1,1,1]),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0.01,8);
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1315.715118039, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.25/(1.5pi*[1,0.5,0.25,0.5,1,1,1,1]),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0.01,8);
  Splay.ar(sig.flat,0.25,0.1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1318.269169236, 'me', "thisProcess.stop;" ],
[ 1318.968197548, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.25/(1.5pi*[1,0.5,0.25,0.5,1,1,1,1]),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0.01,8);
  Splay.ar(sig.flat,0.25,0.1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1337.984917037, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.25/(1.25pi*[1,0.5,0.25,0.5,1,1,1,1]),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0.01,8);
  Splay.ar(sig.flat,0.25,0.1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1344.750836084, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.25/(1.125pi*[1,0.5,0.25,0.5,1,1,1,1]),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0.01,8);
  Splay.ar(sig.flat,0.25,0.1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1354.031113651, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.25/(1.125pi*[1,1.5,0.25,0.5,1,1,1,1]),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0.01,8);
  Splay.ar(sig.flat,0.25,0.1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1356.859298247, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.25/(1.125pi*[1,1.5,1.25,0.5,1,1,1,1]),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0.01,8);
  Splay.ar(sig.flat,0.25,0.1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1365.501024961, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.25/(1.125pi*[1,1.5,1.125,0.5,1,1,1,1]),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0.01,8);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1389.420050079, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.25/(1.125pi*[1,1.5,1.125,0.5,1,1,1,1]) + SinOsc.ar(11).range(-10,10),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0.01,8);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1405.61536555, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.25/(1.125pi*[1,1.5,1.125,0.5,1,1,1,1]) + SinOsc.ar(11).range(-10,10),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0.01,8);
  sig = GVerb.ar(sig,100);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1413.641012898, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.25/(1.125pi*[1,1.5,1.125,0.5,1,1,1,1]) + SinOsc.ar(11).range(-10,10),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0.01,8);
  sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1416.256370092, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(432*1.25/(1.125pi*[1,1.5,1.125,0.5,1,1,1,1]) + SinOsc.ar(11).range(-10,10),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0.01,8);
  sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1423.4706462, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.25/(1.125pi*[1,1.5,1.125,0.5,1,1,1,1]) + SinOsc.ar(11).range(-10,10),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0.01,8);
  sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1426.065892797, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320/2*1.25/(1.125pi*[1,1.5,1.125,0.5,1,1,1,1]) + SinOsc.ar(11).range(-10,10),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0.01,8);
  sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1428.946823798, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320/1.5*1.25/(1.125pi*[1,1.5,1.125,0.5,1,1,1,1]) + SinOsc.ar(11).range(-10,10),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0.01,8);
  sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1432.093888396, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320/1.25*1.25/(1.125pi*[1,1.5,1.125,0.5,1,1,1,1]) + SinOsc.ar(11).range(-10,10),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0.01,8);
  sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1437.271507464, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320/1.75*1.25/(1.125pi*[1,1.5,1.125,0.5,1,1,1,1]) + SinOsc.ar(11).range(-10,10),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0.01,8);
  sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1440.286399242, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320/1.75*1.25/(1.125pi*[1,1.5,1.125,0.5,1,1,1,1]) + SinOsc.ar(11).range(-10,10),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0.01,8);
  sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1448.871481068, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320/4*1.25/(1.125pi*[1,1.5,1.125,0.5,1,1,1,1]) + SinOsc.ar(11).range(-10,10),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0.01,8);
  sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1452.920217339, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320/8*1.25/(1.125pi*[1,1.5,1.125,0.5,1,1,1,1]) + SinOsc.ar(11).range(-10,10),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0.01,8);
  sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1458.158383877, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320/4*1.25/(1.125pi*[1,1.5,1.125,0.5,1,1,1,1]) + SinOsc.ar(11).range(-10,10),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0.01,8);
  sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1461.220242064, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320/4*1.5/(1.125pi*[1,1.5,1.125,0.5,1,1,1,1]) + SinOsc.ar(11).range(-10,10),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0.01,8);
  sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1463.814789271, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320/4*1.5/(1.5pi*[1,1.5,1.125,0.5,1,1,1,1]) + SinOsc.ar(11).range(-10,10),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0.01,8);
  sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1470.777055357, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320/4*1.5/(1.5pi*[1,1.5,1.125,0.5,1,1,1,1]) + SinOsc.ar(11).range(-10,100),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0.01,8);
  sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1474.024102466, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320/4*1.5/(1.5pi*[1,1.5,1.125,0.5,1,1,1,1]) + SinOsc.ar(11).range(-10,1000),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0.01,8);
  sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1477.930056885, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320/4*1.5/(1.5pi*[1,1.5,1.125,0.5,1,1,1,1]) + SinOsc.ar(11).range(-10,10000),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0.01,8);
  sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1480.739834643, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320/4*1.5/(1.5pi*[1,1.5,1.125,0.5,1,1,1,1]) + SinOsc.ar(11).range(-10,10000),mul:0.15);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0.01,8);
  sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1486.361824214, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320/4*1.5/(1.5pi*[1,1.5,1.125,0.5,1,1,1,1]) + SinOsc.ar(11).range(-10,1000),mul:0.15);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0.01,8);
  sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1493.795682634, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320/4*1.5/(1.5pi*[1,1.5,1.125,0.5,1,1,1,1]) + SinOsc.ar(11).range(-10,100),mul:0.15);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0.01,8);
  sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1498.40198556, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320/4*1.5/(1.5pi*[1,1.5,1.125,0.5,1,1,1,1]) + SinOsc.ar(11).range(-10,100),mul:0.15);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0.01,8);
  sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1509.23837209, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320/2*1.5/(1.5pi*[1,1.5,1.125,0.5,1,1,1,1]) + SinOsc.ar(11).range(-10,100),mul:0.15);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0.01,8);
  sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1511.74688399, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320/1.5*1.5/(1.5pi*[1,1.5,1.125,0.5,1,1,1,1]) + SinOsc.ar(11).range(-10,100),mul:0.15);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0.01,8);
  sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1516.875418937, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320/1.5*1.5/(1.5pi*[1,1.5,1.125,0.5,1,1,1,1]) + SinOsc.ar(11).range(-10,100),mul:0.15);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0.01,8);
  sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1533.412693388, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320/1.5*1.5/(1.5pi*[1,1.5,1.125,0.5,1,1,1,1]) + SinOsc.ar(11).range(-10,100),mul:0.15);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0.01,8);
  sig = GVerb.ar(sig,10);
  sig = sig * Pulse.ar(4);
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1547.516782015, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320/1.5*1.5/(1.5pi*[1,1.5,1.125,0.5,1,1,1,1]) + SinOsc.ar(11).range(-10,100),mul:0.15);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0.01,8);
  sig = sig * Pulse.ar(4);
  sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1552.02612729, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320/1.5*1.5/(1.5pi*[1,1.5,1.125,0.5,1,1,1,1]) + SinOsc.ar(11).range(-10,100),mul:0.15);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = sig * Pulse.ar(4);
  sig = Greyhole.ar(sig,2,0.01,8);
  sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1558.569644952, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320/1.5*1.5/(1.5pi*[1,1.5,1.125,0.5,1,1,1,1]) + SinOsc.ar(11).range(-10,100),mul:0.15);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = sig * Pulse.ar(4);
  sig = Greyhole.ar(sig,2,0.01,8);
  //sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1567.187851873, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320/1.5*1.5/(1.5pi*[1,1.5,1.125,0.5,1,1,1,1]) + SinOsc.ar(11).range(-10,100),mul:0.15);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = sig * Pulse.ar(4);
  //sig = Greyhole.ar(sig,2,0.01,8);
  //sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1582.494657596, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320/1.5*1.5/(1.5pi*[1,1.5,1.125,0.5,1,1,1,1]) + SinOsc.ar(11).range(-10,100),mul:0.15);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = sig * Pulse.ar(4/fib(8));
  //sig = Greyhole.ar(sig,2,0.01,8);
  //sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1592.927706795, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320/1.25*1.5/(1.5pi*[1,1.5,1.125,0.5,1,1,1,1]) + SinOsc.ar(11).range(-10,100),mul:0.15);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = sig * Pulse.ar(4/fib(8));
  //sig = Greyhole.ar(sig,2,0.01,8);
  //sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1595.890456544, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320/1.25*1.25/(1.5pi*[1,1.5,1.125,0.5,1,1,1,1]) + SinOsc.ar(11).range(-10,100),mul:0.15);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = sig * Pulse.ar(4/fib(8));
  //sig = Greyhole.ar(sig,2,0.01,8);
  //sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1598.68021566, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320/1.25*1.25/(1.25pi*[1,1.5,1.125,0.5,1,1,1,1]) + SinOsc.ar(11).range(-10,100),mul:0.15);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = sig * Pulse.ar(4/fib(8));
  //sig = Greyhole.ar(sig,2,0.01,8);
  //sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1603.588611023, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320/1.25*1.25/(1.25pi*[1,1.25,1.125,0.5,1,1,1,1]) + SinOsc.ar(11).range(-10,100),mul:0.15);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = sig * Pulse.ar(4/fib(8));
  //sig = Greyhole.ar(sig,2,0.01,8);
  //sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1606.793482816, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320/1.25*1.25/(1.25pi*[1,1.25,1.5,0.5,1,1,1,1]) + SinOsc.ar(11).range(-10,100),mul:0.15);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = sig * Pulse.ar(4/fib(8));
  //sig = Greyhole.ar(sig,2,0.01,8);
  //sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1609.767166505, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320/1.25*1.25/(1.25pi*[1,1.25,1.5,0.25,1,1,1,1]) + SinOsc.ar(11).range(-10,100),mul:0.15);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = sig * Pulse.ar(4/fib(8));
  //sig = Greyhole.ar(sig,2,0.01,8);
  //sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1622.900847964, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.25/(1.125pi*[1,1.5,1.125,0.5,1,1,1,1]),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0.01,8);
  Splay.ar(sig.flat,0.25,0.1);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1635.579350693, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.25/(1.125pi*[1,1.5,1.125,0.5,1,1,1,1]),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0.01,8);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1643.985939006, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.5/(1.125pi*[1,1.5,1.125,0.5,1,1,1,1]),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0.01,8);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1649.29027161, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(432*1.5/(1.125pi*[1,1.5,1.125,0.5,1,1,1,1]),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0.01,8);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1658.412636657, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.5/(1.125pi*[1,1.5,1.125,0.5,1,1,1,1]),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0.01,8);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1661.825256236, 'me', "(
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320*1.25/(1.125pi*[1,1.5,1.125,0.5,1,1,1,1]),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0.01,8);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1665.82072693, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(4320/(1.125pi*[1,1.5,1.125,0.5,1,1,1,1]),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0.01,8);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1688.467675516, 'me', "thisProcess.stop;" ],
[ 1744.003919107, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(432*(1.125pi*[1,1.5,1.125,0.5,1,1,1,1]),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0.01,8);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1752.157265014, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(432*(1.125pi*[1,1.5,1.125,0.5,1,1,1,1]),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0.01,8);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1755.149813703, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(432*(1.125pi*[1,1.5,1.125,0.5,1,1,1,1]),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig,2,0.01,8);
  Splay.ar(sig.flat,0.25,0.125);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 1778.710564019, 'me', "(
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(432*(1.125pi*[1,1.5,1.125,0.5,1,1,1,1]),mul:0.75);
  //sig = SelectX.ar(LFSaw.ar(4).range(0.001,sig.size+1),sig);
  //sig = sig * Pulse.ar(1/8/fib(8)).softclip;
  //sig = sig * Decay.ar(Impulse.ar(1,(0..7)/8),0.25);
  sig = Greyhole.ar(sig