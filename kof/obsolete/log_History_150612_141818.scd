// History, as it was on Fri Jun 12 14:18:18 2015.

[
[ 0, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)/4),0.1);
  sig = Greyhole.ar(sig,1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 15.142848837, 'me', "(
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)/4),0.1);
  sig = Greyhole.ar(sig,1/4,0,8);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 31.110486637, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)/4),0.25);
  sig = Greyhole.ar(sig,1/4,0,8);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 47.72723009, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  sig = sig * Pulse.ar(2);
  sig = Greyhole.ar(sig,1/4,0,8);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 54.781733712, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  sig = sig * Pulse.ar(2);
  sig = Greyhole.ar(sig,1/4,0,8)/8+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 71.537275587, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)++0.5/4),0.2);
  sig = Greyhole.ar(sig,1/4,0,8)/8+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 77.320001737, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)++0.5/4),0.4);
  sig = Greyhole.ar(sig,1/4,0,8)/8+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 86.744342041, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)++0.5/4),0.4);
  sig = Greyhole.ar(sig,1/4,0,8)/8+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 89.006059686, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)++0.5/4),0.4);
  sig = Greyhole.ar(sig,1/4,0,8)/4+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 95.08111799, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)++0.5/4),0.4);
  sig = Greyhole.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 129.070850417, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)++0.5/4),0.4);
  sig= CombN.ar(sig,1,MouseX.kr(0.001,1),8);
  sig = Greyhole.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 159.297904876, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)++0.5/4),0.4);
  sig= CombN.ar(sig,1,LFSaw.ar(1).range(1,0.0001),8);
  sig = Greyhole.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 167.465447303, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)++0.5/4),0.4);
  sig= CombN.ar(sig,1,LFSaw.ar(1/4).range(1,0.0001),8);
  sig = Greyhole.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 173.833627339, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)++0.5/4),0.4);
  sig= CombN.ar(sig,1,LFSaw.ar(1/4).exprange(1.01,0.0001),8);
  sig = Greyhole.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 184.278025823, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)++0.5/4),0.4);
  sig= CombN.ar(sig,1,LFSaw.ar(1/4).exprange(1.01,0.001),8);
  sig = Greyhole.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 188.136194414, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)++0.5/4),0.4);
  sig= CombN.ar(sig,1,LFSaw.ar(4).exprange(1.01,0.001),8);
  sig = Greyhole.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 195.527979326, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.4);
  sig= CombN.ar(sig,1,LFSaw.ar(4).exprange(1.01,0.001),8);
  sig = Greyhole.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 203.371840764, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.4);
  sig= CombN.ar(sig,1,LFSaw.ar(1/4).exprange(1.01,0.001),8);
  sig = Greyhole.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 207.307455992, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.4);
  sig= CombN.ar(sig,1,LFSaw.ar(1/fib(8)).exprange(1.01,0.001),8);
  sig = Greyhole.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 215.914138481, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.4);
  sig= CombN.ar(sig,1,LFSaw.ar(1/fib(8)).exprange(1.01,0.001),8);
  sig = Greyhole.ar(sig)/8+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 220.412214975, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.4);
  sig= CombN.ar(sig,1,LFSaw.ar(1/fib(8)).exprange(1.01,0.001),1);
  sig = Greyhole.ar(sig)/8+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 232.323312737, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.4);
  sig= CombN.ar(sig,1,LFSaw.ar(1/fib(8)).exprange(1.01,0.001),1);
  sig = sig * Pulse.ar(4);
  sig = Greyhole.ar(sig)/8+sig;
  Splay.ar(sig.flat,0.25,0.015);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 237.817455462, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.4);
  sig= CombN.ar(sig,1,LFSaw.ar(1/fib(8)).exprange(1.01,0.001),1);
  sig = sig * Pulse.ar(4);
  sig = Greyhole.ar(sig)/8+sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 243.464323027, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.4);
  sig= CombN.ar(sig,1,LFSaw.ar(1/fib(8)).exprange(1.01,0.001),1);
  sig = sig * Pulse.ar(4);
  sig = Greyhole.ar(sig)/8+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 274.42873502, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.4);
  sig= CombN.ar(sig,1,LFSaw.ar(1/fib(8)).exprange(1.01,0.001),1);
  sig = sig * Pulse.ar(4);
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(44.001,20000));
  sig = Greyhole.ar(sig)/8+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 288.71755965, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.4);
  sig= CombN.ar(sig,1,LFSaw.ar(1/8/fib(8)).exprange(1.01,0.001),1);
  sig = sig * Pulse.ar(4);
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(44.001,20000));
  sig = Greyhole.ar(sig)/8+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 308.108477856, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.4);
  sig= CombN.ar(sig,1,LFSaw.ar(1/8/fib(8)).exprange(1.01,0.001),1);
  sig = sig * Pulse.ar(4);
  sig = BPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(44.001,20000));
  sig = Greyhole.ar(sig)/8+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 321.877454031, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.4);
  sig= CombN.ar(sig,1,LFSaw.ar(1/8/fib(8)).exprange(1.01,0.001).round(0.02),1);
  sig = sig * Pulse.ar(4);
  sig = BPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(44.001,20000));
  sig = Greyhole.ar(sig)/8+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 334.843815118, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.6);
  sig= CombN.ar(sig,1,LFSaw.ar(1/8/fib(8)).exprange(1.01,0.001).round(0.02),1);
  sig = sig * Pulse.ar(4);
  sig = BPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(44.001,20000));
  sig = Greyhole.ar(sig)/8+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 342.176722927, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  sig = sig * Decay.ar(Impulse.ar(1/4,(0..3)++0.5/4),1);
  sig= CombN.ar(sig,1,LFSaw.ar(1/8/fib(8)).exprange(1.01,0.001).round(0.02),1);
  sig = sig * Pulse.ar(4);
  sig = BPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(44.001,20000));
  sig = Greyhole.ar(sig)/8+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 353.225591209, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  sig = sig * Decay.ar(Impulse.ar(1/4,(0..3)++0.5/4),1);
  sig= CombN.ar(sig,1,LFSaw.ar(1/8/fib(8)).exprange(1.01,0.001).round(0.02),16);
  sig = sig * Pulse.ar(4);
  sig = BPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(44.001,20000));
  sig = Greyhole.ar(sig)/8+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 368.895645291, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  sig = sig * Decay.ar(Impulse.ar(1/4,(0..3)++0.5/4),1);
  sig= CombN.ar(sig,1,LFSaw.ar(1/8/fib(8)).exprange(1.01,0.001).round(0.02),16);
  sig = sig * Pulse.ar(1);
  sig = BPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(44.001,20000));
  sig = Greyhole.ar(sig)/8+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 376.769475655, 'me', "(
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  sig = sig * Decay.ar(Impulse.ar(1/4,(0..3)++0.5/4),1);
  sig= CombN.ar(sig,1,LFSaw.ar(1/8/fib(8)).exprange(1.01,0.001).round(0.02),16);
  sig = sig * Pulse.ar(2);
  sig = BPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(44.001,20000));
  sig = Greyhole.ar(sig)/8+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 388.647830655, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  sig = sig * Decay.ar(Impulse.ar(1/4,(0..3)++0.5/4),1);
  sig= CombN.ar(sig,1,LFSaw.ar(1/8/fib(8)).exprange(1.01,0.001).round(0.02),16);
  sig = sig * Pulse.ar(2);
  sig = BPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(44.001,20000));
  sig = Greyhole.ar(sig,1,0,4)/8+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 397.058465803, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  sig = sig * Decay.ar(Impulse.ar(1/4,(0..3)++0.5/4),1);
  sig= CombN.ar(sig,1,LFSaw.ar(1/8/fib(8)).exprange(1.01,0.001).round(0.02),16);
  sig = sig * Pulse.ar(2);
  sig = BPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(44.001,20000));
  sig = Greyhole.ar(sig,1,0,4)/8+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 400.092404157, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  sig = sig * Decay.ar(Impulse.ar(1/4,(0..3)++0.5/4),1);
  sig= CombN.ar(sig,1,LFSaw.ar(1/8/fib(8)).exprange(1.01,0.001).round(0.02),16);
  sig = sig * Pulse.ar(2);
  sig = BPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(44.001,2000));
  sig = Greyhole.ar(sig,1,0,4)/8+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 413.76433542, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  sig = sig * Decay.ar(Impulse.ar(1/4,(0..3)++0.5/4),1);
  sig= CombN.ar(sig,1,LFSaw.ar(1/8/fib(8)).exprange(1.01,0.001).round(0.02),16);
  sig = sig * Pulse.ar(2);
  sig = LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(44.001,2000));
  sig = Greyhole.ar(sig,1,0,4)/8+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 425.137033518, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  sig = sig * Decay.ar(Impulse.ar(1/4,(0..3)++0.5/4),1);
  sig= CombN.ar(sig,1,LFSaw.ar(1/8/fib(8)).exprange(1.01,0.001).round(0.002),16);
  sig = sig * Pulse.ar(2);
  sig = LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(44.001,2000));
  sig = Greyhole.ar(sig,1,0,4)/8+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 431.715361407, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  sig = sig * Decay.ar(Impulse.ar(1/4,(0..3)++0.5/4),1);
  sig= CombN.ar(sig,1,LFSaw.ar(1/8/fib(8)).exprange(1.01,0.001).round(0.002),8);
  sig = sig * Pulse.ar(2);
  sig = LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(44.001,2000));
  sig = Greyhole.ar(sig,1,0,4)/8+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 435.185408975, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  sig = sig * Decay.ar(Impulse.ar(1/4,(0..3)++0.5/4),1);
  sig= CombN.ar(sig,1,LFSaw.ar(1/8/fib(8)).exprange(1.01,0.001).round(0.002),8);
  sig = sig * Pulse.ar(4);
  sig = LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(44.001,2000));
  sig = Greyhole.ar(sig,1,0,4)/8+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 442.455596205, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  //sig = sig * Decay.ar(Impulse.ar(1/4,(0..3)++0.5/4),1);
  sig= CombN.ar(sig,1,LFSaw.ar(1/8/fib(8)).exprange(1.01,0.001).round(0.002),8);
  sig = sig * Pulse.ar(4);
  sig = LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(44.001,2000));
  sig = Greyhole.ar(sig,1,0,4)/8+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 449.211838515, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  //sig = sig * Decay.ar(Impulse.ar(1/4,(0..3)++0.5/4),1);
  sig= CombN.ar(sig,1,LFSaw.ar(1/8/fib(8)).exprange(1.01,0.001).round(0.002),8);
  sig = sig * Pulse.ar(4);
  sig = LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(44.001,2000));
  sig = Greyhole.ar(sig,1,0,4)/8+sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 458.532343544, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  //sig = sig * Decay.ar(Impulse.ar(1/4,(0..3)++0.5/4),1);
  sig= CombN.ar(sig,1,LFSaw.ar(1/8/fib(8)).exprange(1.01,0.0001).round(0.002),8);
  sig = sig * Pulse.ar(4);
  sig = LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(44.001,2000));
  sig = Greyhole.ar(sig,1,0,4)/8+sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 462.63371378, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  //sig = sig * Decay.ar(Impulse.ar(1/4,(0..3)++0.5/4),1);
  sig= CombN.ar(sig,1,LFSaw.ar(1/8/fib(8)).exprange(1.01,0.0001).round(0.0002),8);
  sig = sig * Pulse.ar(4);
  sig = LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(44.001,2000));
  sig = Greyhole.ar(sig,1,0,4)/8+sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 472.933990096, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  //sig = sig * Decay.ar(Impulse.ar(1/4,(0..3)++0.5/4),1);
  sig= CombN.ar(sig,1,LFSaw.ar(1/8/fib(8)).exprange(1.01,0.0001).round(0.0002),0.25);
  sig = sig * Pulse.ar(4);
  sig = LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(44.001,2000));
  sig = Greyhole.ar(sig,1,0,4)/8+sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 480.360185126, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  //sig = sig * Decay.ar(Impulse.ar(1/4,(0..3)++0.5/4),1);
  sig= CombN.ar(sig,1,LFSaw.ar(1/8/fib(8)).exprange(1.01,0.0001).round(0.0002),0.5);
  sig = sig * Pulse.ar(4);
  sig = LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(44.001,2000));
  sig = Greyhole.ar(sig,1,0,4)/8+sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 487.902420133, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  //sig = sig * Decay.ar(Impulse.ar(1/4,(0..3)++0.5/4),1);
  sig= CombN.ar(sig,1,LFSaw.ar(1/8/fib(8)).exprange(1.01,0.0001).round(0.0002),0.5);
  sig = sig * Pulse.ar(4/fib(8));
  sig = LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(44.001,2000));
  sig = Greyhole.ar(sig,1,0,4)/8+sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 499.529290929, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  //sig = sig * Decay.ar(Impulse.ar(1/4,(0..3)++0.5/4),1);
  sig= CombN.ar(sig,1,LFSaw.ar(1/2/fib(8)).exprange(1.01,0.0001).round(0.0002),0.5);
  sig = sig * Pulse.ar(4/fib(8));
  sig = LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(44.001,2000));
  sig = Greyhole.ar(sig,1,0,4)/8+sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 516.07707367, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  //sig = sig * Decay.ar(Impulse.ar(1/4,(0..3)++0.5/4),1);
  sig= CombN.ar(sig,1,LFSaw.ar(1/fib(8)).exprange(1.01,0.0001).round(0.0002),0.5);
  sig = sig * Pulse.ar(4/fib(8));
  sig = LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(44.001,2000));
  sig = Greyhole.ar(sig,1,0,4)/8+sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 534.927360741, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2);
  //sig = sig * Decay.ar(Impulse.ar(1/4,(0..3)++0.5/4),1);
  sig= CombN.ar(sig,1,LFSaw.ar(1/fib(8)).exprange(1.01,0.0001).round(0.0002),0.5);
  sig = sig * Pulse.ar(4/fib(8));
  sig = LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(44.001,2000));
  sig = HPF.ar(sig,44);
  sig = Greyhole.ar(sig,1,0,4)/8+sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 556.536530869, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = WhiteNoise.ar(1!2) ++ SinOsc.ar(40);
  //sig = sig * Decay.ar(Impulse.ar(1/4,(0..3)++0.5/4),1);
  sig= CombN.ar(sig,1,LFSaw.ar(1/fib(8)).exprange(1.01,0.0001).round(0.0002),0.5);
  sig = sig * Pulse.ar(4/fib(8));
  sig = LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(44.001,2000));
  sig = HPF.ar(sig,44);
  sig = Greyhole.ar(sig,1,0,4)/8+sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 572.259095899, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = [] ++ WhiteNoise.ar(1) ++ SinOsc.ar(40);
  //sig = sig * Decay.ar(Impulse.ar(1/4,(0..3)++0.5/4),1);
  sig= CombN.ar(sig,1,LFSaw.ar(1/fib(8)).exprange(1.01,0.0001).round(0.0002),0.5);
  sig = sig * Pulse.ar(4/fib(8));
  sig = LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(44.001,2000));
  sig = HPF.ar(sig,44);
  sig = Greyhole.ar(sig,1,0,4)/8+sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 578.501846013, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = [] ++ BrownNoise.ar(1) ++ SinOsc.ar(40);
  //sig = sig * Decay.ar(Impulse.ar(1/4,(0..3)++0.5/4),1);
  sig= CombN.ar(sig,1,LFSaw.ar(1/fib(8)).exprange(1.01,0.0001).round(0.0002),0.5);
  sig = sig * Pulse.ar(4/fib(8));
  sig = LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(44.001,2000));
  sig = HPF.ar(sig,44);
  sig = Greyhole.ar(sig,1,0,4)/8+sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 589.799859125, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = [] ++ BrownNoise.ar(0.5) ++ PinkNoise.ar(0.5) ++ SinOsc.ar(40);
  //sig = sig * Decay.ar(Impulse.ar(1/4,(0..3)++0.5/4),1);
  sig= CombN.ar(sig,1,LFSaw.ar(1/fib(8)).exprange(1.01,0.0001).round(0.0002),0.5);
  sig = sig * Pulse.ar(4/fib(8));
  sig = LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(44.001,2000));
  sig = HPF.ar(sig,44);
  sig = Greyhole.ar(sig,1,0,4)/8+sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 595.954411972, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = [] ++ BrownNoise.ar(0.5) ++ PinkNoise.ar(0.5) ++ LFSaw.ar(40);
  //sig = sig * Decay.ar(Impulse.ar(1/4,(0..3)++0.5/4),1);
  sig= CombN.ar(sig,1,LFSaw.ar(1/fib(8)).exprange(1.01,0.0001).round(0.0002),0.5);
  sig = sig * Pulse.ar(4/fib(8));
  sig = LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(44.001,2000));
  sig = HPF.ar(sig,44);
  sig = Greyhole.ar(sig,1,0,4)/8+sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 599.160411866, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = [] ++ BrownNoise.ar(0.25) ++ PinkNoise.ar(0.25) ++ LFSaw.ar(40);
  //sig = sig * Decay.ar(Impulse.ar(1/4,(0..3)++0.5/4),1);
  sig= CombN.ar(sig,1,LFSaw.ar(1/fib(8)).exprange(1.01,0.0001).round(0.0002),0.5);
  sig = sig * Pulse.ar(4/fib(8));
  sig = LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(44.001,2000));
  sig = HPF.ar(sig,44);
  sig = Greyhole.ar(sig,1,0,4)/8+sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 606.0582057, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = [] ++ BrownNoise.ar(0.25) ++ PinkNoise.ar(0.25) ++ LFSaw.ar(4000);
  //sig = sig * Decay.ar(Impulse.ar(1/4,(0..3)++0.5/4),1);
  sig= CombN.ar(sig,1,LFSaw.ar(1/fib(8)).exprange(1.01,0.0001).round(0.0002),0.5);
  sig = sig * Pulse.ar(4/fib(8));
  sig = LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(44.001,2000));
  sig = HPF.ar(sig,44);
  sig = Greyhole.ar(sig,1,0,4)/8+sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 620.563575668, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = [] ++ BrownNoise.ar(0.25) ++ PinkNoise.ar(0.25) ++ LFSaw.ar(4000);
  sig= CombN.ar(sig,1,LFSaw.ar(1/8/fib(8)).exprange(1.01,0.0001).round(0.0002),0.5);
  sig = sig * Pulse.ar(4/fib(8));
  sig = LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(44.001,2000));
  sig = HPF.ar(sig,44);
  sig = Greyhole.ar(sig,1,0,4)/8+sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 635.378569491, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = [] ++ BrownNoise.ar(0.25) ++ PinkNoise.ar(0.25) ++ LFSaw.ar(4000);
  sig= CombN.ar(sig,1,LFSaw.ar(1/8/fib(8)).exprange(1.01,0.0001).round(0.0002),0.5);
  sig = sig * Pulse.ar(2);
  sig = LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(44.001,2000));
  sig = HPF.ar(sig,44);
  sig = Greyhole.ar(sig,1,0,4)/8+sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
[ 640.081645579, 'me', "(
~orel.quant=2;
~orel.fadeTime=2;
~orel={
  var sig = [] ++ BrownNoise.ar(0.25) ++ PinkNoise.ar(0.25) ++ LFSaw.ar(4000);
  sig= CombN.ar(sig,1,LFSaw.ar(1/8/fib(8)).exprange(1.01,0.0001).round(0.0002),0.5);
  sig = sig * Pulse.ar(2);
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(44.001,2000));
  sig = HPF.ar(sig,44);
  sig = Greyhole.ar(sig,1,0,4)/8+sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~orel,postVol:true);
~orel.play;
);" ],
];