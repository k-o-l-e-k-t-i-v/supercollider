// History, as it was on Sun Jun 14 17:41:17 2015.

[
[ 0, 'me', "(
~lkjlkj.quant=2;
~lkjlkj.fadeTime=5;
~lkjlkj={
  var sig = LFPulse.ar(50!2);
  sig = OnePole.ar(sig,LFSaw.ar(1/4).exprange(0.001,1));
  Splay.ar(sig.flat,0.25,0.5);
};
~lkjlkj.play;
);" ],
[ 11.250073362, 'me', "(
~lkjlkj.quant=2;
~lkjlkj.fadeTime=5;
~lkjlkj={
  var sig = LFPulse.ar(50!2);
  sig = OnePole.ar(sig,LFSaw.ar(4).exprange(0.001,1));
  Splay.ar(sig.flat,0.25,0.5);
};
~lkjlkj.play;
);" ],
[ 30.896995893, 'me', "(
~lkjlkj.quant=2;
~lkjlkj.fadeTime=5;
~lkjlkj={
  var sig = LFPulse.ar(50!2);
  sig = BPF.ar(OnePole.ar(sig,LFSaw.ar(4).exprange(0.001,1)),LFSaw.ar(1/4).exprange(100.001,10000));
  Splay.ar(sig.flat,0.25,0.5);
};
~lkjlkj.play;
);" ],
[ 52.126747854, 'me', "(
~lkjlkj.quant=2;
~lkjlkj.fadeTime=5;
~lkjlkj={
  var sig = LFPulse.ar(50!2);
  sig = BPF.ar(OnePole.ar(sig,LFSaw.ar(4).exprange(0.001,1)),LFSaw.ar(4).exprange(100.001,10000));
  Splay.ar(sig.flat,0.25,0.5);
};
~lkjlkj.play;
);" ],
[ 68.291107683, 'me', "(
~lkjlkj.quant=2;
~lkjlkj.fadeTime=5;
~lkjlkj={
  var sig = LFPulse.ar(50+((1..8)/8));
  sig = BPF.ar(OnePole.ar(sig,LFSaw.ar(4).exprange(0.001,1)),LFSaw.ar(4).exprange(100.001,10000));
  Splay.ar(sig.flat,0.25,0.5);
};
~lkjlkj.play;
);" ],
[ 70.6502753, 'me', "(
~lkjlkj.quant=2;
~lkjlkj.fadeTime=5;
~lkjlkj={
  var sig = LFPulse.ar(50+((1..8)/100));
  sig = BPF.ar(OnePole.ar(sig,LFSaw.ar(4).exprange(0.001,1)),LFSaw.ar(4).exprange(100.001,10000));
  Splay.ar(sig.flat,0.25,0.5);
};
~lkjlkj.play;
);" ],
[ 77.766374394, 'me', "(
~lkjlkj.quant=2;
~lkjlkj.fadeTime=5;
~lkjlkj={
  var sig = LFPulse.ar(50+((1..8)/10));
  sig = BPF.ar(OnePole.ar(sig,LFSaw.ar(4).exprange(0.001,1)),LFSaw.ar(4).exprange(100.001,10000));
  Splay.ar(sig.flat,0.25,0.5);
};
~lkjlkj.play;
);" ],
[ 83.66566969, 'me', "(
~lkjlkj.quant=2;
~lkjlkj.fadeTime=5;
~lkjlkj={
  var sig = LFPulse.ar(50+((1..8)/4));
  sig = BPF.ar(OnePole.ar(sig,LFSaw.ar(4).exprange(0.001,1)),LFSaw.ar(4).exprange(100.001,10000));
  Splay.ar(sig.flat,0.25,0.5);
};
~lkjlkj.play;
);" ],
[ 104.963885354, 'me', "(
~lkjlkj.quant=2;
~lkjlkj.fadeTime=5;
~lkjlkj={
  var sig = LFPulse.ar(50+((1..8)/4));
  sig = BPF.ar(OnePole.ar(sig,LFSaw.ar(4).exprange(0.001,1)),LFSaw.ar(4).exprange(100.001,10000));
  sig = CombN.ar(sig,1,1,4);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkjlkj.play;
);" ],
[ 147.69548622, 'me', "HelpBrowser.openHelpFor(\"4\");" ],
[ 197.562984672, 'me', "(
~lkjlkj.quant=2;
~lkjlkj.fadeTime=5;
~lkjlkj={
  var sig = LFPulse.ar(432+((1..8)/4));
  sig = BPF.ar(OnePole.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)),LFSaw.ar(1/4/fib(8)).exprange(100.001,10000));
  10.do{|i|
  sig = CombN.ar(sig,1,1/(i+1),4);
       };
  Splay.ar(sig.flat,0.25,0.5);
};
~lkjlkj.play;
);" ],
[ 208.467632906, 'me', "(
~lkjlkj.quant=2;
~lkjlkj.fadeTime=5;
~lkjlkj={
  var sig = LFPulse.ar(432+((1..8)/4));
  sig = BPF.ar(OnePole.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)),LFSaw.ar(1/4/fib(8)).exprange(100.001,10000));
  10.do{|i|
  sig = CombN.ar(sig/4,1,1/(i+1),4);
       };
  Splay.ar(sig.flat,0.25,0.5);
};
~lkjlkj.play;
);" ],
[ 227.127255544, 'me', "(
~lkjlkj.quant=2;
~lkjlkj.fadeTime=5;
~lkjlkj={
  var sig = LFPulse.ar(432+((1..8)/4));
  sig = BPF.ar(OnePole.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)),LFSaw.ar(1/4/fib(8)).exprange(100.001,10000));
  10.do{|i|
  sig = CombN.ar(Limiter.ar(sig),1,1/(i+1),4);
       };
  Splay.ar(sig.flat,0.25,0.5);
};
~lkjlkj.play;
);" ],
[ 238.433822155, 'me', "(
~lkjlkj.quant=2;
~lkjlkj.fadeTime=5;
~lkjlkj={
  var sig = LFPulse.ar(432+((1..8)/4));
  sig = BPF.ar(OnePole.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)),LFSaw.ar(1/4/fib(8)).exprange(100.001,10000));
  10.do{|i|
  sig = CombN.ar(sig.softclip,1,1