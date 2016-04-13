// History, as it was on Tue Jun 16 17:56:39 2015.

[
[ 0, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = Pulse.ar(1!2);
  sig = Changed.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
~sig.play;
);" ],
[ 16.282000996, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = Pulse.ar(1!2);
  sig = SinOsc.ar(400)* Decay.ar(Changed.ar(sig));
  Splay.ar(sig.flat,0.25,0.5);
};
~sig.play;
);" ],
[ 20.668593969, 'me', "thisProcess.stop;" ],
[ 27.185206847, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = Pulse.ar(1!2);
  sig = SinOsc.ar(90)* Decay.ar(Changed.ar(sig));
  Splay.ar(sig.flat,0.25,0.5);
};
~sig.play;
);" ],
[ 30.689620989, 'me', "thisProcess.stop;" ],
[ 34.92429019, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = Pulse.ar(1!2);
  sig = SinOsc.ar(90)* Decay.ar(Changed.ar(sig).poll);
  Splay.ar(sig.flat,0.25,0.5);
};
~sig.play;
);" ],
[ 39.410785572, 'me', "thisProcess.stop;" ],
[ 42.683337787, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = Pulse.ar(1/4!2);
  sig = SinOsc.ar(90)* Decay.ar(Changed.ar(sig).poll);
  Splay.ar(sig.flat,0.25,0.5);
};
~sig.play;
);" ],
[ 47.087503524, 'me', "thisProcess.stop;" ],
[ 49.424139565, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = Pulse.ar(1/4!2)/10;
  sig = SinOsc.ar(90)* Decay.ar(Changed.ar(sig).poll);
  Splay.ar(sig.flat,0.25,0.5);
};
~sig.play;
);" ],
[ 53.228587879, 'me', "thisProcess.stop;" ],
[ 60.485232155, 'me', "HelpBrowser.openHelpFor(\"Changed\");" ],
[ 139.268078855, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = Pulse.ar(1/4!2);
  sig = SinOsc.ar(90)* Decay.ar(Changed.ar(sig,0.6).poll);
  Splay.ar(sig.flat,0.25,0.5);
};
~sig.play;
);" ],
[ 145.845896361, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = Pulse.ar(1/4!2);
  sig = SinOsc.ar(90)* Decay.ar(Changed.ar(sig,0.3).poll);
  Splay.ar(sig.flat,0.25,0.5);
};
~sig.play;
);" ],
[ 169.687029587, 'me', "thisProcess.stop;" ],
[ 170.142547297, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = Pulse.ar(1/4!2);
  sig = SinOsc.ar(100!2) * Decay.ar(Changed.ar(sig,0.3).poll);
  Splay.ar(sig.flat,0.25,0.5);
};
~sig.play;
);" ],
[ 177.616197956, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = Pulse.ar(1/4!2);
  sig = SinOsc.ar(100!2) * Decay.ar(Changed.ar(sig,0.7).poll);
  Splay.ar(sig.flat,0.25,0.5);
};
~sig.play;
);" ],
[ 183.198773166, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = Pulse.ar(1!2);
  sig = SinOsc.ar(100!2) * Decay.ar(Changed.ar(sig,0.7).poll);
  Splay.ar(sig.flat,0.25,0.5);
};
~sig.play;
);" ],
[ 189.290623088, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = Pulse.ar(1!2);
  sig = SinOsc.ar(100!2) * Decay.ar(Changed.ar(sig,0.3).poll);
  Splay.ar(sig.flat,0.25,0.5);
};
~sig.play;
);" ],
[ 201.77081145, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = Pulse.ar(1!2);
  sig = SinOsc.ar(100!2) * Decay.ar(Changed.ar(sig,0.1));
  Splay.ar(sig.flat,0.25,0.5);
};
~sig.play;
);" ],
[ 210.275044588, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = Pulse.ar(1!2);
  sig = SinOsc.ar(100!2) * Decay.ar(Changed.ar(sig,0.9));
  Splay.ar(sig.flat,0.25,0.5);
};
~sig.play;
);" ],
[ 217.683248928, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = Pulse.ar(1!2);
  sig = SinOsc.ar(100!2) * Decay.ar(Changed.ar(sig,0.5));
  Splay.ar(sig.flat,0.25,0.5);
};
~sig.play;
);" ],
[ 228.165059864, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = LFSaw.ar(1!2);
  sig = SinOsc.ar(100!2) * Decay.ar(Changed.ar(sig,0.5));
  Splay.ar(sig.flat,0.25,0.5);
};
~sig.play;
);" ],
[ 237.434967511, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = LFSaw.ar(4!2);
  sig = SinOsc.ar(100!2) * Decay.ar(Changed.ar(sig,0.5));
  Splay.ar(sig.flat,0.25,0.5);
};
~sig.play;
);" ],
[ 252.191630919, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = LFSaw.ar(4!2);
  sig = SinOsc.ar(100!2) * Decay.ar(Changed.ar(sig,0.5).poll);
  Splay.ar(sig.flat,0.25,0.5);
};
~sig.play;
);" ],
[ 262.097940444, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = LFSaw.ar(4);
  sig = SinOsc.ar(100!2) * Decay.ar(Changed.ar(sig,0.5));
  Splay.ar(sig.flat,0.25,0.5);
};
~sig.play;
);" ],
[ 267.505908262, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = LFSaw.ar(4);
  sig = SinOsc.ar(100!2) * Decay.ar(Changed.ar(sig,0.5));
  Splay.ar(sig.flat,0.25,0.5);
};
~sig.play;
);" ],
[ 278.779747119, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = LFSaw.ar(2);
  sig = SinOsc.ar(100!2) * Decay.ar(Changed.ar(sig,0.5));
  Splay.ar(sig.flat,0.25,0.5);
};
~sig.play;
);" ],
[ 280.273850952, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = LFSaw.ar(1);
  sig = SinOsc.ar(100!2) * Decay.ar(Changed.ar(sig,0.5));
  Splay.ar(sig.flat,0.25,0.5);
};
~sig.play;
);" ],
[ 331.235810354, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = LFSaw.ar(1);
  sig = SinOsc.ar(10000!2) * Decay.ar(Changed.ar(sig,0.5));
  Splay.ar(sig.flat,0.25,0.5);
};
~sig.play;
);" ],
[ 335.971937513, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = LFSaw.ar(1);
  sig = SinOsc.ar(10000!2) * Decay.ar(Changed.ar(sig,0.5),0.1);
  Splay.ar(sig.flat,0.25,0.5);
};
~sig.play;
);" ],
[ 338.538622968, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = LFSaw.ar(1);
  sig = SinOsc.ar(10000!2) * Decay.ar(Changed.ar(sig,0.5),0.1);
  Splay.ar(sig.flat,0.25,0.25);
};
~sig.play;
);" ],
[ 365.883202552, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = LFNoise1.ar(1);
  sig = SinOsc.ar(10000!2) * Decay.ar(Changed.ar(sig,0.5),0.1);
  Splay.ar(sig.flat,0.25,0.25);
};
~sig.play;
);" ],
[ 375.192564244, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = LFNoise1.ar(1);
  sig = SinOsc.ar(10000!2) * Decay.ar(Changed.ar(sig,0.15),0.1);
  Splay.ar(sig.flat,0.25,0.25);
};
~sig.play;
);" ],
[ 379.944062374, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = LFNoise1.ar(1);
  sig = SinOsc.ar(10000!2) * Decay.ar(Changed.ar(sig,0.05),0.1);
  Splay.ar(sig.flat,0.25,0.25);
};
~sig.play;
);" ],
[ 384.896368901, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = LFNoise1.ar(1);
  sig = SinOsc.ar(10000!2) * Decay.ar(Changed.ar(sig,0.005),0.1);
  Splay.ar(sig.flat,0.25,0.25);
};
~sig.play;
);" ],
[ 389.460105129, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = LFNoise1.ar(1);
  sig = SinOsc.ar(10000!2) * Decay.ar(Changed.ar(sig,0.0005),0.1);
  Splay.ar(sig.flat,0.25,0.25);
};
~sig.play;
);" ],
[ 397.392377193, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = LFNoise1.ar(1);
  sig = SinOsc.ar(10000!2) * Decay.ar(Changed.ar(sig,0.5),0.1);
  Splay.ar(sig.flat,0.25,0.25);
};
~sig.play;
);" ],
[ 400.617425417, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = LFNoise1.ar(1);
  sig = SinOsc.ar(10000!2) * Decay.ar(Changed.ar(sig,0.75),0.1);
  Splay.ar(sig.flat,0.25,0.25);
};
~sig.play;
);" ],
[ 402.683003006, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = LFNoise1.ar(1);
  sig = SinOsc.ar(10000!2) * Decay.ar(Changed.ar(sig,0.95),0.1);
  Splay.ar(sig.flat,0.25,0.25);
};
~sig.play;
);" ],
[ 410.582639831, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = Pulse.ar(1);
  sig = SinOsc.ar(10000!2) * Decay.ar(Changed.ar(sig,0.95),0.1);
  Splay.ar(sig.flat,0.25,0.25);
};
~sig.play;
);" ],
[ 416.031549863, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = Pulse.ar(1);
  sig = SinOsc.ar(10000!2) * Decay.ar(Changed.ar(sig,0.25),0.1);
  Splay.ar(sig.flat,0.25,0.25);
};
~sig.play;
);" ],
[ 425.480338127, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = Pulse.ar(1);
  sig = SinOsc.ar(10000!2) * Decay.ar(Changed.ar(sig,0.5),0.1);
  Splay.ar(sig.flat,0.25,0.25);
};
~sig.play;
);" ],
[ 438.725356389, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = Pulse.ar(11);
  sig = SinOsc.ar(10000!2) * Decay.ar(Changed.ar(sig,0.5),0.1);
  Splay.ar(sig.flat,0.25,0.25);
};
~sig.play;
);" ],
[ 443.377829207, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = Pulse.ar(2);
  sig = SinOsc.ar(10000!2) * Decay.ar(Changed.ar(sig,0.5),0.1);
  Splay.ar(sig.flat,0.25,0.25);
};
~sig.play;
);" ],
[ 447.281464661, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = Pulse.ar(4);
  sig = SinOsc.ar(10000!2) * Decay.ar(Changed.ar(sig,0.5),0.1);
  Splay.ar(sig.flat,0.25,0.25);
};
~sig.play;
);" ],
[ 452.513688395, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = Pulse.ar(8);
  sig = SinOsc.ar(10000!2) * Decay.ar(Changed.ar(sig,0.5),0.1);
  Splay.ar(sig.flat,0.25,0.25);
};
~sig.play;
);" ],
[ 465.036076279, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = Pulse.ar(8);
  sig = SinOsc.ar(10000!2) * Decay.ar(Changed.ar(sig,0.5),0.05);
  Splay.ar(sig.flat,0.25,0.25);
};
~sig.play;
);" ],
[ 469.649943109, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = Pulse.ar(8);
  sig = SinOsc.ar(10000!2) * Decay.ar(Changed.ar(sig,0.5),0.15);
  Splay.ar(sig.flat,0.25,0.25);
};
~sig.play;
);" ],
[ 480.025066741, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = Pulse.ar(1/4);
  sig = SinOsc.ar(10000!2) * Decay.ar(Changed.ar(sig,0.5),0.15);
  Splay.ar(sig.flat,0.25,0.25);
};
~sig.play;
);" ],
[ 503.649452399, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = Pulse.ar(1/4);
  sig = SinOsc.ar(10000!2) * Decay.ar(Changed.ar(sig,0.25),0.15);
  Splay.ar(sig.flat,0.25,0.25);
};
~sig.play;
);" ],
[ 510.241956091, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = Pulse.ar(1/4);
  sig = SinOsc.ar(10000!2) * Decay.ar(Changed.ar(sig,0.35),0.15);
  Splay.ar(sig.flat,0.25,0.25);
};
~sig.play;
);" ],
[ 536.174723971, 'me', "thisProcess.stop;" ],
[ 852.29568899, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = Crackle.ar(1);
  sig = SinOsc.ar(10000!2) * Decay.ar(Changed.ar(sig,0.35),0.15);
  Splay.ar(sig.flat,0.25,0.25);
};
~sig.play;
);" ],
[ 861.389669986, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = Crackle.ar(1);
  sig = SinOsc.ar(1000!2) * Decay.ar(Changed.ar(sig,0.35),0.15);
  Splay.ar(sig.flat,0.25,0.25);
};
~sig.play;
);" ],
[ 864.544336383, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = Crackle.ar(1);
  sig = SinOsc.ar(1000!2) * Decay.ar(Changed.ar(sig,0.135),0.15);
  Splay.ar(sig.flat,0.25,0.25);
};
~sig.play;
);" ],
[ 876.373460024, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = Crackle.ar(1!2);
  Splay.ar(sig.flat,0.25,0.25);
};
~sig.play;
);" ],
[ 883.436418404, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = Crackle.ar(11!2);
  Splay.ar(sig.flat,0.25,0.25);
};
~sig.play;
);" ],
[ 886.44800586, 'me', "thisProcess.stop;" ],
[ 888.669958475, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = Crackle.ar(0.2!2);
  Splay.ar(sig.flat,0.25,0.25);
};
~sig.play;
);" ],
[ 892.90167442, 'me', "thisProcess.stop;" ],
[ 893.217490754, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = Crackle.ar(0.2!2);
  Splay.ar(sig.flat,0.25,0.25);
};
~sig.play;
);" ],
[ 899.011906274, 'me', "(
~sig.quant=2;
~sig.fadeTime=5;
~sig={
  var sig = Crackle.ar(0.02!2);
  Splay.ar(sig.flat,0.25,0.25);
};
~sig.play;
);" ],
[ 912.267212511, 'me', "thisProcess.stop;" ],
[ 920.947650631, 'me', "(
~tste.quant=2;
~tste.fadeTime=5;
~tste={
  var sig = Crackle.ar(1!2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~tste.play;
);" ],
[ 929.25018806, 'me', "(
~tste.quant=2;
~tste.fadeTime=5;
~tste={
  var sig = Crackle.ar(0.5!2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~tste.play;
);" ],
[ 935.549972226, 'me', "(
~tste.quant=2;
~tste.fadeTime=5;
~tste={
  var sig = Crackle.ar(2!2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~tste.play;
);" ],
[ 943.844923217, 'me', "(
~tste.quant=2;
~tste.fadeTime=5;
~tste={
  var sig = Crackle.ar(4!2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~tste.play;
);" ],
[ 947.182957034, 'me', "(
~tste.quant=2;
~tste.fadeTime=5;
~tste={
  var sig = Crackle.ar(2!2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~tste.play;
);" ],
[ 948.492227625, 'me', "(
~tste.quant=2;
~tste.fadeTime=5;
~tste={
  var sig = Crackle.ar(1.5!2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~tste.play;
);" ],
[ 958.279691897, 'me', "(
~tste.quant=2;
~tste.fadeTime=5;
~tste={
  var sig = Crackle.ar(1!2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~tste.play;
);" ],
[ 967.177687105, 'me', "(
~tste.quant=2;
~tste.fadeTime=5;
~tste={
  var sig = Crackle.ar(2!2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~tste.play;
);" ],
[ 981.461204537, 'me', "(
~tste.quant=2;
~tste.fadeTime=5;
~tste={
  var sig = Crackle.ar(2!2);
  sig = LPF.ar(sig,4000);
  Splay.ar(sig.flat,0.25,0.5);
};
~tste.play;
);" ],
[ 1002.425106923, 'me', "(
~tste.quant=2;
~tste.fadeTime=5;
~tste={
  var sig = Crackle.ar(2!2);
  sig = LPF.ar(sig,4000);
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~tste.play;
);" ],
[ 1029.868715758, 'me', "(
~tste.quant=2;
~tste.fadeTime=5;
~tste={
  var sig = Crackle.ar(2!2);
  sig = LPF.ar(sig,4000) * LFSaw.ar(1/4).exprange(0.001,1);
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~tste.play;
);" ],
[ 1052.813904614, 'me', "(
~tste.quant=2;
~tste.fadeTime=5;
~tste={
  var sig = Crackle.ar(2!2);
  sig = LPF.ar(sig, LFSaw.ar(1/4).exprange(0.001,1)*14000+40);
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~tste.play;
);" ],
[ 1060.814229477, 'me', "(
~tste.quant=2;
~tste.fadeTime=5;
~tste={
  var sig = Crackle.ar(2!2);
  sig = LPF.ar(sig, LFSaw.ar(1/4).exprange(0.001,1)*14000+400);
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~tste.play;
);" ],
[ 1076.837106732, 'me', "(
~tste.quant=2;
~tste.fadeTime=5;
~tste={
  var sig = Crackle.ar(2!2);
  sig = LPF.ar(sig, LFSaw.ar(1/4).exprange(0.001,1)*18000+400);
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~tste.play;
);" ],
[ 1096.98161616, 'me', "(
~tste.quant=2;
~tste.fadeTime=5;
~tste={
  var sig = Crackle.ar(2!2);
  sig = LPF.ar(sig, LFSaw.ar(1/4).exprange(0.001,1)*10000+400);
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~tste.play;
);" ],
[ 1104.697935079, 'me', "(
~tste.quant=2;
~tste.fadeTime=5;
~tste={
  var sig = Crackle.ar(2!2);
  sig = LPF.ar(sig, LFSaw.ar(1/4).exprange(0.001,1)*1000+400);
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~tste.play;
);" ],
[ 1108.101021927, 'me', "(
~tste.quant=2;
~tste.fadeTime=5;
~tste={
  var sig = Crackle.ar(2!2);
  sig = LPF.ar(sig, LFSaw.ar(4).exprange(0.001,1)*1000+400);
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~tste.play;
);" ],
[ 1113.120970401, 'me', "(
~tste.quant=2;
~tste.fadeTime=5;
~tste={
  var sig = Crackle.ar(2!2);
  sig = BPF.ar(sig, LFSaw.ar(4).exprange(0.001,1)*1000+400);
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~tste.play;
);" ],
[ 1116.008063217, 'me', "(
~tste.quant=2;
~tste.fadeTime=5;
~tste={
  var sig = Crackle.ar(2!2);
  sig = BPF.ar(sig, LFSaw.ar(1/4).exprange(0.001,1)*1000+400);
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~tste.play;
);" ],
[ 1125.581321352, 'me', "(
~tste.quant=2;
~tste.fadeTime=5;
~tste={
  var sig = Crackle.ar(2!2);
  sig = BPF.ar(sig, LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*1000+400);
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~tste.play;
);" ],
[ 1129.573102881, 'me', "(
~tste.quant=2;
~tste.fadeTime=5;
~tste={
  var sig = Crackle.ar(2!2);
  sig = BPF.ar(sig, LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*1000+400);
  sig = GVerb.ar(sig,10)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~tste.play;
);" ],
[ 1131.289221453, 'me', "(
~tste.quant=2;
~tste.fadeTime=5;
~tste={
  var sig = Crackle.ar(2!2);
  sig = BPF.ar(sig, LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*1000+400);
  sig = GVerb.ar(sig,100)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~tste.play;
);" ],
[ 1136.504399916, 'me', "(
~tste.quant=2;
~tste.fadeTime=5;
~tste={
  var sig = Crackle.ar(2!2);
  sig = BPF.ar(sig, LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*10000+400);
  sig = GVerb.ar(sig,100)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~tste.play;
);" ],
[ 1140.704925401, 'me', "thisProcess.stop;" ],
[ 1183.072677043, 'me', "(
~tste.quant=2;
~tste.fadeTime=5;
~tste={
  var sig = Crackle.ar(2!2);
  sig = BPF.ar(sig, LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*10000+40);
  sig = GVerb.ar(sig,100)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~tste.play;
);" ],
[ 1183.809159598, 'me', "thisProcess.stop;" ],
[ 1184.856088416, 'me', "(
~tste.quant=2;
~tste.fadeTime=5;
~tste={
  var sig = Crackle.ar(2!2);
  sig = BPF.ar(sig, LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*10000+40);
  sig = GVerb.ar(sig,100)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~tste.play;
);" ],
[ 1195.267197308, 'me', "(
~tste.quant=2;
~tste.fadeTime=5;
~tste={
  var sig = Crackle.ar(2!2);
  sig = BPF.ar(sig, LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*1000+40);
  sig = GVerb.ar(sig,100)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~tste.play;
);" ],
[ 1226.104010109, 'me', "(
~tste.quant=2;
~tste.fadeTime=5;
~tste={
  var sig = Crackle.ar(2!2);
  sig = BPF.ar(sig, LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*100+40);
  sig = GVerb.ar(sig,100)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~tste.play;
);" ],
[ 1239.686625908, 'me', "(
~tste.quant=2;
~tste.fadeTime=5;
~tste={
  var sig = Crackle.ar(2!2);
  sig = BPF.ar(sig, LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*100+40);
  sig = GVerb.ar(sig,100)/2+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
~tste.play;
);" ],
[ 1262.125125906, 'me', "(
~tste.quant=2;
~tste.fadeTime=5;
~tste={
  var sig = Crackle.ar(2!2);
  sig = BPF.ar(sig, LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*800+40) * Pulse.ar([1,2,3,4]);
  sig = GVerb.ar(sig,100)/2+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
~tste.play;
);" ],
[ 1269.118301635, 'me', "(
~tste.quant=2;
~tste.fadeTime=5;
~tste={
  var sig = Crackle.ar(2!2);
  sig = BPF.ar(sig, LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*800+40) * Pulse.ar([1,2,3,4]);
  sig = GVerb.ar(sig,100)/2+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
~tste.play;
);" ],
[ 1273.84018594, 'me', "(
~tste.quant=2;
~tste.fadeTime=5;
~tste={
  var sig = Crackle.ar(2!2);
  sig = BPF.ar(sig, LFSaw.ar(4/fib(8)).exprange(0.001,1)*800+40) * Pulse.ar([1,2,3,4]);
  sig = GVerb.ar(sig,100)/2+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
~tste.play;
);" ],
[ 1276.672931106, 'me', "(
~tste.quant=2;
~tste.fadeTime=5;
~tste={
  var sig = Crackle.ar(2!2);
  sig = BPF.ar(sig, LFSaw.ar(4/fib(8)).exprange(0.001,1)*8000+40) * Pulse.ar([1,2,3,4]);
  sig = GVerb.ar(sig,100)/2+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
~tste.play;
);" ],
[ 1282.721662326, 'me', "(
~tste.quant=2;
~tste.fadeTime=5;
~tste={
  var sig = Crackle.ar(2!2);
  sig = BPF.ar(sig, LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*8000+40) * Pulse.ar([1,2,3,4]);
  sig = GVerb.ar(sig,100)/2+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
~tste.play;
);" ],
[ 1310.899503825, 'me', "~tste.stop(7);" ],
[ 1331.786079743, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(50!2);
  sig = BPF.ar(sig,SinOsc.ar(4).range(50,100));
  Splay.ar(sig.flat,0.25,0.5);
};
~sigg.play;
);" ],
[ 1344.812552015, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(50!2);
  sig = BPF.ar(sig,SinOsc.ar(2).range(50,100));
  Splay.ar(sig.flat,0.25,0.5);
};
~sigg.play;
);" ],
[ 1351.504080543, 'me', "thisProcess.stop;" ],
[ 1354.239756318, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(50!2);
  sig = BPF.ar(sig,SinOsc.ar(1.1).range(50,100));
  Splay.ar(sig.flat,0.25,0.5);
};
~sigg.play;
);" ],
[ 1362.369583992, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(50!2);
  sig = BPF.ar(sig,SinOsc.ar(0.1).range(50,100));
  Splay.ar(sig.flat,0.25,0.5);
};
~sigg.play;
);" ],
[ 1376.187005003, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(50!2);
  sig = BPF.ar(sig,SinOsc.ar(0.1).range(50,100));
  sig = GVerb.ar(sig,4);
  Splay.ar(sig.flat,0.25,0.5);
};
~sigg.play;
);" ],
[ 1386.380843512, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(50!2);
  sig = BPF.ar(sig,SinOsc.ar(0.1).range(50,100));
  sig = GVerb.ar(sig,4);
  Splay.ar(sig.flat,0.25,0.25);
};
~sigg.play;
);" ],
[ 1392.882912166, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(72!2);
  sig = BPF.ar(sig,SinOsc.ar(0.1).range(50,100));
  sig = GVerb.ar(sig,4);
  Splay.ar(sig.flat,0.25,0.25);
};
~sigg.play;
);" ],
[ 1407.652341294, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(60.midicps/0.5pi);
  sig = BPF.ar(sig,SinOsc.ar(0.1).range(50,100));
  sig = GVerb.ar(sig,4);
  Splay.ar(sig.flat,0.25,0.25);
};
~sigg.play;
);" ],
[ 1416.195887452, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar([60,65].midicps/0.5pi);
  sig = BPF.ar(sig,SinOsc.ar(0.1).range(50,100));
  sig = GVerb.ar(sig,4);
  Splay.ar(sig.flat,0.25,0.25);
};
~sigg.play;
);" ],
[ 1421.282602857, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar([60,67].midicps/0.5pi);
  sig = BPF.ar(sig,SinOsc.ar(0.1).range(50,100));
  sig = GVerb.ar(sig,4);
  Splay.ar(sig.flat,0.25,0.25);
};
~sigg.play;
);" ],
[ 1431.529536906, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar([60,67,63].midicps/0.5pi);
  sig = BPF.ar(sig,SinOsc.ar(0.1).range(50,100));
  sig = GVerb.ar(sig,4);
  Splay.ar(sig.flat,0.25,0.25);
};
~sigg.play;
);" ],
[ 1436.497564759, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar([60,67,63].midicps/0.5pi*[1,1.5]);
  sig = BPF.ar(sig,SinOsc.ar(0.1).range(50,100));
  sig = GVerb.ar(sig,4);
  Splay.ar(sig.flat,0.25,0.25);
};
~sigg.play;
);" ],
[ 1439.460768853, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar([60,67,63].midicps/0.5pi*[1,1.25]);
  sig = BPF.ar(sig,SinOsc.ar(0.1).range(50,100));
  sig = GVerb.ar(sig,4);
  Splay.ar(sig.flat,0.25,0.25);
};
~sigg.play;
);" ],
[ 1444.049225009, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar([60,67,63].midicps/0.5pi*[1,1.25,2]);
  sig = BPF.ar(sig,SinOsc.ar(0.1).range(50,100));
  sig = GVerb.ar(sig,4);
  Splay.ar(sig.flat,0.25,0.25);
};
~sigg.play;
);" ],
[ 1445.94394629, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar([60,67,63].midicps/0.5pi*[1,1.5,2]);
  sig = BPF.ar(sig,SinOsc.ar(0.1).range(50,100));
  sig = GVerb.ar(sig,4);
  Splay.ar(sig.flat,0.25,0.25);
};
~sigg.play;
);" ],
[ 1448.535785002, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar([60,67,63].midicps/0.5pi*[1,1.5,2,4]);
  sig = BPF.ar(sig,SinOsc.ar(0.1).range(50,100));
  sig = GVerb.ar(sig,4);
  Splay.ar(sig.flat,0.25,0.25);
};
~sigg.play;
);" ],
[ 1450.517993609, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar([60,67,63].midicps/0.5pi*[1,1.5,2,4,0.5]);
  sig = BPF.ar(sig,SinOsc.ar(0.1).range(50,100));
  sig = GVerb.ar(sig,4);
  Splay.ar(sig.flat,0.25,0.25);
};
~sigg.play;
);" ],
[ 1463.927941273, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar([60,67,63].midicps/0.5pi*[1,1.5,2,4,0.5]);
  sig = BPF.ar(sig,SinOsc.ar(0.1).range(50,100)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,4);
  Splay.ar(sig.flat,0.25,0.25);
};
~sigg.play;
);" ],
[ 1484.713337477, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar([60,67,63,72].midicps/0.5pi*[1,1.5,2,4,0.5]);
  sig = BPF.ar(sig,SinOsc.ar(0.1).range(50,100)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,4);
  Splay.ar(sig.flat,0.25,0.25);
};
~sigg.play;
);" ],
[ 1498.541544242, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar([60,67,63,72,48].midicps/0.5pi*[1,1.5,2,4,0.5]);
  sig = BPF.ar(sig,SinOsc.ar(0.1).range(50,100)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,4);
  Splay.ar(sig.flat,0.25,0.25);
};
~sigg.play;
);" ],
[ 1504.784514007, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar([60,67,63,72,48].midicps/0.5pi*[1,1.5,2,4,0.5]*1.5);
  sig = BPF.ar(sig,SinOsc.ar(0.1).range(50,100)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,4);
  Splay.ar(sig.flat,0.25,0.25);
};
~sigg.play;
);" ],
[ 1511.881184719, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar([60,67,63,72,48].midicps/0.5pi*[1,1.5,2,4,0.5]*1.25);
  sig = BPF.ar(sig,SinOsc.ar(0.1).range(50,100)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,4);
  Splay.ar(sig.flat,0.25,0.25);
};
~sigg.play;
);" ],
[ 1519.105889617, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar([60,67,63,72,48].midicps/0.5pi*[1,1.5,2,4,0.5]);
  sig = BPF.ar(sig,SinOsc.ar(0.1).range(50,100)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,4);
  Splay.ar(sig.flat,0.25,0.25);
};
~sigg.play;
);" ],
[ 1526.742643461, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar([60,67,63,72,48].midicps/0.25pi*[1,1.5,2,4,0.5]);
  sig = BPF.ar(sig,SinOsc.ar(0.1).range(50,100)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,4);
  Splay.ar(sig.flat,0.25,0.25);
};
~sigg.play;
);" ],
[ 1532.412059002, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar([60,67,63,72,48].midicps/0.5pi*[1,1.5,2,4,0.5]);
  sig = BPF.ar(sig,SinOsc.ar(0.1).range(50,100)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,4);
  Splay.ar(sig.flat,0.25,0.25);
};
~sigg.play;
);" ],
[ 1548.944529168, 'me', "(
~tste.quant=2;
~tste.fadeTime=5;
~tste={
  var sig = Crackle.ar(2!2);
  sig = BPF.ar(sig, LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*8000+40) * Pulse.ar([1,2,3,4]);
  sig = GVerb.ar(sig,100)/2+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
~tste.play;
);" ],
[ 1554.982238122, 'me', "(
~tste.quant=2;
~tste.fadeTime=5;
~tste={
  var sig = Crackle.ar(2!2);
  sig = BPF.ar(sig, LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*8000+40) * Pulse.ar([1,2,3,4]);
  sig = GVerb.ar(sig,100)/2+sig;
  Splay.ar(sig.flat,0.25,0.0125);
};
~tste.play;
);" ],
[ 1557.866207251, 'me', "(
~tste.quant=2;
~tste.fadeTime=5;
~tste={
  var sig = Crackle.ar(2!2);
  sig = BPF.ar(sig, LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*8000+40) * Pulse.ar([1,2,3,4]);
  sig = GVerb.ar(sig,10)/2+sig;
  Splay.ar(sig.flat,0.25,0.0125);
};
~tste.play;
);" ],
[ 1563.821022784, 'me', "(
~tste.quant=2;
~tste.fadeTime=5;
~tste={
  var sig = Crackle.ar(2!2);
  sig = BPF.ar(sig, LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*8000+40) * Pulse.ar([1,2,3,4]);
  sig = GVerb.ar(sig,10)/2+sig;
  Splay.ar(sig.flat,0.25,0.1125);
};
~tste.play;
);" ],
[ 1585.242954785, 'me', "(
~tste.quant=2;
~tste.fadeTime=5;
~tste={
  var sig = Crackle.ar(2!2);
  sig = BPF.ar(sig, LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*8000+40) * Pulse.ar([1,2,3,4]/2);
  sig = GVerb.ar(sig,10)/2+sig;
  Splay.ar(sig.flat,0.25,0.1125);
};
~tste.play;
);" ],
[ 1589.448015278, 'me', "(
~tste.quant=2;
~tste.fadeTime=5;
~tste={
  var sig = Crackle.ar(2!2);
  sig = BPF.ar(sig, LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*4000+40) * Pulse.ar([1,2,3,4]/2);
  sig = GVerb.ar(sig,10)/2+sig;
  Splay.ar(sig.flat,0.25,0.1125);
};
~tste.play;
);" ],
[ 1592.311596631, 'me', "(
~tste.quant=2;
~tste.fadeTime=5;
~tste={
  var sig = Crackle.ar(2!2);
  sig = BPF.ar(sig, LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*4000+140) * Pulse.ar([1,2,3,4]/2);
  sig = GVerb.ar(sig,10)/2+sig;
  Splay.ar(sig.flat,0.25,0.1125);
};
~tste.play;
);" ],
[ 1595.710072957, 'me', "(
~tste.quant=2;
~tste.fadeTime=5;
~tste={
  var sig = Crackle.ar(2!2);
  sig = BPF.ar(sig, LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*4000+1400) * Pulse.ar([1,2,3,4]/2);
  sig = GVerb.ar(sig,10)/2+sig;
  Splay.ar(sig.flat,0.25,0.1125);
};
~tste.play;
);" ],
[ 1604.723049513, 'me', "(
~tste.quant=2;
~tste.fadeTime=5;
~tste={
  var sig = Crackle.ar(2!2);
  sig = BPF.ar(sig, LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*4000+1400) * Pulse.ar([1,2,3,4]/2);
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.0125);
};
~tste.play;
);" ],
[ 1612.693632756, 'me', "(
~tste.quant=2;
~tste.fadeTime=5;
~tste={
  var sig = Crackle.ar(2!2);
  sig = BPF.ar(sig, LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*4000+1400) * Pulse.ar([1,2,3,4]/2);
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.025);
};
~tste.play;
);" ],
[ 1624.891328422, 'me', "(
~tste.quant=2;
~tste.fadeTime=5;
~tste={
  var sig = Crackle.ar(2!2);
  sig = BPF.ar(sig, LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*4000+1400) * Pulse.ar([1,2,3,4]/2);
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.05);
};
~tste.play;
);" ],
[ 1634.872152767, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar([60,67,63,72,48,72+12].midicps/0.5pi*[1,1.5,2,4,0.5]);
  sig = BPF.ar(sig,SinOsc.ar(0.1).range(50,100)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,4);
  Splay.ar(sig.flat,0.25,0.25);
};
~sigg.play;
);" ],
[ 1640.543224903, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar([60,67,63,72,48,72+12].midicps/0.5pi*[1,1.5,2,4,0.5,1.25]);
  sig = BPF.ar(sig,SinOsc.ar(0.1).range(50,100)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,4);
  Splay.ar(sig.flat,0.25,0.25);
};
~sigg.play;
);" ],
[ 1654.622637713, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar([60,67,63,72,48,72+12].midicps/0.75pi*[1,1.5,2,4,0.5,1.25]);
  sig = BPF.ar(sig,SinOsc.ar(0.1).range(50,100)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,4);
  Splay.ar(sig.flat,0.25,0.25);
};
~sigg.play;
);" ],
[ 1667.553275891, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar([60,67,63,72,48,72+12].midicps/1.25pi*[1,1.5,2,4,0.5,1.25]);
  sig = BPF.ar(sig,SinOsc.ar(0.1).range(50,100)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,4);
  Splay.ar(sig.flat,0.25,0.25);
};
~sigg.play;
);" ],
[ 1690.99307066, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar([60,67,63,72,48,72+12].midicps/0.5pi*[1,1.5,2,4,0.5,1.25]);
  sig = BPF.ar(sig,SinOsc.ar(0.1).range(50,100)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,4);
  Splay.ar(sig.flat,0.25,0.25);
};
~sigg.play;
);" ],
[ 1715.060343414, 'me', "~sigg.stop(7);" ],
[ 1718.478476026, 'me', "~tste.stop(7);" ],
[ 1737.131602434, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar([60,67,63,72,48,72+12].midicps*[1,2,1.5]/0.5pi*[1,1.5,2,4,0.5,1.25]);
  sig = BPF.ar(sig,SinOsc.ar(0.1).range(50,100)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,4);
  Splay.ar(sig.flat,0.25,0.25);
};
~sigg.play;
);" ],
[ 1757.887930222, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar([60,67,63,72,48,72+12].midicps*[1,2,1.5]/0.5pi*[1,1.5,2,4,0.5,1.25]);
  sig = BPF.ar(sig,SinOsc.ar(0.1).range(50,100)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.25);
};
~sigg.play;
);" ],
[ 1761.918883751, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar([60,67,63,72,48,72+12].midicps*[1,2]/0.5pi*[1,1.5,2,4,0.5,1.25]);
  sig = BPF.ar(sig,SinOsc.ar(0.1).range(50,100)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.25);
};
~sigg.play;
);" ],
[ 1763.82065772, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar([60,67,63,72,48,72+12].midicps*[1,4]/0.5pi*[1,1.5,2,4,0.5,1.25]);
  sig = BPF.ar(sig,SinOsc.ar(0.1).range(50,100)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.25);
};
~sigg.play;
);" ],
[ 1768.555748468, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar([60,67,63,72,48,72+12].midicps*[1,8]/0.5pi*[1,1.5,2,4,0.5,1.25]);
  sig = BPF.ar(sig,SinOsc.ar(0.1).range(50,100)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.25);
};
~sigg.play;
);" ],
[ 1784.287089322, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar([60,67,63,72,48,72+12].midicps*[1,4]/0.5pi*[1,1.5,2,4,0.5,1.25]);
  sig = BPF.ar(sig,SinOsc.ar(0.1).range(50,100)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.25);
};
~sigg.play;
);" ],
[ 1837.51238281, 'me', "thisProcess.stop;" ],
[ 1858.711442286, 'me', "s.prepareForRecord(\"/tmp/rec.aiff\");" ],
[ 1866.716143003, 'me', "s.record" ],
[ 1868.385198421, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar([60,67,63,72,48,72+12].midicps*[1,4]/0.5pi*[1,1.5,2,4,0.5,1.25]);
  sig = BPF.ar(sig,SinOsc.ar(0.1).range(50,100)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.25);
};
~sigg.play;
);" ],
[ 1888.725834357, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar([60,67,63,72,48,72+12].midicps*[1,4]/0.5pi*[1,1.5,2,4,0.5,1.25]);
  sig = BPF.ar(sig,SinOsc.ar(0.1).range(50,200)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.25);
};
~sigg.play;
);" ],
[ 1894.802286547, 'me', "thisProcess.stop;" ],
[ 2402.065574033, 'me', "s.stopRecording" ],
[ 2405.16014514, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar([60,67,63,72,48,72+12].midicps*[1,4]/0.5pi*[1,1.5,2,4,0.5,1.25]);
  sig = BPF.ar(sig,SinOsc.ar(0.1).range(50,200)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.25);
};
~sigg.play;
);" ],
[ 2422.156241201, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar([60,67,63,72,48,72+12].midicps*[1,4]/0.5pi*[1,1.5,2,4,0.5,1.25]);
  sig = BPF.ar(sig,SinOsc.ar(0.1).range(50,400)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.25);
};
~sigg.play;
);" ],
[ 2432.891739481, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar([60,67,63,72,48,72+12].midicps*[1,4]/0.5pi*[1,1.5,2,4,0.5,1.25]);
  sig = BPF.ar(sig,SinOsc.ar(0.1).range(50,4000)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.25);
};
~sigg.play;
);" ],
[ 2437.051621821, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar([60,67,63,72,48,72+12].midicps*[1,4]/0.5pi*[1,1.5,2,4,0.5,1.25]);
  sig = BPF.ar(sig,SinOsc.ar(0.1).range(50,400)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.25);
};
~sigg.play;
);" ],
[ 2446.797918369, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar([60,67,63,72,48,72+12].midicps*[1,4]/0.5pi*[1,1.5,2,4,0.5,1.25]);
  sig = BPF.ar(sig,SinOsc.ar(1/8).range(50,400)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.25);
};
~sigg.play;
);" ],
[ 2449.584959882, 'me', "(
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar([60,67,63,72,48,72+12].midicps*[1,4]/0.5pi*[1,1.5,2,4,0.5,1.25]);
  sig = BPF.ar(sig,SinOsc.ar(1).range(50,400)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.25);
};
~sigg.play;
);" ],
[ 2461.047680871, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar([60,67,63,72,48,72+12].midicps*[1,4]/0.5pi*[1,1.5,2,4,0.5,1.25]);
  sig = BPF.ar(sig,SinOsc.ar(1).range(50,800)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.25);
};
~sigg.play;
);" ],
[ 2470.916986256, 'me', "(
~tste.quant=2;
~tste.fadeTime=5;
~tste={
  var sig = Crackle.ar(2!2);
  sig = BPF.ar(sig, LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*4000+1400) * Pulse.ar([1,2,3,4]/2);
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.05);
};
~tste.play;
);" ],
[ 2489.620379198, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar([60,67,63,72,48,72+12].midicps*[1,4]/0.5pi*[1,1.5,2,4,0.5,1.25]);
  sig = BPF.ar(sig,SinOsc.ar(1/4).range(50,800)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.25);
};
~sigg.play;
);" ],
[ 2502.469197281, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar([60,67,63,72,48,72+12].midicps*[1,4]/0.5pi*[1,1.5,2,4,0.5,1.25]);
  sig = BPF.ar(sig,SinOsc.ar(1/4).range(50,800)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.025);
};
~sigg.play;
);" ],
[ 2511.552184792, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar([60,67,63,72,48,72+12].midicps*[1,4]/0.5pi*[1,1.5,2,4,0.5,1.25]);
  sig = BPF.ar(sig,SinOsc.ar(1/4).range(50,800)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.125);
};
~sigg.play;
);" ],
[ 2655.025081626, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(([60,67,63,72,48,72+12]-12).midicps*[1,4]/0.5pi*[1,1.5,2,4,0.5,1.25]);
  sig = BPF.ar(sig,SinOsc.ar(1/4).range(50,800)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.125);
};
~sigg.play;
);" ],
[ 2662.375472325, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(([60,67,63,72,48,72+12]-12).midicps*[1,2]/0.5pi*[1,1.5,2,4,0.5,1.25]);
  sig = BPF.ar(sig,SinOsc.ar(1/4).range(50,800)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.125);
};
~sigg.play;
);" ],
[ 2673.434821479, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(([60,67,63,72,48,72+12]-12).midicps*[1,2]/0.5pi*[1,1.5,2,4,0.5,1.25]);
  sig = BPF.ar(sig,SinOsc.ar(1/4).range(50,600)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.125);
};
~sigg.play;
);" ],
[ 2676.388503935, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(([60,67,63,72,48,72+12]-12).midicps*[1,2]/0.5pi*[1,1.5,2,4,0.5,1.25]);
  sig = BPF.ar(sig,SinOsc.ar(1/4).range(50,1600)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.125);
};
~sigg.play;
);" ],
[ 2681.969990682, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(([60,67,63,72,48,72+12]-12).midicps*[1,2]/0.5pi*[1,1.5,2,4,0.5,1.25]);
  sig = BPF.ar(sig,SinOsc.ar(1/4).range(50,600)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.125);
};
~sigg.play;
);" ],
[ 2692.704781034, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(([60,67,63,72,48,72+12]-12).midicps*[1,2]/0.5pi*[1,1.5,2,4,0.5,1.25]);
  sig = BPF.ar(sig,SinOsc.ar(1/4).range(50,400)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.125);
};
~sigg.play;
);" ],
[ 2697.116972602, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(([60,67,63,72,48,72+12]).midicps*[1,2]/0.5pi*[1,1.5,2,4,0.5,1.25]);
  sig = BPF.ar(sig,SinOsc.ar(1/4).range(50,400)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.125);
};
~sigg.play;
);" ],
[ 2714.704584765, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(([60,67,63,72,48,72+12]).midicps*[1,2]/0.25pi*[1,1.5,2,4,0.5,1.25]);
  sig = BPF.ar(sig,SinOsc.ar(1/4).range(50,400)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.125);
};
~sigg.play;
);" ],
[ 2735.197597642, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(([60,67,63,72,48,72+12]).midicps*[1,2]/1pi*[1,1.5,2,4,0.5,1.25]);
  sig = BPF.ar(sig,SinOsc.ar(1/4).range(50,400)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.125);
};
~sigg.play;
);" ],
[ 2754.733883814, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(([60,67,63,72,48,72+12]).midicps*[1,4]/1pi*[1,1.5,2,4,0.5,1.25]);
  sig = BPF.ar(sig,SinOsc.ar(1/4).range(50,400)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.125);
};
~sigg.play;
);" ],
[ 2757.984020981, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(([60,67,63,72,48,72+12]).midicps*[1,4]/1pi*[1,1.5,2,4,0.5,1.5]);
  sig = BPF.ar(sig,SinOsc.ar(1/4).range(50,400)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.125);
};
~sigg.play;
);" ],
[ 2766.04283601, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(([60,67,63,72,48,72+12].scramble).midicps*[1,4]/1pi*[1,1.5,2,4,0.5,1.5]);
  sig = BPF.ar(sig,SinOsc.ar(1/4).range(50,400)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.125);
};
~sigg.play;
);" ],
[ 2775.853821983, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(([60,67,63,72,48,72+12].scramble).midicps*[1,4]/0.5pi*[1,1.5,2,4,0.5,1.5]);
  sig = BPF.ar(sig,SinOsc.ar(1/4).range(50,400)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.125);
};
~sigg.play;
);" ],
[ 2797.101746346, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(([60,67,63,72,48,72+12].scramble).midicps*[1,4]/0.5pi*[1,1.5,2,4,0.5,1.5]);
  sig = BPF.ar(sig,SinOsc.ar(11).range(50,400)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.125);
};
~sigg.play;
);" ],
[ 2806.289262704, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(([60,67,63,72,48,72+12].scramble).midicps*[1,4]/0.5pi*[1,1.5,2,4,0.5,1.5]);
  sig = BPF.ar(sig,SinOsc.ar(11/fib(8)).range(50,400)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.125);
};
~sigg.play;
);" ],
[ 2810.829144689, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(([60,67,63,72,48,72+12].scramble).midicps*[1,4]/0.5pi*[1,1.5,2,4,0.5,1.5]);
  sig = BPF.ar(sig,SinOsc.ar(10/fib(8)).range(50,400)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.125);
};
~sigg.play;
);" ],
[ 2814.171025473, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(([60,67,63,72,48,72+12].scramble).midicps*[1,4]/0.5pi*[1,1.5,2,4,0.5,1.5]);
  sig = BPF.ar(sig,SinOsc.ar(100/fib(8)).range(50,400)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.125);
};
~sigg.play;
);" ],
[ 2818.101638531, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(([60,67,63,72,48,72+12].scramble).midicps*[1,4]/0.5pi*[1,1.5,2,4,0.5,1.5]);
  sig = BPF.ar(sig,SinOsc.ar(10/fib(8)).range(50,400)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.125);
};
~sigg.play;
);" ],
[ 2820.909752273, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(([60,67,63,72,48,72+12].scramble).midicps*[1,4]/0.5pi*[1,1.5,2,4,0.5,1.5]);
  sig = BPF.ar(sig,SinOsc.ar(4/fib(8)).range(50,400)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.125);
};
~sigg.play;
);" ],
[ 2825.394983967, 'me', "~tste.stop(7);" ],
[ 2835.330261545, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(([60,67,63,72,48,72+12].scramble).midicps*[1,4]/0.5pi*[1,1.5,2,4,0.5,1.5]);
  sig = BPF.ar(sig,SinOsc.ar(1/4/fib(8)).range(50,400)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.125);
};
~sigg.play;
);" ],
[ 2839.055000452, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(([60,67,63,72,48,72+12].scramble).midicps*[1,4]/0.5pi*[1,1.5,2,4,0.5,1.5]);
  sig = BPF.ar(sig,SinOsc.ar(1/4/fib(5)).range(50,400)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.125);
};
~sigg.play;
);" ],
[ 2845.398108301, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(([60,67,63,72,48,72+12].scramble).midicps*[1,4]/0.5pi*[1,1.5,2,4,0.5,1.5]);
  sig = BPF.ar(sig,SinOsc.ar(1/4/fib(5)).range(50,1400)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.125);
};
~sigg.play;
);" ],
[ 2858.64524544, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(([60,67,63,72,48,72+12].scramble).midicps*[1,4]/0.5pi*[1,1.5,2,4,0.5,1.5]);
  sig = BPF.ar(sig,SinOsc.ar(4/fib(5)).range(50,1400)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.125);
};
~sigg.play;
);" ],
[ 2865.920814062, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(([60,67,63,72,48,72+12].scramble).midicps*[1,4]/0.5pi*[1,1.5,2,4,0.5,1.5]);
  sig = BPF.ar(sig,SinOsc.ar(8/fib(5)).range(50,1400)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.125);
};
~sigg.play;
);" ],
[ 2873.082476145, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(([60,67,63,72,48,72+12].scramble).midicps*[1,4]/0.5pi*[1,1.5,2,4,0.5,1.5]);
  sig = BPF.ar(sig,SinOsc.ar(80/fib(5)).range(50,1400)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.125);
};
~sigg.play;
);" ],
[ 2876.847868635, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(([60,67,63,72,48,72+12].scramble).midicps*[1,4]/0.5pi*[1,1.5,2,4,0.5,1.5]);
  sig = BPF.ar(sig,SinOsc.ar(80/fib(5)).range(50,400)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.125);
};
~sigg.play;
);" ],
[ 2878.975506894, 'me', "thisProcess.stop;" ],
[ 3189.757373361, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(([60,67,63,72,48,72+12].scramble).midicps*[1,4]/0.5pi*[1,1.5,2,4,0.5,1.5]);
  sig = BPF.ar(sig,SinOsc.ar(80/fib(5)).range(50,400)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.125);
};
~sigg.play;
);" ],
[ 3202.995361303, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(([60,67,63,72,48,72+12].scramble).midicps*[1,4]/0.5pi*[1,1.5,2,4,0.5,1.5]);
  sig = BPF.ar(sig,SinOsc.ar(80/fib(5)).range(50,1200)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.125);
};
~sigg.play;
);" ],
[ 3207.561693615, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(([60,67,63,72,48,72+12].scramble).midicps*[1,4]/0.5pi*[1,1.5,2,4,0.5,1.5]);
  sig = BPF.ar(sig,SinOsc.ar(80/fib(5)).range(50,900)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.125);
};
~sigg.play;
);" ],
[ 3211.15289461, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(([60,67,63,72,48,72+12].scramble).midicps*[1,4]/0.5pi*[1,1.5,2,4,0.5,1.5]);
  sig = BPF.ar(sig,SinOsc.ar(80/fib(5)).range(50,400)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.125);
};
~sigg.play;
);" ],
[ 3217.984977859, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(([60,67,63,72,48,72+12].scramble-12).midicps*[1,4]/0.5pi*[1,1.5,2,4,0.5,1.5]);
  sig = BPF.ar(sig,SinOsc.ar(80/fib(5)).range(50,400)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.125);
};
~sigg.play;
);" ],
[ 3221.082219876, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(([60,67,63,72,48,72+12].scramble-12).midicps*[1,2]/0.5pi*[1,1.5,2,4,0.5,1.5]);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.125);
};
~sigg.play;
);" ],
[ 3225.307939283, 'me', "thisProcess.stop;" ],
[ 3230.123991533, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(([60,67,63,72,48,72+12].scramble-12).midicps*[1,2]/0.5pi*[1,1.5,2,4,0.5,1.5]);
  sig = BPF.ar(sig,SinOsc.ar(80/fib(5)).range(50,400)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.125);
};
~sigg.play;
);" ],
[ 3251.900977954, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(([60,67,63,72,48,72+12].scramble-12).midicps*[1,4]/0.5pi*[1,1.5,2,4,0.5,1.5]);
  sig = BPF.ar(sig,SinOsc.ar(80/fib(5)).range(50,400)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.125);
};
~sigg.play;
);" ],
[ 3260.261309708, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(([60,67,63,72,48,72+12].scramble-12).midicps*[1,4]/0.25pi*[1,1.5,2,4,0.5,1.5]);
  sig = BPF.ar(sig,SinOsc.ar(80/fib(5)).range(50,400)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.125);
};
~sigg.play;
);" ],
[ 3264.205632314, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(([60,67,63,72,48,72+12].scramble-12).midicps*[1,4]/0.25pi*[1,1.5,2,4,0.5,1.5]);
  sig = BPF.ar(sig,SinOsc.ar(8/fib(5)).range(50,400)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.125);
};
~sigg.play;
);" ],
[ 3268.084700475, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(([60,67,63,72,48,72+12].scramble-12).midicps*[1,4]/0.25pi*[1,1.5,2,4,0.5,1.5]);
  sig = BPF.ar(sig,SinOsc.ar(20/fib(5)).range(50,400)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.125);
};
~sigg.play;
);" ],
[ 3292.293861557, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(([60,67,63,72,48,72+12].scramble-12).midicps*[1,4]/0.25pi*[1,1.5,2,4,0.5,1.5]);
  sig = BPF.ar(sig,SinOsc.ar(20/fib(5)).range(50,400),2) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.125);
};
~sigg.play;
);" ],
[ 3298.820743022, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(([60,67,63,72,48,72+12].scramble-12).midicps*[1,4]/0.25pi*[1,1.5,2,4,0.5,1.5]);
  sig = BPF.ar(sig,SinOsc.ar(20/fib(5)).range(50,400),0.1) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.125);
};
~sigg.play;
);" ],
[ 3309.374072363, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(([60,67,63,72,48,72+12].scramble-12).midicps*[1,4]/0.25pi*[1,1.5,2,4,0.5,1.5]);
  sig = BPF.ar(sig,SinOsc.ar(20/fib(5)).range(50,400),LFSaw.ar(1/4).exprange(0.001,1)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.125);
};
~sigg.play;
);" ],
[ 3321.008367672, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(([60,67,63,72,48,72+12].scramble-12).midicps*[1,4]/0.25pi*[1,1.5,2,4,0.5,1.5]);
  sig = BPF.ar(sig,SinOsc.ar(20/fib(5)).range(50,400),LFSaw.ar(1/4).exprange(0.001,2)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.125);
};
~sigg.play;
);" ],
[ 3331.452488789, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(([60,67,63,72,48,72+12].scramble-12).midicps*[1,4]/0.25pi*[1,1.5,2,4,0.5,1.5]);
  sig = BPF.ar(sig,SinOsc.ar(20/fib(5)).range(50,400),LFSaw.ar(1/4/fib(4)).exprange(0.001,2)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8);
  Splay.ar(sig.flat,0.25,0.125);
};
~sigg.play;
);" ],
[ 3342.765071831, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(([60,67,63,72,48,72+12].scramble-12).midicps*[1,4]/0.25pi*[1,1.5,2,4,0.5,1.5]);
  sig = BPF.ar(sig,SinOsc.ar(20/fib(5)).range(50,400),LFSaw.ar(1/4/fib(4)).exprange(0.001,2)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8)/4+sig;
  Splay.ar(sig.flat,0.25,0.125);
};
~sigg.play;
);" ],
[ 3361.48905203, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(([60,67,63,72,48,72+12].scramble-12).midicps*[1,4]/0.25pi*[1,1.5,2,4,0.5,1.5]);
  sig = BPF.ar(sig,SinOsc.ar(20/fib(5)).range(50,400),LFSaw.ar(1/4/fib(4)).exprange(0.001,2)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.125);
};
~sigg.play;
);" ],
[ 3378.319043735, 'me', "(
~sigg.quant=2;
~sigg.fadeTime=5;
~sigg={
  var sig = LFSaw.ar(([60,67,63,72,48,72+12].scramble-24).midicps*[1,4]/0.25pi*[1,1.5,2,4,0.5,1.5]);
  sig = BPF.ar(sig,SinOsc.ar(20/fib(5)).range(50,400),LFSaw.ar(1/4/fib(4)).exprange(0.001,2)) * LFSaw.ar(1/4/fib(5)).exprange(0.001,1);
  sig = GVerb.ar(sig,8)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.125);
};
~sigg.play;
);" ],
[ 3396.804281679, 'me', "thisProcess.stop;" ],
[ 4864.719874645, 'me', "(
~in.quant=2;
~in.fadeTime=5;
~in={
  var sig = AudioIn.ar(0!2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~in.play;
);" ],
[ 4871.207045111, 'me', "(
~in.quant=2;
~in.fadeTime=5;
~in={
  var sig = AudioIn.ar([0,1]);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~in.play;
);" ],
[ 4896.900238194, 'me', "(
~in.quant=2;
~in.fadeTime=5;
~in={
  var sig = AudioIn.ar([0,1]);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.95);
};
~in.play;
);" ],
[ 5058.137531325, 'me', "thisProcess.stop;" ],
[ 5073.104148735, 'me', "(
~in.quant=2;
~in.fadeTime=5;
~in={
  var sig = AudioIn.ar([0,1]);
  sig = SinOsc.ar(4000) * Decay.ar(Changed.ar(sig,0.001));
  Splay.ar(sig.flat,0.25,0.95);
};
~in.play;
);" ],
[ 5076.267482466, 'me', "thisProcess.stop;" ],
[ 5086.555965231, 'me', "(
~in.quant=2;
~in.fadeTime=5;
~in={
  var sig = AudioIn.ar([0,1]);
  sig = SinOsc.ar(4000) * Decay.ar(Changed.ar(sig,0.001));
  Splay.ar(sig.flat,0.25,0.15);
};
~in.play;
);" ],
[ 5088.408986846, 'me', "thisProcess.stop;" ],
[ 5094.155023056, 'me', "thisProcess.stop;" ],
[ 5095.461357989, 'me', "~in.stop(7);" ],
[ 5101.450283556, 'me', "(
~in.quant=2;
~in.fadeTime=5;
~in={
  var sig = AudioIn.ar([0,1]);
  sig = SinOsc.ar(4000) * Decay.ar(Changed.ar(sig,0.001));
  Splay.ar(sig.flat,0.25,0.015);
};
~in.play;
);" ],
[ 5103.896262074, 'me', "thisProcess.stop;" ],
[ 5112.303143648, 'me', "(
~in.quant=2;
~in.fadeTime=0.01;
~in={
  var sig = AudioIn.ar([0,1]);
  sig = SinOsc.ar(4000) * Decay.ar(Changed.ar(sig,0.001));
  Splay.ar(sig.flat,0.25,0.015);
};
~in.play;
);" ],
[ 5114.074723382, 'me', "thisProcess.stop;" ],
[ 5118.017394671, 'me', "(
~in.quant=2;
~in.fadeTime=0.01;
~in={
  var sig = AudioIn.ar([0,1]);
  sig = SinOsc.ar(40) * Decay.ar(Changed.ar(sig,0.001));
  Splay.ar(sig.flat,0.25,0.015);
};
~in.play;
);" ],
[ 5119.972255318, 'me', "thisProcess.stop;" ],
[ 5128.536736875, 'me', "(
~in.quant=2;
~in.fadeTime=0.01;
~in={
  var sig = AudioIn.ar([0,1]);
  sig = SinOsc.ar(40) * Decay.ar(Changed.ar(sig,0.001));
  Splay.ar(sig.flat,0.25,0.015);
};
~in.play;
);" ],
[ 5136.708876483, 'me', "(
~in.quant=2;
~in.fadeTime=0.01;
~in={
  var sig = AudioIn.ar([0,1]);
  sig = SinOsc.ar(40) * Decay.ar(Changed.ar(sig,0.0001));
  Splay.ar(sig.flat,0.25,0.015);
};
~in.play;
);" ],
[ 5139.666703996, 'me', "(
~in.quant=2;
~in.fadeTime=0.01;
~in={
  var sig = AudioIn.ar([0,1]);
  sig = SinOsc.ar(40) * Decay.ar(Changed.ar(sig,0.00001));
  Splay.ar(sig.flat,0.25,0.015);
};
~in.play;
);" ],
[ 5141.377407803, 'me', "(
~in.quant=2;
~in.fadeTime=0.01;
~in={
  var sig = AudioIn.ar([0,1]);
  sig = SinOsc.ar(40) * Decay.ar(Changed.ar(sig,0.000001));
  Splay.ar(sig.flat,0.25,0.015);
};
~in.play;
);" ],
[ 5143.19967983, 'me', "(
~in.quant=2;
~in.fadeTime=0.01;
~in={
  var sig = AudioIn.ar([0,1]);
  sig = SinOsc.ar(40) * Decay.ar(Changed.ar(sig,0.0000001));
  Splay.ar(sig.flat,0.25,0.015);
};
~in.play;
);" ],
[ 5145.308508813, 'me', "(
~in.quant=2;
~in.fadeTime=0.01;
~in={
  var sig = AudioIn.ar([0,1]);
  sig = SinOsc.ar(40) * Decay.ar(Changed.ar(sig,0.00000001));
  Splay.ar(sig.flat,0.25,0.015);
};
~in.play;
);" ],
[ 5153.210260843, 'me', "(
~in.quant=2;
~in.fadeTime=0.01;
~in={
  var sig = AudioIn.ar([0,1]);
  sig = SinOsc.ar(40) * Decay.ar(Changed.ar(sig,0.2).poll);
  Splay.ar(sig.flat,0.25,0.015);
};
~in.play;
);" ],
[ 5160.425471654, 'me', "(
~in.quant=2;
~in.fadeTime=0.01;
~in={
  var sig = AudioIn.ar([0,1]);
  sig = SinOsc.ar(40) * Decay.ar(Changed.ar(sig,0.02).poll);
  Splay.ar(sig.flat,0.25,0.015);
};
~in.play;
);" ],
[ 5165.186537363, 'me', "(
~in.quant=2;
~in.fadeTime=0.01;
~in={
  var sig = AudioIn.ar([0,1]);
  sig = SinOsc.ar(40) * Decay.ar(Changed.ar(sig*10,0.02).poll);
  Splay.ar(sig.flat,0.25,0.015);
};
~in.play;
);" ],
[ 5167.490345724, 'me', "(
~in.quant=2;
~in.fadeTime=0.01;
~in={
  var sig = AudioIn.ar([0,1]);
  sig = SinOsc.ar(40) * Decay.ar(Changed.ar(sig*10,0.2).poll);
  Splay.ar(sig.flat,0.25,0.015);
};
~in.play;
);" ],
[ 5179.85009921, 'me', "(
~in.quant=2;
~in.fadeTime=0.01;
~in={
  var sig = AudioIn.ar([0,1]);
  sig = SinOsc.ar(40) * Decay.ar(Changed.ar(sig*10,0.1).poll);
  Splay.ar(sig.flat,0.25,0.015);
};
~in.play;
);" ],
[ 5190.350837392, 'me', "(
~in.quant=2;
~in.fadeTime=0.01;
~in={
  var sig = AudioIn.ar([0,1]);
  sig = SinOsc.ar(40) * Decay.ar(Changed.ar(sig*10,0.05).poll);
  Splay.ar(sig.flat,0.25,0.015);
};
~in.play;
);" ],
[ 5208.976089769, 'me', "(
~in.quant=2;
~in.fadeTime=0.01;
~in={
  var sig = AudioIn.ar([0,1]);
  sig = SinOsc.ar(40) * Decay.ar(Changed.ar(sig*20,0.05).poll);
  Splay.ar(sig.flat,0.25,0.015);
};
~in.play;
);" ],
[ 5215.968437892, 'me', "(
~in.quant=2;
~in.fadeTime=0.01;
~in={
  var sig = AudioIn.ar([0,1]);
  sig = SinOsc.ar(40) * Decay.ar(Changed.ar(sig*5,0.05).poll);
  Splay.ar(sig.flat,0.25,0.015);
};
~in.play;
);" ],
[ 5245.787961741, 'me', "(
~in.quant=2;
~in.fadeTime=0.01;
~in={
  var sig = AudioIn.ar([0,1]);
  sig = SinOsc.ar(40) * Decay.ar(Changed.ar(sig*10,0.05).poll);
  Splay.ar(sig.flat,0.25,0.15);
};
~in.play;
);" ],
[ 5252.226797889, 'me', "(
~in.quant=2;
~in.fadeTime=0.01;
~in={
  var sig = AudioIn.ar([0,1]);
  sig = SinOsc.ar(40) * Decay.ar(Changed.ar(sig*10,0.05).poll);
  Splay.ar(sig.flat,0.25,0.05);
};
~in.play;
);" ],
[ 5271.071237625, 'me', "(
~in.quant=2;
~in.fadeTime=0.01;
~in={
  var sig = AudioIn.ar([0,1]);
  sig = SinOsc.ar(40) * Decay.ar(Changed.ar(sig*10,0.0005).poll);
  Splay.ar(sig.flat,0.25,0.05);
};
~in.play;
);" ],
[ 5279.955944388, 'me', "(
~in.quant=2;
~in.fadeTime=0.01;
~in={
  var sig = AudioIn.ar([0,1]);
  sig = SinOsc.ar(40) * Decay.ar(Changed.ar(sig*10,0.005).poll);
  Splay.ar(sig.flat,0.25,0.05);
};
~in.play;
);" ],
[ 5287.528126057, 'me', "(
~in.quant=2;
~in.fadeTime=0.01;
~in={
  var sig = AudioIn.ar([0,0]);
  sig = SinOsc.ar(40) * Decay.ar(Changed.ar(sig*10,0.005).poll);
  Splay.ar(sig.flat,0.25,0.05);
};
~in.play;
);" ],
[ 5365.090460002, 'me', "thisProcess.stop;" ],
[ 5402.890219703, 'me', "(
~in.quant=2;
~in.fadeTime=0.01;
~in={
  var sig = AudioIn.ar(1!2);
  sig = SinOsc.ar(40) * Amplitude.ar(sig);
  Splay.ar(sig.flat,0.25,0.05);
};
~in.play;
);" ],
[ 5407.652205065, 'me', "(
~in.quant=2;
~in.fadeTime=0.01;
~in={
  var sig = AudioIn.ar(1!2);
  sig = SinOsc.ar(40) * Amplitude.ar(sig)*10;
  Splay.ar(sig.flat,0.25,0.05);
};
~in.play;
);" ],
[ 5409.790100522, 'me', "(
~in.quant=2;
~in.fadeTime=0.01;
~in={
  var sig = AudioIn.ar(1!2);
  sig = SinOsc.ar(40) * Amplitude.ar(sig)*100;
  Splay.ar(sig.flat,0.25,0.05);
};
~in.play;
);" ],
[ 5411.465006223, 'me', "(
~in.quant=2;
~in.fadeTime=0.01;
~in={
  var sig = AudioIn.ar(1!2);
  sig = SinOsc.ar(40) * Amplitude.ar(sig)*1000;
  Splay.ar(sig.flat,0.25,0.05);
};
~in.play;
);" ],
[ 5418.12766936, 'me', "(
~in.quant=2;
~in.fadeTime=0.01;
~in={
  var sig = AudioIn.ar(1!2);
  sig = SinOsc.ar(40) * Amplitude.ar(sig)*10000;
  Splay.ar(sig.flat,0.25,0.05);
};
~in.play;
);" ],
[ 5452.407123878, 'me', "(
~in.quant=2;
~in.fadeTime=0.01;
~in={
  var sig = BPF.ar(AudioIn.ar(1!2),20000);
  sig = SinOsc.ar(40) * Amplitude.ar(sig)*100000;
  Splay.ar(sig.flat,0.25,0.05);
};
~in.play;
);" ],
[ 5471.734545237, 'me', "(
~in.quant=2;
~in.fadeTime=0.01;
~in={
  var sig = BPF.ar(AudioIn.ar(1!2),20000);
  sig = SinOsc.ar(40) * Amplitude.ar(sig).exprange(0.0001,1)*100000;
  Splay.ar(sig.flat,0.25,0.05);
};
~in.play;
);" ],
[ 5474.904618136, 'me', "(
~in.quant=2;
~in.fadeTime=0.01;
~in={
  var sig = BPF.ar(AudioIn.ar(1!2),20000);
  sig = SinOsc.ar(40) * Amplitude.ar(sig).exprange(0.0001,2)*100000;
  Splay.ar(sig.flat,0.25,0.05);
};
~in.play;
);" ],
[ 5481.192317626, 'me', "thisProcess.stop;" ],
[ 5649.959596822, 'me', "(
~in.quant=2;
~in.fadeTime=0.01;
~in={
  var sig = AudioIn.ar(1!2);
  sig = SinOsc.ar(40) * Amplitude.ar(sig).exprange(0.0001,2)*100000;
  Splay.ar(sig.flat,0.25,0.05);
};
~in.play;
);" ],
[ 5659.34728841, 'me', "(
~in.quant=2;
~in.fadeTime=0.01;
~in={
  var sig = AudioIn.ar(1!2);
  //sig = SinOsc.ar(40) * Amplitude.ar(sig).exprange(0.0001,2)*100000;
  Splay.ar(sig.flat,0.25,0.05);
};
~in.play;
);" ],
