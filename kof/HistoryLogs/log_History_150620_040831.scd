// History, as it was on Sat Jun 20 04:08:31 2015.

[
[ 0, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar(50!2);
  sig = AllpassN.ar(sig,1,0.2,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 4.731511149, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar(50!2);
  sig = AllpassN.ar(sig,1,0.02,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 11.583568965, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar(50!2);
  sig = AllpassN.ar(sig,0.2,0.02,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 12.747018064, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar(50!2);
  sig = AllpassN.ar(sig,0.02,0.02,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 16.129134031, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar(50!2);
  sig = AllpassN.ar(sig,0.02,0.02,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 25.966599303, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar(50!2,mul:0.2);
  sig = AllpassN.ar(sig,0.02,0.02,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 44.906505944, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar(50!2,mul:0.2);
  sig = sig *EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  sig = AllpassN.ar(sig,0.02,0.02,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 51.78059453, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar(50!2,mul:0.2);
  sig = sig *EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  sig = AllpassN.ar(sig,0.25,0.25,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 77.81295312, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar([55,60,58,67].midicps,mul:0.2);
  sig = sig *EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  sig = AllpassN.ar(sig,0.25,0.25,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 88.921805932, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar([55,60,58,67].midicps/0.5pi,mul:0.2);
  sig = sig *EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  sig = AllpassN.ar(sig,0.25,0.25,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 95.529962425, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar([55,60,58,67].midicps,mul:0.2);
  sig = sig *EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  sig = AllpassN.ar(sig,0.25,0.25,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 103.283876817, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar([55,60,58,67].midicps/[1,2],mul:0.2);
  sig = sig *EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  sig = AllpassN.ar(sig,0.25,0.25,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 116.074079906, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar([55,60,58,67].midicps/[1,2],mul:0.2);
  sig = sig *EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = AllpassN.ar(sig,0.25,0.25,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 128.246178995, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar([55,60,58,67].pyramid.midicps/[1,2],mul:0.2);
  sig = sig *EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = AllpassN.ar(sig,0.25,0.25,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 140.824049697, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar([55,60,58,67].pyramid.midicps/[1,2],mul:0.2);
  sig = sig *EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  sig = AllpassN.ar(sig,0.25,0.25,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 151.27785684, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar([55,60,58,67].pyramid.midicps/[1,2],mul:0.2);
  sig = sig *EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..15)/16));
  sig = AllpassN.ar(sig,0.25,0.25,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 165.707492921, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([55,60,58,67].pyramid.midicps/[1,2],mul:0.2);
  sig = sig *EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..15)/16));
  sig = AllpassN.ar(sig,0.25,0.25,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 169.592819301, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([55,60,58,67].pyramid.midicps/[1,2],mul:0.2);
  sig = sig *EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..15)/16));
  sig = AllpassN.ar(sig,0.025,0.25,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 171.131617151, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([55,60,58,67].pyramid.midicps/[1,2],mul:0.2);
  sig = sig *EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..15)/16));
  sig = AllpassN.ar(sig,0.025,0.025,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 185.487362631, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([55,60,58,67].pyramid.midicps/[1,2],mul:0.2);
  sig = sig *EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..15)/16));
  sig = AllpassN.ar(sig,0.025,0.025,4);
  sig = GVerb.ar(sig,10)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 191.841505351, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([55,60,58,67].pyramid.midicps/[1,2],mul:0.2);
  sig = sig *EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..15)/16));
  sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = GVerb.ar(sig,10)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 203.754331809, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([55,60,58,67].pyramid.midicps/[1,1/2],mul:0.2);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..15)/16));
  sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = GVerb.ar(sig,10)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 208.601903416, 'me', "(
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([55,60,58,67].pyramid.midicps/[1,4/3],mul:0.2);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..15)/16));
  sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = GVerb.ar(sig,10)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 210.444149997, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([55,60,58,67].pyramid.midicps/[1,4/3],mul:0.2);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..15)/16));
  sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = GVerb.ar(sig,10)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 221.00477042, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([55,60,58,67].pyramid.midicps/[1,5/4],mul:0.2);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..15)/16));
  sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = GVerb.ar(sig,10)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 231.595562824, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([55,60,58,67].pyramid.midicps/[1,1/2],mul:0.2);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..15)/16));
  sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = GVerb.ar(sig,10)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 236.724307386, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([55,60,58,65].pyramid.midicps/[1,1/2],mul:0.2);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..15)/16));
  sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = GVerb.ar(sig,10)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 243.246134073, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([55,60,53,65].pyramid.midicps/[1,1/2],mul:0.2);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..15)/16));
  sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = GVerb.ar(sig,10)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 247.627650768, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([55,60,53,67].pyramid.midicps/[1,1/2],mul:0.2);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..15)/16));
  sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = GVerb.ar(sig,10)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 255.913356505, 'me', "(
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([55,60,53,67].pyramid.midicps/[1,1/2],mul:0.2);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..15)/16));
  //sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = GVerb.ar(sig,10)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 279.751046115, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([55,60,53,67].pyramid.midicps/[1,1/2],mul:LFDNoise1.ar(1/2!16)/5);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..15)/16));
  //sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = GVerb.ar(sig,10)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 281.348126467, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([55,60,53,67].pyramid.midicps/[1,1/2],mul:LFDNoise1.ar(1/2!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..15)/16));
  //sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = GVerb.ar(sig,10)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 294.615157603, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([55,60,53,67].pyramid.midicps/[1,1/2],mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..15)/16));
  //sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = GVerb.ar(sig,10)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 307.273754514, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([55,60,53,60].pyramid.midicps/[1,1/2],mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..15)/16));
  //sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = GVerb.ar(sig,10)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 311.767908083, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([58,60,53,60].pyramid.midicps/[1,1/2],mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..15)/16));
  //sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = GVerb.ar(sig,10)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 318.088751338, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([58,60,56,60].pyramid.midicps/[1,1/2],mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..15)/16));
  //sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = GVerb.ar(sig,10)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 322.341498059, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([58,60,55,60].pyramid.midicps/[1,1/2],mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..15)/16));
  //sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = GVerb.ar(sig,10)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 326.447742653, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([58,60,55,67].pyramid.midicps/[1,1/2],mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..15)/16));
  //sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = GVerb.ar(sig,10)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 337.143037824, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([58,60,55,67].midicps/[1,1/2],mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..15)/16));
  //sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = GVerb.ar(sig,10)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 349.305191986, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([58,60,55,67].midicps/[1,1/2],mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.02,0.2],[3,-3]),Impulse.ar(1/2,(0..15)/16));
  //sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = GVerb.ar(sig,10)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 351.018749256, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([58,60,55,67].midicps/[1,1/2],mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,0.2],[3,-3]),Impulse.ar(1/2,(0..15)/16));
  //sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = GVerb.ar(sig,10)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 356.580208492, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([58,60,55,67].midicps/[1,1/2],mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,0.2],[3,-3]),Impulse.ar(1/2,(0..15)/16));
  //sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = GVerb.ar(sig,100)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 361.785392967, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([58,60,55,67].midicps/[1,1/2],mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,0.2],[3,-3]),Impulse.ar(1,(0..15)/16));
  //sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = GVerb.ar(sig,100)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 369.393382224, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([58,60,55,65].midicps/[1,1/2],mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,0.2],[3,-3]),Impulse.ar(1,(0..15)/16));
  //sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = GVerb.ar(sig,100)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 373.749385855, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([58,60,55,67].midicps/[1,1/2],mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,0.2],[3,-3]),Impulse.ar(1,(0..15)/16));
  //sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = GVerb.ar(sig,100)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 379.515744079, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([58,60,53,67].midicps/[1,1/2],mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,0.2],[3,-3]),Impulse.ar(1,(0..15)/16));
  //sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = GVerb.ar(sig,100)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 384.998097649, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([58,60,55,67].midicps/[1,1/2],mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,0.2],[3,-3]),Impulse.ar(1,(0..15)/16));
  //sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = GVerb.ar(sig,100)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 386.756061055, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([58,60,55,65].midicps/[1,1/2],mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,0.2],[3,-3]),Impulse.ar(1,(0..15)/16));
  //sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = GVerb.ar(sig,100)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 390.504139478, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([58,60,55,64].midicps/[1,1/2],mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,0.2],[3,-3]),Impulse.ar(1,(0..15)/16));
  //sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = GVerb.ar(sig,100)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 392.54753519, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([58,60,55,64].midicps/[1,1/2],mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,0.2],[3,-3]),Impulse.ar(1,(0..15)/16));
  //sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = GVerb.ar(sig,100)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 396.124512825, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([58,60,55,65].midicps/[1,1/2],mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,0.2],[3,-3]),Impulse.ar(1,(0..15)/16));
  //sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = GVerb.ar(sig,100)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 399.762935089, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([58,60,52,65].midicps/[1,1/2],mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,0.2],[3,-3]),Impulse.ar(1,(0..15)/16));
  //sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = GVerb.ar(sig,100)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 404.491164955, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([58,61,52,65].midicps/[1,1/2],mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,0.2],[3,-3]),Impulse.ar(1,(0..15)/16));
  //sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = GVerb.ar(sig,100)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 406.950881683, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([57,61,52,65].midicps/[1,1/2],mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,0.2],[3,-3]),Impulse.ar(1,(0..15)/16));
  //sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = GVerb.ar(sig,100)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 410.247095853, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([57,62,52,65].midicps/[1,1/2],mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,0.2],[3,-3]),Impulse.ar(1,(0..15)/16));
  //sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = GVerb.ar(sig,100)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 413.622025799, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([59,62,52,65].midicps/[1,1/2],mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,0.2],[3,-3]),Impulse.ar(1,(0..15)/16));
  //sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = GVerb.ar(sig,100)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 417.315259551, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([57,62,52,65].midicps/[1,1/2],mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,0.2],[3,-3]),Impulse.ar(1,(0..15)/16));
  //sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = GVerb.ar(sig,100)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 420.717775616, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([57,61,52,65].midicps/[1,1/2],mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,0.2],[3,-3]),Impulse.ar(1,(0..15)/16));
  //sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = GVerb.ar(sig,100)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 423.755780437, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([57,61,53,65].midicps/[1,1/2],mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,0.2],[3,-3]),Impulse.ar(1,(0..15)/16));
  //sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = GVerb.ar(sig,100)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 426.703001861, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([57,61,53,67].midicps/[1,1/2],mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,0.2],[3,-3]),Impulse.ar(1,(0..15)/16));
  //sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = GVerb.ar(sig,100)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 430.486720461, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([57,61,53,67].midicps/[1,2],mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,0.2],[3,-3]),Impulse.ar(1,(0..15)/16));
  //sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = GVerb.ar(sig,100)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 436.078844704, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([57,61,53,67].midicps/[1,2]*pi,mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,0.2],[3,-3]),Impulse.ar(1,(0..15)/16));
  //sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = GVerb.ar(sig,100)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 438.180981982, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([57,61,53,67].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,0.2],[3,-3]),Impulse.ar(1,(0..15)/16));
  //sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = GVerb.ar(sig,100)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 452.833687248, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([57,61,53,67].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,4],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  //sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = GVerb.ar(sig,100)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 464.801061768, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([57,61,53,67].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,4],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  sig = sig * Pulse.ar(4);
  //sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = GVerb.ar(sig,100)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 481.251835829, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([57,61,53,67].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,4],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  sig = sig * Pulse.ar(4);
  //sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = FreeVerb.ar(sig,0.1,100)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 489.299225209, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([57,61,53,67].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,4],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  sig = sig * Pulse.ar(4);
  //sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = FreeVerb.ar(sig,0.1,10)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 492.69847587, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([57,61,53,67].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,4],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  sig = sig * Pulse.ar(4);
  //sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = FreeVerb.ar(sig,0.3,10)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 495.793554003, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([57,61,53,67].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,4],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  sig = sig * Pulse.ar(4);
  //sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = FreeVerb.ar(sig,0.3,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 501.828071384, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([57,61,53,67].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,4],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  sig = sig * Pulse.ar(4);
  //sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 506.375704394, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([57,61,53,67].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,4],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  sig = sig * Pulse.ar(4);
  sig = AllpassN.ar(sig,0.25,0.25,4);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 514.715273021, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([57,61,53,67].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,4],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  sig = sig * Pulse.ar(4);
  sig = AllpassN.ar(sig,0.025,0.025,2);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 525.039464479, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([57,61,53,67].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,4],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  sig = sig * Pulse.ar(4);
  sig = AllpassN.ar(sig,0.025,0.04,2);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 527.884687552, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([57,61,53,67].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,4],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  sig = sig * Pulse.ar(4);
  sig = AllpassN.ar(sig,0.04,0.04,2);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 532.312822304, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([57,61,53,67].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,4],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  sig = sig * Pulse.ar(4);
  sig = AllpassN.ar(sig,0.02,0.02,2);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 535.152509066, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([57,61,53,67].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,4],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  sig = sig * Pulse.ar(4);
  sig = AllpassN.ar(sig,0.02,0.01,2);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 536.476871758, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([57,61,53,67].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,4],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  sig = sig * Pulse.ar(4);
  sig = AllpassN.ar(sig,0.1,0.01,2);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 546.206827898, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([57,61,53,67].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,4],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  sig = sig * Pulse.ar(4);
  sig = AllpassN.ar(sig,0.01,0.01,2);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 551.874392389, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([57,61,53,67].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,4],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  sig = sig * Pulse.ar([1,2,3,4]);
  sig = AllpassN.ar(sig,0.01,0.01,2);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 562.331108256, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([57,61,53,67].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,4],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  sig = sig * Pulse.ar([1,2,3,4]);
  sig = AllpassN.ar(sig,0.01,0.01,2);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 566.824839365, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([57,61,52,67].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,4],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  sig = sig * Pulse.ar([1,2,3,4]);
  sig = AllpassN.ar(sig,0.01,0.01,2);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 573.675290471, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([57,61,54,67].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,4],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  sig = sig * Pulse.ar([1,2,3,4]);
  sig = AllpassN.ar(sig,0.01,0.01,2);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 579.099196691, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([57,61,54,69].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,4],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  sig = sig * Pulse.ar([1,2,3,4]);
  sig = AllpassN.ar(sig,0.01,0.01,2);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 582.843296635, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([57,61,54,69].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,4],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  sig = sig * Pulse.ar([1,2,3,4]);
  sig = AllpassN.ar(sig,0.01,0.04,2);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 588.492746016, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([55,61,54,69].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,4],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  sig = sig * Pulse.ar([1,2,3,4]);
  sig = AllpassN.ar(sig,0.01,0.04,2);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 593.325709417, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([55,61,54,69].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,4],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  sig = sig * Pulse.ar([1,2,3,4]);
  sig = AllpassN.ar(sig,0.02,0.04,2);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 596.09252354, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([55,61,54,69].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,4],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  sig = sig * Pulse.ar([1,2,3,4]);
  sig = AllpassN.ar(sig,0.04,0.08,2);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 601.343079765, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([55,61,54,69].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,4],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  sig = sig * Pulse.ar([1,2,3,4]);
  sig = AllpassN.ar(sig,0.04,0.18,2);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 603.145349236, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([55,61,54,69].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,4],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  sig = sig * Pulse.ar([1,2,3,4]);
  sig = AllpassN.ar(sig,0.14,0.18,2);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 607.244390788, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([55,61,54,69].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,4],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  sig = sig * Pulse.ar([1,2,3,4]);
  sig = AllpassN.ar(sig,0.14,0.25,2);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 609.920296296, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([55,61,54,69].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,4],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  sig = sig * Pulse.ar([1,2,3,4]);
  sig = AllpassN.ar(sig,0.25,0.25,2);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 624.30476229, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([55,61,58,69].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,4],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  sig = sig * Pulse.ar([1,2,3,4]);
  sig = AllpassN.ar(sig,0.25,0.25,2);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 626.862419325, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([55,61,58,67].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,4],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  sig = sig * Pulse.ar([1,2,3,4]);
  sig = AllpassN.ar(sig,0.25,0.25,2);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 629.507485964, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([55,60,58,67].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,4],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  sig = sig * Pulse.ar([1,2,3,4]);
  sig = AllpassN.ar(sig,0.25,0.25,2);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 631.554396097, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([54,60,58,67].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,4],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  sig = sig * Pulse.ar([1,2,3,4]);
  sig = AllpassN.ar(sig,0.25,0.25,2);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 634.564801898, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([54,60,57,67].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,4],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  sig = sig * Pulse.ar([1,2,3,4]);
  sig = AllpassN.ar(sig,0.25,0.25,2);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 636.757569718, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([54,60,57,60].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,4],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  sig = sig * Pulse.ar([1,2,3,4]);
  sig = AllpassN.ar(sig,0.25,0.25,2);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 642.078309282, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([54,60,57,60].midicps/[1,2]*0.25pi,mul:LFDNoise1.ar(4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,4],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  sig = sig * Pulse.ar([1,2,3,4]);
  sig = AllpassN.ar(sig,0.25,0.25,2);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 644.900235774, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([54,60,57,60].midicps/[1,2]*0.25pi,mul:LFDNoise1.ar(1!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,4],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  sig = sig * Pulse.ar([1,2,3,4]);
  sig = AllpassN.ar(sig,0.25,0.25,2);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 648.843771511, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([54,60,57,60].midicps/[1,2]*0.25pi,mul:LFDNoise1.ar(1/4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,4],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  sig = sig * Pulse.ar([1,2,3,4]);
  sig = AllpassN.ar(sig,0.25,0.25,2);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 656.172523643, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([54,60,57,60].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(1/4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,4],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  sig = sig * Pulse.ar([1,2,3,4]);
  sig = AllpassN.ar(sig,0.25,0.25,2);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 659.508160607, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([54,60,57,60].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(1/4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.2,4],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  sig = sig * Pulse.ar([1,2,3,4]);
  sig = AllpassN.ar(sig,0.25,0.25,2);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 663.034128407, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([54,60,57,60].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(1/4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.2,0.2],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  sig = sig * Pulse.ar([1,2,3,4]);
  sig = AllpassN.ar(sig,0.25,0.25,2);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 666.849778914, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([54,60,57,60].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(1/4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.25,0.25],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  sig = sig * Pulse.ar([1,2,3,4]);
  sig = AllpassN.ar(sig,0.25,0.25,2);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 675.906395872, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([54,60,57,60].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(1/4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.75,0.25],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  sig = sig * Pulse.ar([1,2,3,4]);
  sig = AllpassN.ar(sig,0.25,0.25,2);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 691.666639103, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([54,60,57,60].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(1/4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.75,0.25],[2,-3]),Impulse.ar(1/4,(0..15)/16));
  sig = sig * Pulse.ar([1,2,3,4]);
  sig = AllpassN.ar(sig,0.25,0.25,2);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 694.112660088, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([54,60,57,60].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(1/4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.75,0.25],[1,1]),Impulse.ar(1/4,(0..15)/16));
  sig = sig * Pulse.ar([1,2,3,4]);
  sig = AllpassN.ar(sig,0.25,0.25,2);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 705.713564711, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([54,60,57,60].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(1/4!16)/3);
  sig = sig * EnvGen.new(Env([0,1,0],[0.75,0.25],[1,1]),Impulse.ar(1/4,(0..15)/16));
  sig = sig * Pulse.ar([1,2,3,4]);
  sig = AllpassN.ar(sig,0.25,0.25,2);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 719.635604365, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([54,60,57,60].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(1/4!16)/3);
  sig = sig * EnvGen.ar(Env.new([0,1,0],[0.75,0.25],[1,1]),Impulse.ar(1/4,(0..15)/16));
  sig = sig * Pulse.ar([1,2,3,4]);
  sig = AllpassN.ar(sig,0.25,0.25,2);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 732.831796881, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([54,60,57,60].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(1/4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.75,0.25],[1,1]),Impulse.ar(1/4,(0..15)/16));
  sig = sig * Pulse.ar([1,2,3,4]);
  //sig = AllpassN.ar(sig,0.25,0.25,2);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 743.356113756, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([54,60,57,60].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(1/4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.75,0.25],[1,1]),Impulse.ar(1/4,(0..15)/16));
  //sig = sig * Pulse.ar([1,2,3,4]);
  //sig = AllpassN.ar(sig,0.25,0.25,2);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 758.973643989, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([54,60,57,60].midicps/[1,2]*0.5pi,mul:LFDNoise1.ar(1/4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.75,0.25],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  //sig = sig * Pulse.ar([1,2,3,4]);
  //sig = AllpassN.ar(sig,0.25,0.25,2);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 762.76158145, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([54,60,57,60].midicps/[1]*0.5pi,mul:LFDNoise1.ar(1/4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.75,0.25],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  //sig = sig * Pulse.ar([1,2,3,4]);
  //sig = AllpassN.ar(sig,0.25,0.25,2);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 765.936216575, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([54,60,57,60].midicps*0.5pi,mul:LFDNoise1.ar(1/4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.75,0.25],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  //sig = sig * Pulse.ar([1,2,3,4]);
  //sig = AllpassN.ar(sig,0.25,0.25,2);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 768.738967714, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([54,60,57,60].midicps,mul:LFDNoise1.ar(1/4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.75,0.25],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  //sig = sig * Pulse.ar([1,2,3,4]);
  //sig = AllpassN.ar(sig,0.25,0.25,2);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 778.09890827, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([54,60,55,60].midicps,mul:LFDNoise1.ar(1/4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.75,0.25],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  //sig = sig * Pulse.ar([1,2,3,4]);
  //sig = AllpassN.ar(sig,0.25,0.25,2);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 781.752277725, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([58,60,55,60].midicps,mul:LFDNoise1.ar(1/4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.75,0.25],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  //sig = sig * Pulse.ar([1,2,3,4]);
  //sig = AllpassN.ar(sig,0.25,0.25,2);
  sig = FreeVerb.ar(sig,0.13,10)+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 785.471680804, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = SinOsc.ar([56,60,54,60].midicps,mul:LFDNoise1.ar(1/4!16)/3);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.75,0.25],[3,-3]),Impulse.ar(1/4,(0..15)/16));
  //sig = sig * Pulse.ar([1,2,