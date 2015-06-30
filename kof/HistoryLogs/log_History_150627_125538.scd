// History, as it was on Sat Jun 27 12:55:38 2015.

[
[ 0, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var sig = SinOsc.ar(57+(1..8),mul:0.2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 17.140472736, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var sig = SinOsc.ar(97+(1..8),mul:0.2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 42.023743196, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var sig = SinOsc.ar(97+(1..8),mul:0.2);
  sig = AllpassC.ar(sig,1/4,1/4,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 52.514081522, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var sig = SinOsc.ar(97+(1..8),mul:0.2);
  sig = sig * Pulse.ar(4);
  sig = AllpassC.ar(sig,1/4,1/4,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 80.199407193, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Pulse.ar(4);
  var sig = SinOsc.ar(97+(1..8)+puls,mul:0.2);
  sig = sig * puls;
  sig = AllpassC.ar(sig,1/4,1/4,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 94.32062632, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Pulse.ar(4);
  var sig = SinOsc.ar(97+(1..8)+puls.range(0,200),mul:0.2);
  sig = sig * puls;
  sig = AllpassC.ar(sig,1/4,1/4,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 100.090930401, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Pulse.ar(4);
  var sig = SinOsc.ar(97+(1..8)+puls.range(0,120),mul:0.2);
  sig = sig * puls;
  sig = AllpassC.ar(sig,1/4,1/4,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 106.436237085, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Pulse.ar(4);
  var sig = SinOsc.ar(97+(1..8)+(puls.range(0,120)**2),mul:0.2);
  sig = sig * puls;
  sig = AllpassC.ar(sig,1/4,1/4,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 111.782346383, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Pulse.ar(4);
  var sig = SinOsc.ar(97+(1..8)+(puls.range(0,12)**2),mul:0.2);
  sig = sig * puls;
  sig = AllpassC.ar(sig,1/4,1/4,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 122.589222125, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Pulse.ar(4/fib(8));
  var sig = SinOsc.ar(97+(1..8)+(puls.range(0,12)**2),mul:0.2);
  sig = sig * puls;
  sig = AllpassC.ar(sig,1/4,1/4,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 135.937377443, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Pulse.ar(8/fib(8));
  var sig = SinOsc.ar(97+(1..8)+(puls.range(0,12)**2),mul:0.2);
  sig = sig * puls;
  sig = AllpassC.ar(sig,1/4,1/4,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 142.721844783, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Pulse.ar(8/fib(8));
  var sig = SinOsc.ar(97+(1..8)+(puls.range(0,4)**2),mul:0.2);
  sig = sig * puls;
  sig = AllpassC.ar(sig,1/4,1/4,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 153.081306557, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Pulse.ar(1/fib(8));
  var sig = SinOsc.ar(97+(1..8)+(puls.range(0,4)**2),mul:0.2);
  sig = sig * puls;
  sig = AllpassC.ar(sig,1/4,1/4,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 161.117343735, 'me', "thisProcess.stop;" ],
[ 168.784669929, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Pulse.ar(1/fib(8));
  var sig = SinOsc.ar(97+(1..8)+(puls.range(0,4)**2),mul:0.2);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1/4,1/4,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 176.050050081, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Pulse.ar(4);
  var sig = SinOsc.ar(97+(1..8)+(puls.range(0,4)**2),mul:0.2);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1/4,1/4,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 190.677285299, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Pulse.ar(4) + BrownNoise.ar(0.1!2);
  var sig = SinOsc.ar(97+(1..8)+(puls.range(0,4)**2),mul:0.2);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1/4,1/4,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 199.475038015, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Pulse.ar(4) + BrownNoise.ar(0.5!2);
  var sig = SinOsc.ar(97+(1..8)+(puls.range(0,4)**2),mul:0.2);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1/4,1/4,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 207.106235943, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Pulse.ar(4) + BrownNoise.ar(0.3!2);
  var sig = SinOsc.ar(97+(1..8)+(puls.range(0,4)**2),mul:0.2);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1/4,1/4,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 213.870238679, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Pulse.ar(4) + BrownNoise.ar(0.3!2);
  var sig = SinOsc.ar(97+(1..8)+(puls.range(0,40)**2),mul:0.2);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1/4,1/4,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 218.001443128, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Pulse.ar(4) + BrownNoise.ar(0.3!2);
  var sig = SinOsc.ar(97+(1..8)+(puls.range(0,20)**2),mul:0.2);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1/4,1/4,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 223.242867247, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Pulse.ar(4) + BrownNoise.ar(0.3!2);
  var sig = SinOsc.ar(97+(1..8)+(puls.range(0,10)**2),mul:0.2);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1/4,1/4,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 230.235409104, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Pulse.ar(4) + BrownNoise.ar(0.3!2);
  var sig = SinOsc.ar(97+(1..8)+(puls.range(0,3)**2),mul:0.2);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1/4,1/4,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 238.19761517, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Pulse.ar(4*[1,2,4]) + BrownNoise.ar(0.3!2);
  var sig = SinOsc.ar(97+(1..8)+(puls.range(0,3)**2),mul:0.2);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1/4,1/4,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 247.158406861, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Pulse.ar([1,2,3,4]) + BrownNoise.ar(0.3!2);
  var sig = SinOsc.ar(97+(1..8)+(puls.range(0,3)**2),mul:0.2);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1/4,1/4,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 255.947314654, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Pulse.ar([1,2,3,4]) + BrownNoise.ar(0.3!2);
  var sig = SinOsc.ar(97+(1..8)+(puls.range(0,3)**2),mul:0.2);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1/2,1/4,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 288.027816198, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)/4),1);
  var sig = SinOsc.ar(97+(1..8)+(puls.range(0,3)**2),mul:0.2);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1/2,1/4,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 299.044312247, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)/4),1);
  var sig = SinOsc.ar(97+(1..8)+(puls.range(0,10)**2),mul:0.2);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1/2,1/4,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 309.003518268, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)/4),1);
  var sig = SinOsc.ar(97+(1..8)+(puls.range(0,10)**3),mul:0.2);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1/2,1/4,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 314.696977545, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)/4),1);
  var sig = SinOsc.ar(97+(1..8)+(puls.range(0,5)**3),mul:0.2);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1/2,1/4,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 324.094533379, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),1);
  var sig = SinOsc.ar(97+(1..8)+(puls.range(0,5)**3),mul:0.2);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1/2,1/4,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 328.913144285, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.75);
  var sig = SinOsc.ar(97+(1..8)+(puls.range(0,5)**3),mul:0.2);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1/2,1/4,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 331.659305185, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.75);
  var sig = SinOsc.ar(97+(1..8)+(puls.range(0,5)**3),mul:0.4);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1/2,1/4,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 337.042908511, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.75);
  var sig = SinOsc.ar(97+(1..8)+(puls.range(0,5)**3),mul:0.4);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1/4,1/8,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 348.564271585, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.75);
  var sig = SinOsc.ar(97+(1..8)+(puls.range(0,5)**3),mul:0.4);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1/4,1/4,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 364.072983632, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.75);
  var sig = LFSaw.ar(97+(1..8)+(puls.range(0,5)**3),mul:0.4);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1/4,1/4,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 369.649663578, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.75);
  var sig = LFSaw.ar(60+(1..8)+(puls.range(0,5)**3),mul:0.4);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1/4,1/4,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 377.131265687, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.75);
  var sig = LFSaw.ar(80+(1..8)+(puls.range(0,5)**3),mul:0.4);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1/4,1/4,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 390.468549687, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.75);
  var sig = LFSaw.ar(80+(1..8)+(puls.range(0,5)**3),mul:0.4);
  sig = LPF.ar(sig,400);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1/4,1/4,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 406.201843756, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.75);
  var sig = LFSaw.ar(80+(1..8)+(puls.range(0,5)**3),mul:0.4);
  sig = LPF.ar(sig,4000*LFSaw.ar(1/4).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1/4,1/4,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 433.900076725, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.75);
  var sig = LFSaw.ar(80+(1..8)+(puls.range(0,5)**3),mul:0.4);
  sig = LPF.ar(sig,4000*LFSaw.ar(4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1/4,1/4,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 439.661843512, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.75);
  var sig = LFSaw.ar(70+(1..8)+(puls.range(0,5)**3),mul:0.4);
  sig = LPF.ar(sig,4000*LFSaw.ar(4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1/4,1/4,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 441.238141085, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.75);
  var sig = LFSaw.ar(80+(1..8)+(puls.range(0,5)**3),mul:0.4);
  sig = LPF.ar(sig,4000*LFSaw.ar(4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1/4,1/4,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 453.413346261, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.75);
  var sig = LFSaw.ar(80+(1..8)+(puls.range(0,5)**3),mul:0.5);
  sig = LPF.ar(sig,4000*LFSaw.ar(4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1/4,1/4,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 475.254737749, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.75);
  var sig = LFSaw.ar(80+(1..8)+(puls.range(0,5)**3),mul:{ExpRand(0.1,0.8)}!8);
  sig = LPF.ar(sig,4000*LFSaw.ar(4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1/4,1/4,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 487.92037116, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.75);
  var sig = LFSaw.ar(80+(1..8)+(puls.range(0,5)**3),mul:{ExpRand(0.1,0.8)}!8);
  sig = LPF.ar(sig,4000*LFSaw.ar(4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1/4,1/4,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 500.086026011, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.75);
  var sig = LFSaw.ar(80+(1..8)+(puls.range(0,5)**3),mul:{ExpRand(0.1,0.8)}!8);
  sig = LPF.ar(sig,1400*LFSaw.ar(4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1/4,1/4,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 505.810924244, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.75);
  var sig = LFSaw.ar(80+(1..8)+(puls.range(0,5)**3),mul:{ExpRand(0.1,0.8)}!8);
  sig = LPF.ar(sig,1400*LFSaw.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1/4,1/4,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 523.348863447, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.75);
  var sig = LFSaw.ar(80*[1,2,4,8]+(puls.range(0,5)**3),mul:{ExpRand(0.1,0.8)}!8);
  sig = LPF.ar(sig,1400*LFSaw.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1/4,1/4,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 528.5771725, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.75);
  var sig = LFSaw.ar(80*[1,2,4,8]+(puls.range(0,5)**3),mul:{ExpRand(0.1,0.8)}!8);
  sig = LPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1/4,1/4,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 533.897296291, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.75);
  var sig = LFSaw.ar(80*[1,2,4,8]+(puls.range(0,5)**3),mul:{ExpRand(0.1,0.8)}!8);
  sig = LPF.ar(sig,1400*LFTri.ar(4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1/4,1/4,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 543.577499614, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.75);
  var sig = LFSaw.ar(80*[1,2,4,8]+(puls.range(0,5)**3),mul:{ExpRand(0.1,0.8)}!8);
  sig = LPF.ar(sig,1400*LFTri.ar(4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1/4,1/4,2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 546.475851575, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.75);
  var sig = LFSaw.ar(80*[1,2,4,8]+(puls.range(0,5)**3),mul:{ExpRand(0.1,0.8)}!8);
  sig = LPF.ar(sig,1400*LFTri.ar(4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1,1/4,2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 559.282330384, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(2,(0..3)+[0.5]/4),0.75);
  var sig = LFSaw.ar(80*[1,2,4,8]+(puls.range(0,5)**3),mul:{ExpRand(0.1,0.8)}!8);
  sig = LPF.ar(sig,1400*LFTri.ar(4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1,1/4,2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 566.049818319, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1.5,(0..3)+[0.5]/4),0.75);
  var sig = LFSaw.ar(80*[1,2,4,8]+(puls.range(0,5)**3),mul:{ExpRand(0.1,0.8)}!8);
  sig = LPF.ar(sig,1400*LFTri.ar(4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1,1/4,2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 568.459258411, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1.5,(0..3)+[0.5]/4),0.5);
  var sig = LFSaw.ar(80*[1,2,4,8]+(puls.range(0,5)**3),mul:{ExpRand(0.1,0.8)}!8);
  sig = LPF.ar(sig,1400*LFTri.ar(4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1,1/4,2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 571.479539852, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1.25,(0..3)+[0.5]/4),0.5);
  var sig = LFSaw.ar(80*[1,2,4,8]+(puls.range(0,5)**3),mul:{ExpRand(0.1,0.8)}!8);
  sig = LPF.ar(sig,1400*LFTri.ar(4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1,1/4,2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 579.024300661, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1/4,(0..3)+[0.5]/4),0.5);
  var sig = LFSaw.ar(80*[1,2,4,8]+(puls.range(0,5)**3),mul:{ExpRand(0.1,0.8)}!8);
  sig = LPF.ar(sig,1400*LFTri.ar(4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1,1/4,2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 581.407234075, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5]/4),0.5);
  var sig = LFSaw.ar(80*[1,2,4,8]+(puls.range(0,5)**3),mul:{ExpRand(0.1,0.8)}!8);
  sig = LPF.ar(sig,1400*LFTri.ar(4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1,1/4,2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 584.159133984, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5]/4),4.5);
  var sig = LFSaw.ar(80*[1,2,4,8]+(puls.range(0,5)**3),mul:{ExpRand(0.1,0.8)}!8);
  sig = LPF.ar(sig,1400*LFTri.ar(4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1,1/4,2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 587.779524619, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1/4,(0..3)+[0.5]/4),4.5);
  var sig = LFSaw.ar(80*[1,2,4,8]+(puls.range(0,5)**3),mul:{ExpRand(0.1,0.8)}!8);
  sig = LPF.ar(sig,1400*LFTri.ar(4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1,1/4,2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 601.964294102, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1/4,(0..3)+[0.5]/4),4.5);
  var sig = LFSaw.ar(80*[1,1.5,1.25]+(puls.range(0,5)**3),mul:{ExpRand(0.1,0.8)}!8);
  sig = LPF.ar(sig,1400*LFTri.ar(4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1,1/4,2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 604.8998525, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1/4,(0..3)+[0.5]/4),4.5);
  var sig = LFSaw.ar(80*[1,1.5,1.25,2]+(puls.range(0,5)**3),mul:{ExpRand(0.1,0.8)}!8);
  sig = LPF.ar(sig,1400*LFTri.ar(4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1,1/4,2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 633.82860019, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1/4,(0..3)+[0.5]/4),4.5);
  var sig = LFSaw.ar(80*[1,1.5,1,1.25,1,2]+(puls.range(0,5)**3),mul:{ExpRand(0.1,0.8)}!8);
  sig = LPF.ar(sig,1400*LFTri.ar(4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1,1/4,2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 643.100456374, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),4.5);
  var sig = LFSaw.ar(80*[1,1.5,1,1.25,1,2]+(puls.range(0,5)**3),mul:{ExpRand(0.1,0.8)}!8);
  sig = LPF.ar(sig,1400*LFTri.ar(4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1,1/4,2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 645.3014032, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.5);
  var sig = LFSaw.ar(80*[1,1.5,1,1.25,1,2]+(puls.range(0,5)**3),mul:{ExpRand(0.1,0.8)}!8);
  sig = LPF.ar(sig,1400*LFTri.ar(4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1,1/4,2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 658.038025561, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.5);
  var sig = LFSaw.ar(80*[1,1.5,1,1.25,1,2]+(puls.range(0,5)**3),mul:{ExpRand(0.1,0.8)}!8);
  sig = LPF.ar(sig,1400*LFTri.ar(4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  //sig = AllpassC.ar(sig,1,1/4,2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 675.089600018, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.5);
  var sig = LFSaw.ar(80*[1,1.5,1,1.25,1,2]+(puls.range(0,5)**3),mul:{ExpRand(0.1,0.8)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1,1/4,2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 687.395904454, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.5);
  var sig = LFSaw.ar(80*[1,1.5,1,1.25,1,2]+(puls.range(0,5)**3),mul:{ExpRand(0.1,0.8)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1,1/4,2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 690.929870432, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.5);
  var sig = LFSaw.ar(80*[1,1.5,1,1.25,1,2]+(puls.range(0,5)**3),mul:{ExpRand(0.1,0.8)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1,1/4,2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 696.758712513, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.5);
  var sig = LFSaw.ar(80*[1,1.5,1,1.25,1,2]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.8)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = AllpassC.ar(sig,1,1/4,2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 739.651356503, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.5);
  var sig = LFSaw.ar(80*[1,1.5,1,1.25,1,2]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.8)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (WhiteNoise.ar(0.01!2) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..3)/4)));
  sig = AllpassC.ar(sig,1,1/4,2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 750.055382938, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.5);
  var sig = LFSaw.ar(80*[1,1.5,1,1.25,1,2]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.8)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (WhiteNoise.ar(0.01!2) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4)));
  sig = AllpassC.ar(sig,1,1/4,2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 755.025554751, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.5);
  var sig = LFSaw.ar(80*[1,1.5,1,1.25,1,2]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.8)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (WhiteNoise.ar(0.01!2) * EnvGen.ar(Env([0,1,0],[0.02,0.1],[3,-3]),Impulse.ar(1,(0..3)/4)));
  sig = AllpassC.ar(sig,1,1/4,2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 757.174906973, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.5);
  var sig = LFSaw.ar(80*[1,1.5,1,1.25,1,2]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.8)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (WhiteNoise.ar(0.01!2) * EnvGen.ar(Env([0,1,0],[0.02,0.4],[3,-3]),Impulse.ar(1,(0..3)/4)));
  sig = AllpassC.ar(sig,1,1/4,2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 767.125676832, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.5);
  var sig = LFSaw.ar(80*[1,1.5,1,1.25,1,2]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.8)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (WhiteNoise.ar(0.01!2) * EnvGen.ar(Env([0,1,0],[0.02,0.4],[3,-3]),Impulse.ar(2,(0..3)/4)));
  sig = AllpassC.ar(sig,1,1/4,2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 775.6485182, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.5);
  var sig = LFSaw.ar(80*[1,1.5,1,1.25,1,2]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.8)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (WhiteNoise.ar(0.01!2) * EnvGen.ar(Env([0,1,0],[0.02,0.4],[3,-3]),Impulse.ar(2,[1,2,3]/4)));
  sig = AllpassC.ar(sig,1,1/4,2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 787.631494846, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.5);
  var sig = LFSaw.ar(80*[1,1.5,1,1.25,1,2]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.8)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (WhiteNoise.ar(0.01!2) * EnvGen.ar(Env([0,1,0],[0.02,0.4],[3,-3]),Impulse.ar(1,[1,2,3]/8)));
  sig = AllpassC.ar(sig,1,1/4,2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 807.972160094, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.5);
  var sig = LFTri.ar(80*[1,1.5,1,1.25,1,2]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.8)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (WhiteNoise.ar(0.01!2) * EnvGen.ar(Env([0,1,0],[0.02,0.4],[3,-3]),Impulse.ar(1,[1,2,3]/8)));
  sig = AllpassC.ar(sig,1,1/4,2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 817.166302117, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.5);
  var sig = SinOsc.ar(80*[1,1.5,1,1.25,1,2]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.8)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (WhiteNoise.ar(0.01!2) * EnvGen.ar(Env([0,1,0],[0.02,0.4],[3,-3]),Impulse.ar(1,[1,2,3]/8)));
  sig = AllpassC.ar(sig,1,1/4,2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 827.372557519, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.5);
  var sig = LFSaw.ar(80*[1,1.5,1,1.25,1,2]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.8)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (WhiteNoise.ar(0.01!2) * EnvGen.ar(Env([0,1,0],[0.02,0.4],[3,-3]),Impulse.ar(1,[1,2,3]/8)));
  sig = AllpassC.ar(sig,1,1/4,2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 836.009691828, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.5);
  var sig = LFSaw.ar(80*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.8)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (WhiteNoise.ar(0.01!2) * EnvGen.ar(Env([0,1,0],[0.02,0.4],[3,-3]),Impulse.ar(1,[1,2,3]/8)));
  sig = AllpassC.ar(sig,1,1/4,2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 845.815771855, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.5);
  var sig = LFSaw.ar(80*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,1.0)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (WhiteNoise.ar(0.01!2) * EnvGen.ar(Env([0,1,0],[0.02,0.4],[3,-3]),Impulse.ar(1,[1,2,3]/8)));
  sig = AllpassC.ar(sig,1,1/4,2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 876.117433169, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.5);
  var sig = LFSaw.ar(80*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,1.0)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (WhiteNoise.ar(0.01!2) * EnvGen.ar(Env([0,1,0],[0.02,0.4],[3,-3]),Impulse.ar(1,[1,2,3]/8)));
  sig = AllpassC.ar(sig,1,1/4,2);
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 896.457267565, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.5);
  var sig = LFSaw.ar(80*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,1.0)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (WhiteNoise.ar(0.01!2) * EnvGen.ar(Env([0,1,0],[0.02,0.4],[3,-3]),Impulse.ar(1,[1,2,3]/8)));
  sig = AllpassC.ar(sig,1,1/4,2);
  sig = GVerb.ar(sig,10)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 910.598717444, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.5);
  var sig = LFSaw.ar(80*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,1.0)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (WhiteNoise.ar(0.01!2) * EnvGen.ar(Env([0,1,0],[0.02,0.4],[3,-3]),Impulse.ar(1,[1,2,3]/8)));
  sig = AllpassC.ar(sig,1,1/4,2);
  sig = GVerb.ar(sig,10)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);

  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 931.338320884, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var mld = Duty.kr(4,0,Dseq([1,2,1.5,1.25],inf)) ;
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.5);
  var sig = LFSaw.ar(80*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,1.0)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (WhiteNoise.ar(0.01!2) * EnvGen.ar(Env([0,1,0],[0.02,0.4],[3,-3]),Impulse.ar(1,[1,2,3]/8)));
  sig = AllpassC.ar(sig,1,1/4,2);
  sig = GVerb.ar(sig,10)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);

  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 993.811223286, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var mld = [1,2,1.5,1.25] ;
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.5);
  var sig = LFSaw.ar(80*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,1.0)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (WhiteNoise.ar(0.01!2) * EnvGen.ar(Env([0,1,0],[0.02,0.4],[3,-3]),Impulse.ar(1,[1,2,3]/8)));
  sig = AllpassC.ar(sig,1,1/4,2);
  sig = GVerb.ar(sig,10)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);

  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 1008.56106113, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var mld = [1,2,1.5,1.25,4,8] ;
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.5);
  var sig = LFSaw.ar(80*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,1.0)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (WhiteNoise.ar(0.01!2) * EnvGen.ar(Env([0,1,0],[0.02,0.4],[3,-3]),Impulse.ar(1,[1,2,3]/8)));
  sig = AllpassC.ar(sig,1,1/4,2);
  sig = GVerb.ar(sig,10)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);

  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 1056.04975581, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var mld = [1,2,1.5,1.25,4,8] ;
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.5);
  var sig = LFSaw.ar(80*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,1.0)}!8);
  sig = sig + LFSaw.ar(80*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,1.0)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (WhiteNoise.ar(0.01!2) * EnvGen.ar(Env([0,1,0],[0.02,0.4],[3,-3]),Impulse.ar(1,[1,2,3]/8)));
  sig = AllpassC.ar(sig,1,1/4,2);
  sig = GVerb.ar(sig,10)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);

  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 1071.363111957, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var mld = [1,2,1.5,1.25,4,8] ;
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.5);
  var sig = LFSaw.ar(80*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = sig + LFSaw.ar(80*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (WhiteNoise.ar(0.01!2) * EnvGen.ar(Env([0,1,0],[0.02,0.4],[3,-3]),Impulse.ar(1,[1,2,3]/8)));
  sig = AllpassC.ar(sig,1,1/4,2);
  sig = GVerb.ar(sig,10)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);

  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 1095.116291068, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var mld = [1,2,1.5,1.25,4,8] ;
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.5);
  var sig = LFSaw.ar(80*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = sig + LFSaw.ar(80*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (WhiteNoise.ar(0.01!2) * EnvGen.ar(Env([0,1,0],[0.02,0.4],[3,-3]),Impulse.ar(1,[1,2,3]/8)));
  sig = AllpassC.ar(sig,1/8,1/8,2);
  sig = GVerb.ar(sig,10)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);

  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 1103.44742188, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var mld = [1,2,1.5,1.25,4,8] ;
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.5);
  var sig = LFSaw.ar(80*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = sig + LFSaw.ar(80*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (WhiteNoise.ar(0.01!2) * EnvGen.ar(Env([0,1,0],[0.02,0.4],[3,-3]),Impulse.ar(1,[1,2,3]/8)));
  sig = AllpassC.ar(sig,1/8,1/8,4);
  sig = GVerb.ar(sig,10)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);

  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 1109.982672805, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var mld = [1,2,1.5,1.25,4,8] ;
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5]/4),0.5);
  var sig = LFSaw.ar(80*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = sig + LFSaw.ar(80*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (WhiteNoise.ar(0.01!2) * EnvGen.ar(Env([0,1,0],[0.02,0.4],[3,-3]),Impulse.ar(1,[1,2,3]/8)));
  sig = AllpassC.ar(sig,1/2,1/2,4);
  sig = GVerb.ar(sig,10)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);

  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 1132.021275165, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var mld = [1,2,1.5,1.25,4,8] ;
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.5);
  var sig = LFSaw.ar(80*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = sig + LFSaw.ar(80*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (WhiteNoise.ar(0.01!2) * EnvGen.ar(Env([0,1,0],[0.02,0.4],[3,-3]),Impulse.ar(1,[1,2,3]/8)));
  sig = AllpassC.ar(sig,1/2,1/2,4);
  sig = GVerb.ar(sig,10)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);

  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 1137.973485493, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var mld = [1,2,1.5,1.25,4,8] ;
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.15);
  var sig = LFSaw.ar(80*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = sig + LFSaw.ar(80*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (WhiteNoise.ar(0.01!2) * EnvGen.ar(Env([0,1,0],[0.02,0.4],[3,-3]),Impulse.ar(1,[1,2,3]/8)));
  sig = AllpassC.ar(sig,1/2,1/2,4);
  sig = GVerb.ar(sig,10)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);

  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 1151.254274532, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var mld = [1,2,1.5,1.25,4,8] ;
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.15);
  var sig = LFSaw.ar(80*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = sig + LFSaw.ar(80*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (WhiteNoise.ar(0.01!2) * EnvGen.ar(Env([0,1,0],[0.02,0.4],[3,-3]),Impulse.ar(1,[1,2,3]/8)));
  sig = AllpassC.ar(sig,1/2,1/2,4);
  sig = GVerb.ar(sig,4)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);

  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 1170.121647411, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var mld = [1,2,1.5,1.25,4,8] ;
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.15);
  var sig = LFSaw.ar(80*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = sig + LFSaw.ar(80*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (WhiteNoise.ar(0.01!2) * EnvGen.ar(Env([0,1,0],[0.02,0.4],[3,-3]),Impulse.ar(1,[1,2,3]/8)));
  sig = AllpassC.ar(sig,1/2,1/2,[5,4]);
  sig = GVerb.ar(sig,[4,5])/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);

  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 1173.977150706, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var mld = [1,2,1.5,1.25,4,8] ;
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.15);
  var sig = LFSaw.ar(80*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = sig + LFSaw.ar(80*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (WhiteNoise.ar(0.01!2) * EnvGen.ar(Env([0,1,0],[0.02,0.4],[3,-3]),Impulse.ar(1,[1,2,3]/8)));
  sig = AllpassC.ar(sig,1/2,1/2,[5,4]);
  sig = GVerb.ar(sig,[4,5]*2)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);

  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 1197.635243711, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var mld = [1,2,1.5,1.25,4,8] ;
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.15);
  var sig = LFSaw.ar(80*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = sig + LFSaw.ar(80*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (WhiteNoise.ar(0.01!2) * EnvGen.ar(Env([0,1,0],[0.02,0.4],[3,-3]),Impulse.ar(1,[1,2,3]/8)));
  sig = AllpassC.ar(LPF.ar(sig,800),1/2,1/2,[5,4])+sig;
  sig = GVerb.ar(sig,[4,5]*2)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);

  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 1209.730681266, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var mld = [1,2,1.5,1.25,4,8] ;
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.15);
  var sig = LFSaw.ar(80*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = sig + LFSaw.ar(80*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (WhiteNoise.ar(0.01!2) * EnvGen.ar(Env([0,1,0],[0.02,0.4],[3,-3]),Impulse.ar(1,[1,2,3]/8)));
  sig = AllpassC.ar(LPF.ar(sig,8000),1/2,1/2,[5,4])+sig;
  sig = GVerb.ar(sig,[4,5]*2)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);

  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 1213.195562472, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var mld = [1,2,1.5,1.25,4,8] ;
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.15);
  var sig = LFSaw.ar(80*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = sig + LFSaw.ar(80*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (WhiteNoise.ar(0.01!2) * EnvGen.ar(Env([0,1,0],[0.02,0.4],[3,-3]),Impulse.ar(1,[1,2,3]/8)));
  sig = AllpassC.ar(LPF.ar(sig,1800),1/2,1/2,[5,4])+sig;
  sig = GVerb.ar(sig,[4,5]*2)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);

  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 1234.627476691, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var mld = [1,2,1.5,1.25,4,8] ;
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.15);
  var sig = LFSaw.ar(80*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = sig + LFSaw.ar(80*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (WhiteNoise.ar(0.01!2) * EnvGen.ar(Env([0,1,0],[0.02,0.4],[3,-3]),Impulse.ar(1,[1,2,3]/8)));
  sig = GVerb.ar(sig,[4,5]*2)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);

  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 1243.677137132, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var mld = [1,2,1.5,1.25,4,8] ;
  var puls = Decay.ar(Impulse.ar(1/4,(0..3)+[0.5,0.25]/4),0.15);
  var sig = LFSaw.ar(80*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = sig + LFSaw.ar(80*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (WhiteNoise.ar(0.01!2) * EnvGen.ar(Env([0,1,0],[0.02,0.4],[3,-3]),Impulse.ar(1,[1,2,3]/8)));
  sig = AllpassC.ar(sig,1/2,1/2,[5,4])+sig;
  sig = GVerb.ar(sig,[4,5]*2)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);

  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 1258.032508629, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var mld = [1,2,1.5,1.25,4,8] ;
  var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.15);
  var sig = LFSaw.ar(80*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = sig + LFSaw.ar(80*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (WhiteNoise.ar(0.01!2) * EnvGen.ar(Env([0,1,0],[0.02,0.4],[3,-3]),Impulse.ar(1,[1,2,3]/8)));
  sig = AllpassC.ar(sig,1/2,1/2,[5,4])+sig;
  sig = GVerb.ar(sig,[4,5]*2)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);

  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 1261.38528635, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var mld = [1,2,1.5,1.25,4,8] ;
  var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
  var sig = LFSaw.ar(80*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = sig + LFSaw.ar(80*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (WhiteNoise.ar(0.01!2) * EnvGen.ar(Env([0,1,0],[0.02,0.4],[3,-3]),Impulse.ar(1,[1,2,3]/8)));
  sig = AllpassC.ar(sig,1/2,1/2,[5,4])+sig;
  sig = GVerb.ar(sig,[4,5]*2)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);

  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 1273.152214786, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var mld = [1,2,1.5,1.25] ;
  var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
  var sig = LFSaw.ar(80*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = sig + LFSaw.ar(80*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (WhiteNoise.ar(0.01!2) * EnvGen.ar(Env([0,1,0],[0.02,0.4],[3,-3]),Impulse.ar(1,[1,2,3]/8)));
  sig = AllpassC.ar(sig,1/2,1/2,[5,4])+sig;
  sig = GVerb.ar(sig,[4,5]*2)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);

  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 1281.411565841, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var mld = [1,2,1.5,1.25] ;
  var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
  var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = sig + LFSaw.ar(60*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (WhiteNoise.ar(0.01!2) * EnvGen.ar(Env([0,1,0],[0.02,0.4],[3,-3]),Impulse.ar(1,[1,2,3]/8)));
  sig = AllpassC.ar(sig,1/2,1/2,[5,4])+sig;
  sig = GVerb.ar(sig,[4,5]*2)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);

  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 1293.492241754, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var mld = [1,2,1.5,1.25] ;
  var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
  var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = sig + LFSaw.ar(59*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (WhiteNoise.ar(0.01!2) * EnvGen.ar(Env([0,1,0],[0.02,0.4],[3,-3]),Impulse.ar(1,[1,2,3]/8)));
  sig = AllpassC.ar(sig,1/2,1/2,[5,4])+sig;
  sig = GVerb.ar(sig,[4,5]*2)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);

  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 1334.665832022, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var mld = [1,2,1.5,1.25] ;
  var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
  var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = sig + LFSaw.ar(59*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),1000) * EnvGen.ar(Env([0,1,0],[0.02,0.4],[3,-3]),Impulse.ar(1,[1,2,3]/8)));
  sig = AllpassC.ar(sig,1/2,1/2,[5,4])+sig;
  sig = GVerb.ar(sig,[4,5]*2)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);

  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 1341.654910267, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var mld = [1,2,1.5,1.25] ;
  var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
  var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = sig + LFSaw.ar(59*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.02,0.4],[3,-3]),Impulse.ar(1,[1,2,3]/8)));
  sig = AllpassC.ar(sig,1/2,1/2,[5,4])+sig;
  sig = GVerb.ar(sig,[4,5]*2)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);

  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 1352.176016613, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var mld = [1,2,1.5,1.25] ;
  var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
  var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = sig + LFSaw.ar(59*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.02,0.24],[3,-3]),Impulse.ar(1,[1,2,3]/8)));
  sig = AllpassC.ar(sig,1/2,1/2,[5,4])+sig;
  sig = GVerb.ar(sig,[4,5]*2)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);

  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 1355.675432486, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var mld = [1,2,1.5,1.25] ;
  var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
  var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = sig + LFSaw.ar(59*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1,[1,2,3]/8)));
  sig = AllpassC.ar(sig,1/2,1/2,[5,4])+sig;
  sig = GVerb.ar(sig,[4,5]*2)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);

  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 1361.756083929, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var mld = [1,2,1.5,1.25] ;
  var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
  var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = sig + LFSaw.ar(59*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/8)));
  sig = AllpassC.ar(sig,1/2,1/2,[5,4])+sig;
  sig = GVerb.ar(sig,[4,5]*2)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);

  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 1364.419852952, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var mld = [1,2,1.5,1.25] ;
  var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
  var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = sig + LFSaw.ar(59*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
  sig = AllpassC.ar(sig,1/2,1/2,[5,4])+sig;
  sig = GVerb.ar(sig,[4,5]*2)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);

  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 1385.700242087, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var mld = [1,2,1.5,1.25] ;
  var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
  var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = sig + LFSaw.ar(59*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
  sig = AllpassC.ar(sig,1/2,1/2,[5,4])+sig;
  sig = GVerb.ar(sig,[4,5]*2)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;

  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 1401.492921965, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var mld = [1,2,1.5,1.25] ;
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
  var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = sig + LFSaw.ar(59*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
  sig = AllpassC.ar(sig,1/2,1/2,[5,4])+sig;
  sig = GVerb.ar(sig,[4,5]*2)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;

  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 1414.666884319, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var mld = [1,2,1.5,1.25] ;
  var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
  var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = sig + LFSaw.ar(59*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
  sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
  sig = GVerb.ar(sig,[4,5]*2)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;

  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 1439.478185195, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var mld = [1,2,1.5,1.25] ;
  var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
  var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = sig + LFSaw.ar(59*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
  sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
  sig = GVerb.ar(sig,[4,5]*2)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 1445.714334279, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var mld = [1,2,1.5,1.25] ;
  var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
  var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = sig + LFSaw.ar(59*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
  sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
  sig = GVerb.ar(sig,[4,5]*2)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 1452.326768023, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var mld = [1,2,1.5,1.25] ;
  var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
  var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
  sig = sig + LFSaw.ar(59*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
  sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
  sig = GVerb.ar(sig,[4,5]*2)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 1471.515741916, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var mld = [1,2,1.5,1.25,4,8,16];
  var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
  var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
  sig = sig + LFSaw.ar(59*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
  sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
  sig = GVerb.ar(sig,[4,5]*2)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 1497.414726414, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=5;
~varnam={
  var mld = [1,2,1.5,1.25,4,8,16]*1.5;
  var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
  var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
  sig = sig + LFSaw.ar(59*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
  sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
  sig = GVerb.ar(sig,[4,5]*2)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 1507.248356323, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=1;
~varnam={
  var mld = [1,2,1.5,1.25,4,8,16]*1.25;
  var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
  var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
  sig = sig + LFSaw.ar(59*[1,1.5,1,1.25,1,1.125]+(puls.range(0,5)**3),mul:{ExpRand(0.01,0.5)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
  sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
  sig = GVerb.ar(sig,[4,5]*2)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 1518.915640605, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=1;
~varnam={
  var mld = [1,2,1.5,1.25,4,8,16]*1.25;
  var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
  var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
  sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
  sig = GVerb.ar(sig,[4,5]*2)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 1535.876275899, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=1;
~varnam={
  var mld = [1,2,1.5,1.25,4,8,16]*1.5;
  var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
  var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
  sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
  sig = GVerb.ar(sig,[4,5]*2)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 1541.520600858, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=1;
~varnam={
  var mld = [1,2,1.5,1.25,4,8,16]*1.75;
  var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
  var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
  sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
  sig = GVerb.ar(sig,[4,5]*2)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 1547.184454354, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=1;
~varnam={
  var mld = [1,2,1.5,1.25,4,8,16]*1.125;
  var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
  var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
  sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
  sig = GVerb.ar(sig,[4,5]*2)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 1554.196077181, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=1;
~varnam={
  var mld = [1,2,1.5,1.25,4,8,16];
  var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
  var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
  sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
  sig = GVerb.ar(sig,[4,5]*2)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 1559.184858827, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=1;
~varnam={
  var mld = [1,2,1.5,1.25,4,8,16]/2;
  var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
  var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
  sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
  sig = GVerb.ar(sig,[4,5]*2)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 1564.927486919, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=1;
~varnam={
  var mld = [1,2,1.5,1.25,4,8,16];
  var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
  var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
  sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
  sig = GVerb.ar(sig,[4,5]*2)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 1573.366766645, 'me', "(
~varnam.quant=2;
~varnam.fadeTime=1;
~varnam={
  var mld = [1,2,1.5,1.25,4,8,16]/2;
  var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
  var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
  sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
  sig = GVerb.ar(sig,[4,5]*2)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);" ],
[ 1688.214883006, 'me', "Tdef(\\asd,{

  loop{
    var arcitune = Select.kr(ExpRand(1.0001,4),[1,2,1/25,1.5,1/2,1.75]);
(
~varnam.quant=2;
~varnam.fadeTime=1;
~varnam={
  var mld = [1,2,1.5,1.25,4,8,16]/arcitune;
  var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
  var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
  sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
  sig = GVerb.ar(sig,[4,5]*2)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);

    16.wait;
  };

}).play;" ],
[ 1689.341621219, 'me', "thisProcess.stop;" ],
[ 1689.755794686, 'me', "Tdef(\\asd,{

  loop{
    var arcitune = Select.kr(ExpRand(1.0001,4),[1,2,1/25,1.5,1/2,1.75]);
(
~varnam.quant=2;
~varnam.fadeTime=1;
~varnam={
  var mld = [1,2,1.5,1.25,4,8,16]/arcitune;
  var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
  var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
  sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
  sig = GVerb.ar(sig,[4,5]*2)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;
);

    16.wait;
  };

}).play;" ],
[ 1710.351104072, 'me', "(
Tdef(\\asd,{

  loop{
    var arcitune = Select.kr(ExpRand(1.0001,4),[1,2,1/25,1.5,1/2,1.75]);
~varnam.quant=2;
~varnam.fadeTime=1;
~varnam={
  var mld = [1,2,1.5,1.25,4,8,16]/arcitune;
  var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
  var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
  sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
  sig = sig * puls.range(0,1);
  sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
  sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
  sig = GVerb.ar(sig,[4,5]*2)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~varnam,postVol:true);
~varnam.play;

    16.wait;
  };

}).play;

);" ],
[ 1722.568425639, 'me', "(
  Tdef(\\asd,{

    loop{
      var arcitune = Select.kr(ExpRand(1.0001,4),[1,2,1/25,1.5,1/2,1.75]);
      ~varnam.quant=2;
      ~varnam.fadeTime=1;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16]/arcitune;
        var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
        sig = GVerb.ar(sig,[4,5]*2)/4+sig;
        sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
        Splay.ar(sig.flat,0.25,0.25);
      };
      ~varnam.play;

      16.wait;
    };

  }).play;

);" ],
[ 1723.823012195, 'me', "thisProcess.stop;" ],
[ 1733.380568754, 'me', "(
  z = Tdef(\\asd,{

    loop{
      var arcitune = Select.kr(ExpRand(1.0001,4),[1,2,1/25,1.5,1/2,1.75]);
      ~varnam.quant=2;
      ~varnam.fadeTime=1;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16]/arcitune;
        var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
        sig = GVerb.ar(sig,[4,5]*2)/4+sig;
        sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
        Splay.ar(sig.flat,0.25,0.25);
      };
      ~varnam.play;

      16.wait;
    };

  });
  z.play;

);" ],
[ 1752.497024889, 'me', "(
  z = Tdef(\\asd,{

    loop{
      var arcitune = Select.kr(ExpRand(1.0001,4),[1,2,1/25,1.5,1/2,1.75]);
      ~varnam.quant=2;
      ~varnam.fadeTime=1;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16]/arcitune;
        var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
        sig = GVerb.ar(sig,[4,5]*2)/4+sig;
        sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
        Splay.ar(sig.flat,0.25,0.25);
      };
      ~varnam.play;

      4.wait;
    };

  });

  z.play;

);" ],
[ 1775.510287158, 'me', "(
  z = Tdef(\\asd,{

    loop{
      var arcitune = Select.kr({ExpRand(1.0001,4)}!2,[1,2,1/25,1.5,1/2,1.75]);
      ~varnam.quant=2;
      ~varnam.fadeTime=1;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16]/arcitune;
        var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
        sig = GVerb.ar(sig,[4,5]*2)/4+sig;
        sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
        Splay.ar(sig.flat,0.25,0.25);
      };
      ~varnam.play;

      4.wait;
    };

  });

  z.play;

);" ],
[ 1800.642601569, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!2,[1,2,1/25,1.5,1/2,1.75])};
      ~varnam.quant=2;
      ~varnam.fadeTime=1;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] / ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
        sig = GVerb.ar(sig,[4,5]*2)/4+sig;
        sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
        Splay.ar(sig.flat,0.25,0.25);
      };
      ~varnam.play;

      4.wait;
    };

  });

  z.play;

);" ],
[ 1816.011334718, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!2,[1,2,1/25,1.5,1/2,1.75])};
      ~varnam.quant=2;
      ~varnam.fadeTime=1;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] / ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
        sig = GVerb.ar(sig,[4,5]*2)/4+sig;
        sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
        Splay.ar(sig.flat,0.25,0.25);
      };
      ~varnam.play;

      16.wait;
    };

  });

  z.play;

);" ],
[ 1864.421873544, 'me', "thisProcess.stop;" ],
[ 1868.480134396, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.fadeTime=2;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!2,[1,2,1/25,1.5,1/2,1.75])};
      16.wait;
    };

  });

  z.play;
)" ],
[ 1869.893629404, 'me', "(
      ~varnam.quant=2;
      ~varnam.fadeTime=1;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] / ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
        sig = GVerb.ar(sig,[4,5]*2)/4+sig;
        sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
        Splay.ar(sig.flat,0.25,0.25);
      };
      ~varnam.play;

);" ],
[ 1933.853856099, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!2,[1,2,1/25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=1;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] / ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
        sig = GVerb.ar(sig,[4,5]*2)/4+sig;
        sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
        Splay.ar(sig.flat,0.25,0.25);
      };
      ~varnam.play;

  16.wait;
    };

  });

  z.play;

);" ],
[ 1938.269960083, 'me', "thisProcess.stop;" ],
[ 1938.629301008, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!2,[1,2,1/25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=1;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] / ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
        sig = GVerb.ar(sig,[4,5]*2)/4+sig;
        sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
        Splay.ar(sig.flat,0.25,0.25);
      };
      ~varnam.play;

  16.wait;
    };

  });

  z.play;

);" ],
[ 1953.084984982, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!2,[1,2,1/25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=1;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] / ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
        sig = GVerb.ar(sig,[4,5]*2)/4+sig;
        sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
        Splay.ar(sig.flat,0.25,0.25);
      };
      ~varnam.play;

  8.wait;
    };

  });

  z.play;

);" ],
[ 1984.499916799, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.2;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!2,[1,2,1/25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=1;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] / ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
        sig = GVerb.ar(sig,[4,5]*2)/4+sig;
        sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
        Splay.ar(sig.flat,0.25,0.25);
      };
      ~varnam.play;

      8.wait;
    };

  });

  z.play;

);" ],
[ 1989.235644784, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!2,[1,2,1/25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=1;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] / ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
        sig = GVerb.ar(sig,[4,5]*2)/4+sig;
        sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
        Splay.ar(sig.flat,0.25,0.25);
      };
      ~varnam.play;

      8.wait;
    };

  });

  z.play;

);" ],
[ 2006.686351722, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!2,[1,2,1/25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] / ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
        sig = GVerb.ar(sig,[4,5]*2)/4+sig;
        sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
        Splay.ar(sig.flat,0.25,0.25);
      };
      ~varnam.play;

      8.wait;
    };

  });

  z.play;

);" ],
[ 2013.707541056, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!2,[1,2,1/25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
        sig = GVerb.ar(sig,[4,5]*2)/4+sig;
        sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
        Splay.ar(sig.flat,0.25,0.25);
      };
      ~varnam.play;

      8.wait;
    };

  });

  z.play;

);" ],
[ 2024.519578886, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!2,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
        sig = GVerb.ar(sig,[4,5]*2)/4+sig;
        sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
        Splay.ar(sig.flat,0.25,0.25);
      };
      ~varnam.play;

      8.wait;
    };

  });

  z.play;

);" ],
[ 2124.524225952, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
        sig = GVerb.ar(sig,[4,5]*2)/4+sig;
        sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
        Splay.ar(sig.flat,0.25,0.25);
      };
      ~varnam.play;

      8.wait;
    };

  });

  z.play;

);" ],
[ 2148.507327751, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=0.2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
        sig = GVerb.ar(sig,[4,5]*2)/4+sig;
        sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
        Splay.ar(sig.flat,0.25,0.25);
      };
      ~varnam.play;

      8.wait;
    };

  });

  z.play;

);" ],
[ 2150.415558841, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=0.5;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
        sig = GVerb.ar(sig,[4,5]*2)/4+sig;
        sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
        Splay.ar(sig.flat,0.25,0.25);
      };
      ~varnam.play;

      8.wait;
    };

  });

  z.play;

);" ],
[ 2159.21502596, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=0.5;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
        sig = GVerb.ar(sig,[4,5]*2)/4+sig;
        sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
        Splay.ar(sig.flat,0.25,0.25);
      };
      ~varnam.play;

      16.wait;
    };

  });

  z.play;

);" ],
[ 2171.967585333, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1/2,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
        sig = GVerb.ar(sig,[4,5]*2)/4+sig;
        sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
        Splay.ar(sig.flat,0.25,0.25);
      };
      ~varnam.play;

      16.wait;
    };

  });

  z.play;

);" ],
[ 2300.175855443, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
        sig = GVerb.ar(sig,[4,5]*2)/4+sig;
        sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
        Splay.ar(sig.flat,0.25,0.25);
      };
      ~varnam.play;

      16.wait;
    };

  });

  z.play;

);" ],
[ 2319.234287845, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
        sig = GVerb.ar(sig,[4,5]*2)/4+sig;
        sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
        Splay.ar(sig.flat,0.25,0.25);
      };
      ~varnam.play;

      8.wait;
    };

  });

  z.play;

);" ],
[ 2339.666978689, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
        sig = GVerb.ar(sig,[4,5]*2)/4+sig;
        sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
        Splay.ar(sig.flat,0.25,0.5);
      };
      ~varnam.play;

      8.wait;
    };

  });

  z.play;

);" ],
[ 2350.00325314, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(60*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
        sig = GVerb.ar(sig,[4,5]*2)/4+sig;
        sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
        Splay.ar(sig.flat,0.25,0.75);
      };
      ~varnam.play;

      8.wait;
    };

  });

  z.play;

);" ],
[ 2430.482186436, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(72*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
        sig = GVerb.ar(sig,[4,5]*2)/4+sig;
        sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
        Splay.ar(sig.flat,0.25,0.75);
      };
      ~varnam.play;

      8.wait;
    };

  });

  z.play;

);" ],
[ 2458.157950796, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(72*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
        sig = GVerb.ar(sig,[4,5]*2)/4+sig;
        sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
        Splay.ar(sig.flat,0.25,0.75);
      };
      ~varnam.play;

      4.wait;
    };

  });

  z.play;

);" ],
[ 2481.470273905, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!4,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(72*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
        sig = GVerb.ar(sig,[4,5]*2)/4+sig;
        sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
        Splay.ar(sig.flat,0.25,0.75);
      };
      ~varnam.play;

      8.wait;
    };

  });

  z.play;

);" ],
[ 2510.138967122, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!3,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(72*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
        sig = GVerb.ar(sig,[4,5]*2)/4+sig;
        sig = CompanderD.ar(sig,4/3,1/2,1/2)/2+sig;
        Splay.ar(sig.flat,0.25,0.75);
      };
      ~varnam.play;

      8.wait;
    };

  });

  z.play;

);" ],
[ 2666.637843368, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!3,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam[0].quant=2;
      ~varnam[0].fadeTime=2;
      ~varnam[0]={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(72*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
        sig = 
        Splay.ar(sig.flat,0.25,0.75);
      };
      ~varnam.play;

      8.wait;
    };

  });
    ~varnam[10] = \\filter -> {|in| AllpassC.ar(in,1/4,1/4,[5,4]) + in };
  ~varnam[12] = \\filter -> {|in| GVerb.ar(in,[4,5]*2)/4+in;};
    ~varnam[14] = \\filter -> {|in| CompanderD.ar(in,4/3,1/2,1/2)/2+in};

  z.play;

);" ],
[ 2671.178137772, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!3,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam[0].quant=2;
      ~varnam[0].fadeTime=2;
      ~varnam[0]={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(72*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        sig = AllpassC.ar(sig,1/4,1/4,[5,4])+sig;
        sig = 
        Splay.ar(sig.flat,0.25,0.75);
      };
      ~varnam.play;

      8.wait;
    };

  });
    ~varnam[10] = \\filter -> {|in| AllpassC.ar(in,1/4,1/4,[5,4]) + in };
  ~varnam[12] = \\filter -> {|in| GVerb.ar(in,[4,5]*2)/4+in };
    ~varnam[14] = \\filter -> {|in| CompanderD.ar(in,4/3,1/2,1/2)/2+in};

  z.play;

);" ],
[ 2675.420848395, 'me', "thisProcess.stop;" ],
[ 2678.217076062, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!3,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam[0].quant=2;
      ~varnam[0].fadeTime=2;
      ~varnam[0]={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(72*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        Splay.ar(sig.flat,0.25,0.75);
      };
      ~varnam.play;

      8.wait;
    };

  });
    ~varnam[10] = \\filter -> {|in| AllpassC.ar(in,1/4,1/4,[5,4]) + in };
  ~varnam[12] = \\filter -> {|in| GVerb.ar(in,[4,5]*2)/4+in };
    ~varnam[14] = \\filter -> {|in| CompanderD.ar(in,4/3,1/2,1/2)/2+in};

  z.play;

);" ],
[ 2682.802912796, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!3,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam[0].quant=2;
      ~varnam[0].fadeTime=2;
      ~varnam[0]={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(72*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        Splay.ar(sig.flat,0.25,0.75);
      };
      ~varnam.play;

      8.wait;
    };

  });
    ~varnam[10] = \\filter -> {|in| AllpassC.ar(in,1/4,1/4,[5,4]) + in };
  ~varnam[12] = \\filter -> {|in| GVerb.ar(in,[4,5]*2)/4+in };
    ~varnam[14] = \\filter -> {|in| CompanderD.ar(in,4/3,1/2,1/2)/2+in};

  z.play;

);" ],
[ 2684.417372733, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!3,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam[0].quant=2;
      ~varnam[0].fadeTime=2;
      ~varnam[0]={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(72*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        Splay.ar(sig.flat,0.25,0.75);
      };
      ~varnam.play;

      8.wait;
    };

  });
    ~varnam[10] = \\filter -> {|in| AllpassC.ar(in,1/4,1/4,[5,4]) + in };
  ~varnam[12] = \\filter -> {|in| GVerb.ar(in,[4,5]*2)/4+in };
    ~varnam[14] = \\filter -> {|in| CompanderD.ar(in,4/3,1/2,1/2)/2+in};

  z.play;

);" ],
[ 2690.950447158, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!3,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam[0].quant=2;
      ~varnam[0].fadeTime=2;
      ~varnam[0]={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(72*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        Splay.ar(sig.flat,0.25,0.75);
      };
      ~varnam.play;

      8.wait;
    };

  });
    ~varnam[10] = \\filter -> {|in| AllpassC.ar(in,1/4,1/4,[5,4]) + in };
  ~varnam[12] = \\filter -> {|in| GVerb.ar(in,[4,5]*2)/4+in };
    ~varnam[14] = \\filter -> {|in| CompanderD.ar(in,4/3,1/2,1/2)/2+in};

  z.play;

);" ],
[ 2694.218368486, 'me', "thisProcess.stop;" ],
[ 2695.341073859, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!3,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam[0].quant=2;
      ~varnam[0].fadeTime=2;
      ~varnam[0]={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(72*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        Splay.ar(sig.flat,0.25,0.75);
      };
      ~varnam.play;

      8.wait;
    };

  });
    ~varnam[10] = \\filter -> {|in| AllpassC.ar(in,1/4,1/4,[5,4]) + in };
  ~varnam[12] = \\filter -> {|in| GVerb.ar(in,[4,5]*2)/4+in };
    ~varnam[14] = \\filter -> {|in| CompanderD.ar(in,4/3,1/2,1/2)/2+in};

  z.play;

);" ],
[ 2701.660990202, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!3,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam[0].fadeTime=2;
      ~varnam[0]={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(72*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        Splay.ar(sig.flat,0.25,0.75);
      };
      ~varnam.play;

      8.wait;
    };

  });
    ~varnam[10] = \\filter -> {|in| AllpassC.ar(in,1/4,1/4,[5,4]) + in };
  ~varnam[12] = \\filter -> {|in| GVerb.ar(in,[4,5]*2)/4+in };
    ~varnam[14] = \\filter -> {|in| CompanderD.ar(in,4/3,1/2,1/2)/2+in};

  z.play;

);" ],
[ 2703.53152317, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!3,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam[0]={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(72*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        Splay.ar(sig.flat,0.25,0.75);
      };
      ~varnam.play;

      8.wait;
    };

  });
    ~varnam[10] = \\filter -> {|in| AllpassC.ar(in,1/4,1/4,[5,4]) + in };
  ~varnam[12] = \\filter -> {|in| GVerb.ar(in,[4,5]*2)/4+in };
    ~varnam[14] = \\filter -> {|in| CompanderD.ar(in,4/3,1/2,1/2)/2+in};

  z.play;

);" ],
[ 2720.283860796, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!3,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam[0]={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(72*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = RLPF.ar(sig,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = sig * puls.range(0,1);
        sig = sig + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)));
        Splay.ar(sig.flat,0.25,0.5);
      };
      ~varnam.play;

      8.wait;
    };

  });
    ~varnam[10] = \\filter -> {|in| AllpassC.ar(in,1/4,1/4,[5,4]) + in };
  ~varnam[12] = \\filter -> {|in| GVerb.ar(in,[4,5]*2)/4+in };
    ~varnam[14] = \\filter -> {|in| CompanderD.ar(in,4/3,1/2,1/2)/2+in};

  z.play;

);" ],
[ 2830.898668549, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!3,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam[0]={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(72*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = sig * puls.range(0,1);
        Splay.ar(sig.flat,0.25,0.5);
      };
      ~varnam.play;

      8.wait;
    };

  });
    
  ~varnam[9] = \\filter -> {|in| RLPF.ar(in,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);};
  ~varnam[10] = \\filter -> {|in| in + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)))};
  ~varnam[12] = \\filter -> {|in| AllpassC.ar(in,1/4,1/4,[5,4]) + in };
  ~varnam[14] = \\filter -> {|in| GVerb.ar(in,[4,5]*2)/4+in };
    ~varnam[16] = \\filter -> {|in| CompanderD.ar(in,4/3,1/2,1/2)/2+in};

  z.play;

);" ],
[ 2834.599946697, 'me', "thisProcess.stop;" ],
[ 2837.645833193, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!3,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam[0]={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(72*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = sig * puls.range(0,1);
        Splay.ar(sig.flat,0.25,0.5);
      };
      ~varnam.play;

      8.wait;
    };

  });
    
  ~varnam[8] = \\filter -> {|in| RLPF.ar(in,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100);};
  ~varnam[10] = \\filter -> {|in| in + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)))};
  ~varnam[12] = \\filter -> {|in| AllpassC.ar(in,1/4,1/4,[5,4]) + in };
  ~varnam[14] = \\filter -> {|in| GVerb.ar(in,[4,5]*2)/4+in };
    ~varnam[16] = \\filter -> {|in| CompanderD.ar(in,4/3,1/2,1/2)/2+in};

  z.play;

);" ],
[ 2945.282474526, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!3,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam[0]={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(72*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = sig * puls.range(0,1);
        Splay.ar(sig.flat,0.25,0.5);
      };
      ~varnam.play;

      8.wait;
    };

  });

  ~varnam[8] = \\filter -> {|in| RLPF.ar(in,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100) + in;};
  ~varnam[10] = \\filter -> {|in| in + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)))};
  ~varnam[12] = \\filter -> {|in| AllpassC.ar(in,1/4,1/4,[5,4]) + in };
  ~varnam[14] = \\filter -> {|in| GVerb.ar(in,[4,5]*2)/4+in };
  ~varnam[16] = \\filter -> {|in| CompanderD.ar(in,4/3,1/2,1/2)/2+in};

  z.play;

);" ],
[ 2951.446718762, 'me', "thisProcess.stop;" ],
[ 2951.706022087, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!3,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam[0]={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(72*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = sig * puls.range(0,1);
        Splay.ar(sig.flat,0.25,0.5);
      };
      ~varnam.play;

      8.wait;
    };

  });

  ~varnam[8] = \\filter -> {|in| RLPF.ar(in,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100) + in;};
  ~varnam[10] = \\filter -> {|in| in + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)))};
  ~varnam[12] = \\filter -> {|in| AllpassC.ar(in,1/4,1/4,[5,4]) + in };
  ~varnam[14] = \\filter -> {|in| GVerb.ar(in,[4,5]*2)/4+in };
  ~varnam[16] = \\filter -> {|in| CompanderD.ar(in,4/3,1/2,1/2)/2+in};

  z.play;

);" ],
[ 2973.069111779, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!3,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam[0]={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(72*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = sig * puls.range(0,1);
        Splay.ar(sig.flat,0.25,0.5);
      };
      ~varnam.play;

      8.wait;
    };

  });

  ~varnam[8] = \\filter -> {|in| RLPF.ar(in,1400*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100) ;};
  ~varnam[10] = \\filter -> {|in| in + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)))};
  ~varnam[12] = \\filter -> {|in| AllpassC.ar(in,1/4,1/4,[5,4]) + in };
  ~varnam[14] = \\filter -> {|in| GVerb.ar(in,[4,5]*2)/4+in };
  ~varnam[16] = \\filter -> {|in| CompanderD.ar(in,4/3,1/2,1/2)/2+in};

  z.play;

);" ],
[ 2979.52302041, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,4)}!3,[1,2,1.25,1.5,1/2,1.75])};

      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam[0]={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(72*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = sig * puls.range(0,1);
        Splay.ar(sig.flat,0.25,0.5);
      };
      ~varnam.play;

      8.wait;
    };

  });

  ~varnam[8] = \\filter -> {|in| RLPF.ar(in,4000*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100) ;};
  ~varnam[10] = \\filter -> {|in| in + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)))};
  ~varnam[12] = \\filter -> {|in| AllpassC.ar(in,1/4,1/4,[5,4]) + in };
  ~varnam[14] = \\filter -> {|in| GVerb.ar(in,[4,5]*2)/4+in };
  ~varnam[16] = \\filter -> {|in| CompanderD.ar(in,4/3,1/2,1/2)/2+in};

  z.play;

);" ],
[ 3053.024105299, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,6)}!3,[1,2,1.25,1.5,1/2,1.75])};

      ~notes.quant=2;
      ~notes.fadeTime=0.02;
      ~notes = {Select.kr({ExpRand(1.0001,4)}!3,[1,2,1.25,1.5,1/2,1.75])};


      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam[0]={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(~notes.kr*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = sig * puls.range(0,1);
        Splay.ar(sig.flat,0.25,0.5);
      };
      ~varnam.play;

      8.wait;
    };

  });

  ~varnam[8] = \\filter -> {|in| RLPF.ar(in,4000*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100) ;};
  ~varnam[10] = \\filter -> {|in| in + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)))};
  ~varnam[12] = \\filter -> {|in| AllpassC.ar(in,1/4,1/4,[5,4]) + in };
  ~varnam[14] = \\filter -> {|in| GVerb.ar(in,[4,5]*2)/4+in };
  ~varnam[16] = \\filter -> {|in| CompanderD.ar(in,4/3,1/2,1/2)/2+in};

  z.play;

);" ],
[ 3076.278669096, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,6)}!3,[1,2,1.25,1.5,1/2,1.75])};

      ~notes.quant=2;
      ~notes.fadeTime=0.02;
      ~notes = {Select.kr({ExpRand(1.0001,4)}!3,[36,48,60,58].midicps)};


      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam[0]={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(~notes.kr*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = sig * puls.range(0,1);
        Splay.ar(sig.flat,0.25,0.5);
      };
      ~varnam.play;

      8.wait;
    };

  });

  ~varnam[8] = \\filter -> {|in| RLPF.ar(in,4000*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100) ;};
  ~varnam[10] = \\filter -> {|in| in + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)))};
  ~varnam[12] = \\filter -> {|in| AllpassC.ar(in,1/4,1/4,[5,4]) + in };
  ~varnam[14] = \\filter -> {|in| GVerb.ar(in,[4,5]*2)/4+in };
  ~varnam[16] = \\filter -> {|in| CompanderD.ar(in,4/3,1/2,1/2)/2+in};

  z.play;

);" ],
[ 3079.852059576, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,6)}!3,[1,2,1.25,1.5,1/2,1.75])};

      ~notes.quant=2;
      ~notes.fadeTime=0.02;
      ~notes = {Select.kr({ExpRand(1.0001,4)},[36,48,60,58].midicps)};


      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam[0]={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(~notes.kr*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = sig * puls.range(0,1);
        Splay.ar(sig.flat,0.25,0.5);
      };
      ~varnam.play;

      8.wait;
    };

  });

  ~varnam[8] = \\filter -> {|in| RLPF.ar(in,4000*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100) ;};
  ~varnam[10] = \\filter -> {|in| in + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)))};
  ~varnam[12] = \\filter -> {|in| AllpassC.ar(in,1/4,1/4,[5,4]) + in };
  ~varnam[14] = \\filter -> {|in| GVerb.ar(in,[4,5]*2)/4+in };
  ~varnam[16] = \\filter -> {|in| CompanderD.ar(in,4/3,1/2,1/2)/2+in};

  z.play;

);" ],
[ 3084.223969264, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,6)}!3,[1,2,1.25,1.5,1/2,1.75])};

      ~notes.quant=2;
      ~notes.fadeTime=0.02;
      ~notes = {Select.kr(ExpRand(1.0001,4),[36,48,60,58].midicps)};


      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam[0]={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(~notes.kr*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = sig * puls.range(0,1);
        Splay.ar(sig.flat,0.25,0.5);
      };
      ~varnam.play;

      8.wait;
    };

  });

  ~varnam[8] = \\filter -> {|in| RLPF.ar(in,4000*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100) ;};
  ~varnam[10] = \\filter -> {|in| in + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)))};
  ~varnam[12] = \\filter -> {|in| AllpassC.ar(in,1/4,1/4,[5,4]) + in };
  ~varnam[14] = \\filter -> {|in| GVerb.ar(in,[4,5]*2)/4+in };
  ~varnam[16] = \\filter -> {|in| CompanderD.ar(in,4/3,1/2,1/2)/2+in};

  z.play;

);" ],
[ 3091.724716774, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,6)}!3,[1,2,1.25,1.5,1/2,1.75])};

      ~notes.quant=2;
      ~notes.fadeTime=0.02;
      ~notes = {Select.kr({ExpRand(1.0001,4)},[36,48,60,58].midicps)};


      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam[0]={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(~notes.kr*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = sig * puls.range(0,1);
        Splay.ar(sig.flat,0.25,0.5);
      };
      ~varnam.play;

      8.wait;
    };

  });

  ~varnam[8] = \\filter -> {|in| RLPF.ar(in,4000*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100) ;};
  ~varnam[10] = \\filter -> {|in| in + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)))};
  ~varnam[12] = \\filter -> {|in| AllpassC.ar(in,1/4,1/4,[5,4]) + in };
  ~varnam[14] = \\filter -> {|in| GVerb.ar(in,[4,5]*2)/4+in };
  ~varnam[16] = \\filter -> {|in| CompanderD.ar(in,4/3,1/2,1/2)/2+in};

  z.play;

);" ],
[ 3111.485726502, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,6)}!3,[1,2,1.25,1.5,1/2,1.75])};

      ~notes.quant=2;
      ~notes.fadeTime=0.02;
      ~notes = {Select.kr({ExpRand(1.0001,4)}!2,[36,48,60,58].midicps)};


      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam[0]={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(~notes.kr*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = sig * puls.range(0,1);
        Splay.ar(sig.flat,0.25,0.5);
      };
      ~varnam.play;

      8.wait;
    };

  });

  ~varnam[8] = \\filter -> {|in| RLPF.ar(in,4000*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100) ;};
  ~varnam[10] = \\filter -> {|in| in + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)))};
  ~varnam[12] = \\filter -> {|in| AllpassC.ar(in,1/4,1/4,[5,4]) + in };
  ~varnam[14] = \\filter -> {|in| GVerb.ar(in,[4,5]*2)/4+in };
  ~varnam[16] = \\filter -> {|in| CompanderD.ar(in,4/3,1/2,1/2)/2+in};

  z.play;

);" ],
[ 3123.734294056, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,6)}!3,[1,2,1.25,1.5,1/2,1.75])};

      ~notes.quant=2;
      ~notes.fadeTime=0.02;
      ~notes = {Select.kr({ExpRand(1.0001,4)}!2,[36,48,60,58])};


      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam[0]={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(~notes.kr.midicps*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = sig * puls.range(0,1);
        Splay.ar(sig.flat,0.25,0.5);
      };
      ~varnam.play;

      8.wait;
    };

  });

  ~varnam[8] = \\filter -> {|in| RLPF.ar(in,4000*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100) ;};
  ~varnam[10] = \\filter -> {|in| in + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)))};
  ~varnam[12] = \\filter -> {|in| AllpassC.ar(in,1/4,1/4,[5,4]) + in };
  ~varnam[14] = \\filter -> {|in| GVerb.ar(in,[4,5]*2)/4+in };
  ~varnam[16] = \\filter -> {|in| CompanderD.ar(in,4/3,1/2,1/2)/2+in};

  z.play;

);" ],
[ 3130.578971279, 'me', "thisProcess.stop;" ],
[ 3131.254846939, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,6)}!3,[1,2,1.25,1.5,1/2,1.75])};

      ~notes.quant=2;
      ~notes.fadeTime=0.02;
      ~notes = {Select.kr({ExpRand(1.0001,4)}!2,[36,48,60,58])};


      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam[0]={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(~notes.kr.midicps*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = sig * puls.range(0,1);
        Splay.ar(sig.flat,0.25,0.5);
      };
      ~varnam.play;

      8.wait;
    };

  });

  ~varnam[8] = \\filter -> {|in| RLPF.ar(in,4000*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100) ;};
  ~varnam[10] = \\filter -> {|in| in + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)))};
  ~varnam[12] = \\filter -> {|in| AllpassC.ar(in,1/4,1/4,[5,4]) + in };
  ~varnam[14] = \\filter -> {|in| GVerb.ar(in,[4,5]*2)/4+in };
  ~varnam[16] = \\filter -> {|in| CompanderD.ar(in,4/3,1/2,1/2)/2+in};

  z.play;

);" ],
[ 3166.157478267, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,6)}!3,[1,2,1.25,1.5,1/2,1.75])};

      ~notes.quant=2;
      ~notes.fadeTime=0.02;
      ~notes = {Select.kr({ExpRand(1.0001,7)}!2,[36,48,60,58,55,65,67])};


      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam[0]={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(~notes.kr.midicps*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = sig * puls.range(0,1);
        Splay.ar(sig.flat,0.25,0.5);
      };
      ~varnam.play;

      8.wait;
    };

  });

  ~varnam[8] = \\filter -> {|in| RLPF.ar(in,4000*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100) ;};
  ~varnam[10] = \\filter -> {|in| in + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)))};
  ~varnam[12] = \\filter -> {|in| AllpassC.ar(in,1/4,1/4,[5,4]) + in };
  ~varnam[14] = \\filter -> {|in| GVerb.ar(in,[4,5]*2)/4+in };
  ~varnam[16] = \\filter -> {|in| CompanderD.ar(in,4/3,1/2,1/2)/2+in};

  z.play;

);" ],
[ 3182.91190152, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,6)}!3,[1,2,1.25,1.5,1/2,1.75])};

      ~notes.quant=2;
      ~notes.fadeTime=0.02;
      ~notes = {Select.kr({ExpRand(1.0001,7)}!2,[36,48,60,58,55,65,67])};


      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam[0]={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(1,(0..3)+[0.5,0.25]/4),0.85);
        var sig = LFSaw.ar(~notes.kr.midicps*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = sig * puls.range(0,1);
        Splay.ar(sig.flat,0.25,0.5);
      };
      ~varnam.play;

      8.wait;
    };

  });

  ~varnam[8] = \\filter -> {|in| RLPF.ar(in,1600*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100) ;};
  ~varnam[10] = \\filter -> {|in| in + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)))};
  ~varnam[12] = \\filter -> {|in| AllpassC.ar(in,1/4,1/4,[5,4]) + in };
  ~varnam[14] = \\filter -> {|in| GVerb.ar(in,[4,5]*2)/4+in };
  ~varnam[16] = \\filter -> {|in| CompanderD.ar(in,4/3,1/2,1/2)/2+in};

  z.play;

);" ],
[ 3202.512428209, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,6)}!3,[1,2,1.25,1.5,1/2,1.75])};

      ~notes.quant=2;
      ~notes.fadeTime=0.02;
      ~notes = {Select.kr({ExpRand(1.0001,7)}!2,[36,48,60,58,55,65,67])};


      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam[0]={
        var mld = [1,2,1.5,1.25,4,8,16] * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(2,(0..3)+[0.5,0.25]/4),0.15);
        var sig = LFSaw.ar(~notes.kr.midicps*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = sig * puls.range(0,1);
        Splay.ar(sig.flat,0.25,0.5);
      };
      ~varnam.play;

      8.wait;
    };

  });

  ~varnam[8] = \\filter -> {|in| RLPF.ar(in,1600*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100) ;};
  ~varnam[10] = \\filter -> {|in| in + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)))};
  ~varnam[12] = \\filter -> {|in| AllpassC.ar(in,1/4,1/4,[5,4]) + in };
  ~varnam[14] = \\filter -> {|in| GVerb.ar(in,[4,5]*2)/4+in };
  ~varnam[16] = \\filter -> {|in| CompanderD.ar(in,4/3,1/2,1/2)/2+in};

  z.play;

);" ],
[ 3221.465918368, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,6)}!3,[1,2,1.25,1.5,1/2,1.75])};

      ~notes.quant=2;
      ~notes.fadeTime=0.02;
      ~notes = {Select.kr({ExpRand(1.0001,7)}!2,[36,48,60,58,55,65,67])};


      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam[0]={
        var mld = [1,2,1.5,1.25,4,8,16].scramble * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(2,(0..3)+[0.5,0.25]/4),0.15);
        var sig = LFSaw.ar(~notes.kr.midicps*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = sig * puls.range(0,1);
        Splay.ar(sig.flat,0.25,0.5);
      };
      ~varnam.play;

      8.wait;
    };

  });

  ~varnam[8] = \\filter -> {|in| RLPF.ar(in,1600*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100) ;};
  ~varnam[10] = \\filter -> {|in| in + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)))};
  ~varnam[12] = \\filter -> {|in| AllpassC.ar(in,1/4,1/4,[5,4]) + in };
  ~varnam[14] = \\filter -> {|in| GVerb.ar(in,[4,5]*2)/4+in };
  ~varnam[16] = \\filter -> {|in| CompanderD.ar(in,4/3,1/2,1/2)/2+in};

  z.play;

);" ],
[ 3241.987066675, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,6)}!3,[1,2,1.25,1.5,1/2,1.75])};

      ~notes.quant=2;
      ~notes.fadeTime=0.02;
      ~notes = {Select.kr({ExpRand(1.0001,7)}!2,[36,48,60,58,55,65,67])};


      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam[0]={
        var mld = [1,2,1.5,1.25,4,8,16].scramble * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(2,(0..3)+[0.5,0.25]/4),0.35);
        var sig = LFSaw.ar(~notes.kr.midicps*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = sig * puls.range(0,1);
        Splay.ar(sig.flat,0.25,0.5);
      };
      ~varnam.play;

      8.wait;
    };

  });

  ~varnam[8] = \\filter -> {|in| RLPF.ar(in,1600*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100) ;};
  ~varnam[10] = \\filter -> {|in| in + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)))};
  ~varnam[12] = \\filter -> {|in| AllpassC.ar(in,1/4,1/4,[5,4]) + in };
  ~varnam[14] = \\filter -> {|in| GVerb.ar(in,[4,5]*2)/4+in };
  ~varnam[16] = \\filter -> {|in| CompanderD.ar(in,4/3,1/2,1/2)/2+in};

  z.play;

);" ],
[ 3285.512883787, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,6)}!3,[1,2,1.25,1.5,1/2,1.75])};

      ~notes.quant=2;
      ~notes.fadeTime=0.02;
      ~notes = {Select.kr({ExpRand(1.0001,4)}!2,[48,60,58,72])};


      ~varnam.quant=2;
      ~varnam.fadeTime=2;
      ~varnam[0]={
        var mld = [1,2,1.5,1.25,4,8,16].scramble * ~arcitune.kr;
        var puls = Decay.ar(Impulse.ar(2,(0..3)+[0.5,0.25]/4),0.35);
        var sig = LFSaw.ar(~notes.kr.midicps*mld*[1,1.5,1,1.25,1,1.125]+(puls.range(0,2)**2),mul:{ExpRand(0.01,0.5)}!8);
        sig = sig * puls.range(0,1);
        Splay.ar(sig.flat,0.25,0.5);
      };
      ~varnam.play;

      8.wait;
    };

  });

  ~varnam[8] = \\filter -> {|in| RLPF.ar(in,1600*LFTri.ar(1/4/fib(8)).exprange(0.001,1)+100) ;};
  ~varnam[10] = \\filter -> {|in| in + (HPF.ar(WhiteNoise.ar(0.01!2),2000) * EnvGen.ar(Env([0,1,0],[0.002,0.24],[3,-3]),Impulse.ar(1/4,[1,2,3]/16)))};
  ~varnam[12] = \\filter -> {|in| AllpassC.ar(in,1/4,1/4,[5,4]) + in };
  ~varnam[14] = \\filter -> {|in| GVerb.ar(in,[4,5]*2)/4+in };
  ~varnam[16] = \\filter -> {|in| CompanderD.ar(in,4/3,1/2,1/2)/2+in};

  z.play;

);" ],
[ 3286.593205419, 'me', "(
  z = Tdef(\\asd,{

    loop{
      ~arcitune.quant=2;
      ~arcitune.fadeTime=0.02;
      ~arcitune = {Select.kr({ExpRand(1.0001,6)}!3,[1,2,1.25,1.5,1/2,1.75])};

      