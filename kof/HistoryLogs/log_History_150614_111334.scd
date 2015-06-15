// History, as it was on Sun Jun 14 11:13:34 2015.

[
[ 0, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = Mix.fill(2,{|i| SinOsc.ar((1..1000))});
  sig = sig ;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 7.208601971, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = Mix.fill(2,{|i| SinOsc.ar((1..100))});
  sig = sig ;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 14.44579922, 'me', "thisProcess.stop;" ],
[ 15.010943285, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = Mix.fill(2,{|i| SinOsc.ar((50..100))});
  sig = sig ;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 50.818957549, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = Mix.fill(2,{|i| SinOsc.ar(90+((50..100)/100))});
  sig = sig ;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 71.451754353, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = Mix.fill(2,{|i| SinOsc.ar(90+((50..100)/100),mul:0.1)});
  sig = sig ;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 80.782849449, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = Mix.fill(2,{|i| SinOsc.ar(190+((50..100)/100),mul:0.2)});
  sig = sig ;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 95.274990013, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = Mix.fill(2,{|i| SinOsc.ar(432+((50..100)/100),mul:0.2)});
  sig = sig ;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 102.137460351, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = Mix.fill(2,{|i| SinOsc.ar(432+((50..100)/10),mul:0.2)});
  sig = sig ;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 143.824472915, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = Mix.fill(1,{|i| SinOsc.ar(432+((50..100)/10),mul:0.2)});
  sig = sig ;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 160.196556777, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = Mix.fill(1,{|i| SinOsc.ar(432+((50..100)/1000),mul:0.2)});
  sig = sig ;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 163.912756183, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = Mix.fill(1,{|i| SinOsc.ar(432+((50..100)/100),mul:0.2)});
  sig = sig ;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 212.238112792, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = WhiteNoise.ar(0.1!2);
  sig = CombN.ar(sig,4,BrownNoise.ar(1),4) ;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 213.736840376, 'me', "thisProcess.stop;" ],
[ 235.425513253, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = WhiteNoise.ar(0.1!2);
  sig = CombN.ar(sig,4,ToggleFF.ar(Dust.ar(1)).lag(1/4),4) ;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 248.753053499, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = WhiteNoise.ar(0.1!2);
  sig = CombN.ar(sig,4,ToggleFF.ar(Dust.ar(1)).lag(1/4)+0.01,4) ;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 267.738155112, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = WhiteNoise.ar(0.1!2);
  sig = CombN.ar(sig,4,ToggleFF.ar(Impulse.ar(4)).lag(1/4)+0.01,4) ;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 273.813144295, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = WhiteNoise.ar(0.1!2);
  sig = CombN.ar(sig,4,ToggleFF.ar(Impulse.ar(4)).lag(1/8)+0.01,4) ;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 278.967306277, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = WhiteNoise.ar(0.1!2);
  sig = CombN.ar(sig,4,ToggleFF.ar(Impulse.ar(4)).lag(1/16)+0.01,4) ;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 283.47383121, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = WhiteNoise.ar(0.1!2);
  sig = CombN.ar(sig,4,ToggleFF.ar(Impulse.ar(8)).lag(1/16)+0.01,4) ;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 287.469532277, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = WhiteNoise.ar(0.1!2);
  sig = CombN.ar(sig,4,ToggleFF.ar(Impulse.ar(8)).lag(1/16)+0.02,4) ;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 292.674390327, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = WhiteNoise.ar(0.1!2);
  sig = CombN.ar(sig,4,ToggleFF.ar(Impulse.ar(8)).lag(1/16)+0.002,4) ;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 296.973582231, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = WhiteNoise.ar(0.1!2);
  sig = CombN.ar(sig,4,ToggleFF.ar(Impulse.ar(8)).lag(1/16)+0.0002,4) ;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 305.778158358, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = WhiteNoise.ar(0.1!2);
  sig = CombN.ar(sig,4,ToggleFF.ar(Dust.ar(8)).lag(1)+0.0002,4) ;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 340.074741101, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = WhiteNoise.ar(0.1!2);
  sig = CombN.ar(sig,4,ToggleFF.ar(Dust.ar(8)).lag(1)+0.0002,4);
  sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 349.669803798, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = WhiteNoise.ar(0.1!2);
  sig = CombN.ar(sig,4,ToggleFF.ar(Dust.ar(8)).lag(1)+0.0002,4);
  sig = GVerb.ar(sig,[10,11]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 355.151282833, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = WhiteNoise.ar(0.1!2);
  sig = CombN.ar(sig,4,ToggleFF.ar(Dust.ar(1/4)).lag(1)+0.0002,4);
  sig = GVerb.ar(sig,[10,11]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 372.837246438, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = WhiteNoise.ar(0.1!2);
  sig = CombN.ar(sig,4,ToggleFF.ar(Dust.ar(1/4)).lag(4)+0.0002,4);
  sig = GVerb.ar(sig,[10,11]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 379.501296447, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = WhiteNoise.ar(0.1!2);
  sig = CombN.ar(sig,4,ToggleFF.ar(Dust.ar(1/4)).lag(4)+0.2,4);
  sig = GVerb.ar(sig,[10,11]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 390.875248479, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = WhiteNoise.ar(0.1!2);
  sig = CombN.ar(sig,4,ToggleFF.ar(Dust.ar(1/4!2)).lag(4)+0.2,4);
  sig = GVerb.ar(sig,[10,11]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 403.002497187, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = WhiteNoise.ar(0.1!2);
  sig = CombN.ar(sig,4,ToggleFF.ar(Dust.ar(4!2)).lag(4)+0.2,4);
  sig = GVerb.ar(sig,[10,11]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 418.939571654, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = WhiteNoise.ar(0.1!2);
  sig = CombN.ar(sig,4,ToggleFF.ar(Dust.ar(4!2)).lag(1)+0.2,4);
  sig = GVerb.ar(sig,[10,11]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 432.56036918, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = LPF.ar(WhiteNoise.ar(0.2!2),400);
  sig = CombN.ar(sig,4,ToggleFF.ar(Dust.ar(4!2)).lag(1)+0.2,4);
  sig = GVerb.ar(sig,[10,11]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 437.994669117, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = LPF.ar(WhiteNoise.ar(0.5!2),400);
  sig = CombN.ar(sig,4,ToggleFF.ar(Dust.ar(4!2)).lag(1)+0.2,4);
  sig = GVerb.ar(sig,[10,11]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 446.181964559, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = LPF.ar(WhiteNoise.ar(0.85!2),400);
  sig = CombN.ar(sig,4,ToggleFF.ar(Dust.ar(4!2)).lag(1)+0.2,4);
  sig = GVerb.ar(sig,[10,11]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 462.932874861, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = LPF.ar(WhiteNoise.ar(0.85!2),400);
  sig = CombN.ar(sig,1,ToggleFF.ar(Dust.ar(4!2)).lag(1)+0.2,4);
  sig = GVerb.ar(sig,[10,11]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 468.16177034, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = LPF.ar(WhiteNoise.ar(0.85!2),400);
  sig = GVerb.ar(sig,[10,11]);
  sig = CombN.ar(sig,1,ToggleFF.ar(Dust.ar(4!2)).lag(1)+0.2,4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 477.077209823, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = LPF.ar(WhiteNoise.ar(0.85!2),400);
  sig = CombN.ar(sig,1,ToggleFF.ar(Dust.ar(4!2)).lag(1)+0.2,4);
  sig = GVerb.ar(sig,[10,11]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 482.511885343, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = LPF.ar(WhiteNoise.ar(0.85!2),400);
  sig = CombN.ar(sig,1,ToggleFF.ar(Dust.ar(4!2)).lag(1)+0.2,4);
  sig = GVerb.ar(sig,[10,11]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 487.497601152, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = LPF.ar(WhiteNoise.ar(0.85!2),400);
  sig = CombN.ar(sig,1,ToggleFF.ar(Dust.ar(4!2)).lag(1)+0.02,4);
  sig = GVerb.ar(sig,[10,11]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 540.920794236, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = LPF.ar(WhiteNoise.ar(0.85!2),400);
  sig = sig * ToggleFF.ar(Dust.ar(4!2)).lag(1);
  sig = GVerb.ar(sig,[10,11]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 548.163425548, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = LPF.ar(WhiteNoise.ar(0.85!2),400);
  sig = sig * ToggleFF.ar(Dust.ar(4!2)).lag(1/2);
  sig = GVerb.ar(sig,[10,11]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 550.255348892, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = LPF.ar(WhiteNoise.ar(0.85!2),4000);
  sig = sig * ToggleFF.ar(Dust.ar(4!2)).lag(1/2);
  sig = GVerb.ar(sig,[10,11]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 558.139093305, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = LPF.ar(WhiteNoise.ar(0.85!2),4000);
  sig = sig * ToggleFF.ar(Dust.ar(4!2)).lag(1/4);
  sig = GVerb.ar(sig,[10,11]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 564.177556787, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = LPF.ar(WhiteNoise.ar(0.85!2),4000);
  sig = sig * ToggleFF.ar(Dust.ar(1!2)).lag(1/4);
  sig = GVerb.ar(sig,[10,11]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 582.314586309, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = LPF.ar(WhiteNoise.ar(0.85!2),4000);
  sig = sig * ToggleFF.ar(Impulse.ar(4/fib(8))).lag(1/4);
  sig = GVerb.ar(sig,[10,11]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 603.225326482, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = LPF.ar(WhiteNoise.ar(0.85!2),[40,50,60,70,4000]);
  sig = sig * ToggleFF.ar(Impulse.ar(4/fib(8))).lag(1/4);
  sig = GVerb.ar(sig,[10,11]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 623.095817547, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = LPF.ar(WhiteNoise.ar(0.85!2),[400,500,600,700,4000]);
  sig = sig * ToggleFF.ar(Impulse.ar(4/fib(8))).lag(1/4);
  sig = GVerb.ar(sig,[10,11]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 629.69895713, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = BPF.ar(WhiteNoise.ar(0.85!2),[400,500,600,700,4000]);
  sig = sig * ToggleFF.ar(Impulse.ar(4/fib(8))).lag(1/4);
  sig = GVerb.ar(sig,[10,11]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 684.480381041, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = BPF.ar(LFSaw.ar(43.2*(_*2!8),432/[1,2,4,8]));
  sig = sig * ToggleFF.ar(Impulse.ar(4/fib(8))).lag(1/4);
  sig = GVerb.ar(sig,[10,11]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 701.157585744, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = BPF.ar(LFSaw.ar(43.2*(_*2!8),432/[1,2,1.5,8]));
  sig = sig * ToggleFF.ar(Impulse.ar(4/fib(8))).lag(1/4);
  sig = GVerb.ar(sig,[10,11]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 712.864679151, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = BPF.ar(LFSaw.ar(43.2*(_*1.5!8),432/[1,2,1.5,8]));
  sig = sig * ToggleFF.ar(Impulse.ar(4/fib(8))).lag(1/4);
  sig = GVerb.ar(sig,[10,11]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 721.020056266, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = BPF.ar(LFSaw.ar(43.2*(_*1.5!8),432/[1,2,1.5,8]));
  sig = sig * ToggleFF.ar(Impulse.ar(8/fib(8))).lag(1/4);
  sig = GVerb.ar(sig,[10,11]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 725.170887834, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = BPF.ar(LFSaw.ar(43.2*(_*1.5!8),432/[1,2,1.5,8]));
  sig = sig * ToggleFF.ar(Impulse.ar(8/fib(8))).lag(1);
  sig = GVerb.ar(sig,[10,11]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 743.119618139, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = BPF.ar(LFSaw.ar(43.2*(_*1.5!8),432/[1,2,1.5,8]));
  sig = sig * ToggleFF.ar(Impulse.ar(8/fib(8))).lag(1) * LFSaw.ar(1/4).exprange(0.001,1);
  sig = GVerb.ar(sig,[10,11]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 755.981560367, 'me', "(
~ss.fadeTime=2;
~ss={
  var sig = BPF.ar(LFSaw.ar(43.2*(_*1.5!8),432/[1,2,1.5,8]));
  sig = sig * ToggleFF.ar(Impulse.ar(8/fib(8))).lag(1) * LFSaw.ar(4).exprange(0.001,1);
  sig = GVerb.ar(sig,[10,11]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 756.90757285, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = BPF.ar(LFSaw.ar(43.2*(_*1.5!8),432/[1,2,1.5,8]));
  sig = sig * ToggleFF.ar(Impulse.ar(8/fib(8))).lag(1) * LFSaw.ar(4).exprange(0.001,1);
  sig = GVerb.ar(sig,[10,11]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 794.037975057, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = BPF.ar(LFSaw.ar(43.2*(_*1.5!8),432/[1,2,1.5,8]));
  sig = sig * ToggleFF.ar(Impulse.ar(8/fib(8))).lag(1) * LFSaw.ar(4).exprange(0.001,1);
  sig = CombN.ar(sig,1,LFDNoise1.ar(1),1);
  sig = GVerb.ar(sig,[10,11]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 806.074410088, 'me', "thisProcess.stop;" ],
[ 806.855579808, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = BPF.ar(LFSaw.ar(43.2*(_*1.5!8),432/[1,2,1.5,8]));
  sig = sig * ToggleFF.ar(Impulse.ar(8/fib(8))).lag(1) * LFSaw.ar(4).exprange(0.001,1);
  sig = CombN.ar(sig,1,LFDNoise1.kr(1)+0.2,1);
  sig = GVerb.ar(sig,[10,11]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 812.726252641, 'me', "thisProcess.stop;" ],
[ 813.30889599, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = BPF.ar(LFSaw.ar(43.2*(_*1.5!8),432/[1,2,1.5,8]));
  sig = sig * ToggleFF.ar(Impulse.ar(8/fib(8))).lag(1) * LFSaw.ar(4).exprange(0.001,1);
  sig = CombN.ar(sig,1,LFDNoise1.kr(1)+0.2,4);
  sig = GVerb.ar(sig,[10,11]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 816.667228814, 'me', "thisProcess.stop;" ],
[ 817.049320455, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = BPF.ar(LFSaw.ar(43.2*(_*1.5!8),432/[1,2,1.5,8]));
  sig = sig * ToggleFF.ar(Impulse.ar(8/fib(8))).lag(1) * LFSaw.ar(4).exprange(0.001,1);
  sig = CombN.ar(sig,0.2,LFDNoise1.kr(1)+0.2,4);
  sig = GVerb.ar(sig,[10,11]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~ss,postVol:true);
~ss.play;
);" ],
[ 825.869126088, 'me', "thisProcess.stop;" ],
[ 826.126317551, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var sig = BPF.ar(LFSaw.ar(43.2*(_*1.5!8),432/[1,2,1.5,8]));
  sig = sig * ToggleFF.ar(Impulse.ar(8/fib(8))).lag(1) * LFSaw.ar(4).exprange(0.001,1);
  sig = CombN.ar(sig,0.2,LFDNoise1.kr(1)+0.2,2);
