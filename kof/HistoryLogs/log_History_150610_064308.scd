// History, as it was on Wed Jun 10 06:43:08 2015.

[
[ 0, 'me', "HelpBrowser.openHelpFor(\"SinOsc\");" ],
[ 379.302920594, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = Blip.ar(432*[1,2,4,8]);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 423.600084021, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = Blip.ar(432*[1,2,4,8]+SinOsc.ar(13).range(-4,4));
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 431.714290091, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = Blip.ar(432*[1,2,4,8]+SinOsc.ar(44).range(-4,4));
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 460.987255945, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,2,4,8]+SinOsc.ar(44).range(-40,40));
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 470.1158857, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,2,4,8]+SinOsc.ar(4).range(-40,40));
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 477.150728296, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,2,4,8]+SinOsc.ar(8).range(-40,40));
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 495.532327094, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,2,4,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40));
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 523.095085881, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,2,4,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40));
  sig = sig * LFSaw.ar(1/4*[1,4,2,8]).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 555.963662616, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,2,4,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40));
  sig = sig * LFTri.ar(1/4*[1,4,2,8]).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 573.055964416, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,2,4,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40));
  sig = sig * Saw.ar(1/4*[1,4,2,8]).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 585.482815556, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,2,4,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40));
  sig = sig * SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 606.512026285, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,2,4,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4)) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 609.30144458, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,2,4,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4)) ;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 615.26586181, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,2,4,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4)) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 624.796323969, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,2,4,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 648.852740449, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,2,4,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,1/2,1/2,16);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 660.340903034, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,2,4,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,1/20,1/2,16);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 677.239911234, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,2,4,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1!4),1/2,16);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 704.692348027, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,2,4,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1!4),1/2,16);
  sig = FreeVerb.ar(sig,0.1,100);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 708.949428256, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,2,4,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1!4),1/2,16);
  sig = FreeVerb.ar(sig,0.1,100)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 712.902788658, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,2,4,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1!4),1/2,16);
  sig = FreeVerb.ar(sig,0.1,100)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 716.749822923, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(43.2*[1,2,4,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1!4),1/2,16);
  sig = FreeVerb.ar(sig,0.1,100)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 734.076403634, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/1.5pi*[1,2,4,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1!4),1/2,16);
  sig = FreeVerb.ar(sig,0.1,100)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 747.906532037, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/1.25pi*[1,2,4,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1!4),1/2,16);
  sig = FreeVerb.ar(sig,0.1,100)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 756.681583129, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/1.75pi*[1,2,4,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1!4),1/2,16);
  sig = FreeVerb.ar(sig,0.1,100)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 762.106135548, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.5pi*[1,2,4,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1!4),1/2,16);
  sig = FreeVerb.ar(sig,0.1,100)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 773.48893496, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.75pi*[1,1.5,4,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1!4),1/2,16);
  sig = FreeVerb.ar(sig,0.1,100)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 779.413087109, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.75pi*[1,1.5,3,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1!4),1/2,16);
  sig = FreeVerb.ar(sig,0.1,100)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 786.249580775, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.75pi*[1,1.5,3,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40));
  sig = sig * (SinOsc.ar(1/8*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1!4),1/2,16);
  sig = FreeVerb.ar(sig,0.1,100)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 790.318835871, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.75pi*[1,1.5,3,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40));
  sig = sig * (SinOsc.ar(1/8*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(8/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1!4),1/2,16);
  sig = FreeVerb.ar(sig,0.1,100)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 794.35075815, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.75pi*[1,1.5,3,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40));
  sig = sig * (SinOsc.ar(1/8*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(8/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(4!4),1/2,16);
  sig = FreeVerb.ar(sig,0.1,100)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 807.746562751, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.75pi*[1,1.5,3,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40));
  sig = sig * (SinOsc.ar(1/8*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(8/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.0002,1),1/2,16);
  sig = FreeVerb.ar(sig,0.1,100)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 809.559538227, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.75pi*[1,1.5,3,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40));
  sig = sig * (SinOsc.ar(1/8*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(8/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.0002,1),1,16);
  sig = FreeVerb.ar(sig,0.1,100)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 819.445820054, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.75pi*[1,1.5,3,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40));
  sig = sig * (SinOsc.ar(1/8*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(8/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.002,1),1,16);
  sig = FreeVerb.ar(sig,0.1,100)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 823.789424704, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.75pi*[1,1.5,3,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40));
  sig = sig * (SinOsc.ar(1/8*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(8/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),1,16);
  sig = FreeVerb.ar(sig,0.1,100)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 825.869596131, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.75pi*[1,1.5,3,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40));
  sig = sig * (SinOsc.ar(1/8*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(8/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),1,16);
  sig = FreeVerb.ar(sig,0.1,10)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 828.281068033, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.75pi*[1,1.5,3,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40));
  sig = sig * (SinOsc.ar(1/8*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(8/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),1,16);
  sig = FreeVerb.ar(sig,0.33,10)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 833.421601437, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.75pi*[1,1.5,3,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40));
  sig = sig * (SinOsc.ar(1/8*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(8/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),1,16);
  sig = FreeVerb.ar(sig,0.33,100)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 840.950384251, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.75pi*[1,1.5,3,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40));
  sig = sig * (SinOsc.ar(1/8*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(8/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),1,16);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 850.064781637, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.5pi*[1,1.5,3,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40));
  sig = sig * (SinOsc.ar(1/8*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(8/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),1,16);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 869.73800155, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.5pi*[1,1.5,3,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40),LFSaw.ar(1/4).exprange(2.001,100));
  sig = sig * (SinOsc.ar(1/8*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(8/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),1,16);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 880.720670323, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.5pi*[1,1.5,3,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40),LFSaw.ar(4).exprange(2.001,100));
  sig = sig * (SinOsc.ar(1/8*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(8/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),1,16);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 891.322355511, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.5pi*[1,1.5,3,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(1/8*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(8/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),1,16);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 899.122359732, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.5pi*[1,1.5,3,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(1/8*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),1,16);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 903.121828885, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.5pi*[1,1.5,3,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),1,16);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 913.47194464, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.5pi*[1,1.5,3,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),1,3);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 915.436373248, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.5pi*[1,1.5,3,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.1,3);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 922.609602426, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.5pi*[1,1.5,3,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.01,3);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 931.103184091, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.5pi*[1,1.5,3,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.02,3);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 941.943827725, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.5pi*[1,1.5,3,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.02*(1..8),3);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 949.60648006, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.5pi*[1,1.5,3,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.002*(1..8),3);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 968.836142142, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.5pi*[1,1.5,3,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.002*(1..8),3);
  sig = LPF.ar(sig,432);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1004.717290613, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.5pi*[1,1.5,3,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.002*(1..8),3);
  sig = LPF.ar(sig,432);
  sig = GVerb.ar(sig,10,mul:0.1)+sig;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1017.051744515, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.5pi*[1,1.5,3,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.002*(1..8),3);
  sig = LPF.ar(sig,432);
  sig = GVerb.ar(sig,10,mul:0.1)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1023.362014986, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.75pi*[1,1.5,3,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.002*(1..8),3);
  sig = LPF.ar(sig,432);
  sig = GVerb.ar(sig,10,mul:0.1)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1030.080439993, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.75pi*[1,1.25,4,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.002*(1..8),3);
  sig = LPF.ar(sig,432);
  sig = GVerb.ar(sig,10,mul:0.1)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1035.590431921, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.75pi*[1,1.25,4,8,16]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.002*(1..8),3);
  sig = LPF.ar(sig,432);
  sig = GVerb.ar(sig,10,mul:0.1)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1041.332493698, 'me', "(
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.75pi*[1,1.25,4,8,16,1.75]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.002*(1..8),3);
  sig = LPF.ar(sig,432);
  sig = GVerb.ar(sig,10,mul:0.1)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1043.989877602, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.75pi*[1,1.25,4,8,16,1.75]+SinOsc.ar(4*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.002*(1..8),3);
  sig = LPF.ar(sig,432);
  sig = GVerb.ar(sig,10,mul:0.1)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1047.156913079, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.75pi*[1,1.25,4,8,16,1.75]+SinOsc.ar(4*LFSaw.ar(1/4).exprange(0.001,10)).range(-40,40),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.002*(1..8),3);
  sig = LPF.ar(sig,432);
  sig = GVerb.ar(sig,10,mul:0.1)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1054.800557971, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.75pi*[1,1.25,4,8,16,1.75]+SinOsc.ar(4*LFSaw.ar(1/4).exprange(0.001,10)).range(-4,4),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.002*(1..8),3);
  sig = LPF.ar(sig,432);
  sig = GVerb.ar(sig,10,mul:0.1)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1057.606057683, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.75pi*[1,1.25,4,8,16,1.75]+SinOsc.ar(4*LFSaw.ar(1/4).exprange(0.001,10)).range(-4,4),LFSaw.ar(1/4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.002*(1..8),3);
  sig = LPF.ar(sig,432);
  sig = GVerb.ar(sig,10,mul:0.1)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1066.960575155, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.75pi*[1,1.25,4,8,16,1.75]+SinOsc.ar(4*LFSaw.ar(4).exprange(0.001,10)).range(-4,4),LFSaw.ar(1/4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.002*(1..8),3);
  sig = LPF.ar(sig,432);
  sig = GVerb.ar(sig,10,mul:0.1)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1077.965271027, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.75pi*[1,1.25,4,8,16,1.75]+SinOsc.ar(4*LFSaw.ar(fib(8)).exprange(0.001,10)).range(-4,4),LFSaw.ar(1/4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.002*(1..8),3);
  sig = LPF.ar(sig,432);
  sig = GVerb.ar(sig,10,mul:0.1)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1080.90618157, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.75pi*[1,1.25,4,8,16,1.75]+SinOsc.ar(1/4*LFSaw.ar(fib(8)).exprange(0.001,10)).range(-4,4),LFSaw.ar(1/4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.002*(1..8),3);
  sig = LPF.ar(sig,432);
  sig = GVerb.ar(sig,10,mul:0.1)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1092.241517097, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.75pi*[1,1.25,4]+SinOsc.ar(1/4*LFSaw.ar(fib(8)).exprange(0.001,10)).range(-4,4),LFSaw.ar(1/4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.002*(1..8),3);
  sig = LPF.ar(sig,432);
  sig = GVerb.ar(sig,10,mul:0.1)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1093.490882841, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.75pi*[1,1.25]+SinOsc.ar(1/4*LFSaw.ar(fib(8)).exprange(0.001,10)).range(-4,4),LFSaw.ar(1/4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.002*(1..8),3);
  sig = LPF.ar(sig,432);
  sig = GVerb.ar(sig,10,mul:0.1)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1098.915492601, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,1.25]+SinOsc.ar(1/4*LFSaw.ar(fib(8)).exprange(0.001,10)).range(-4,4),LFSaw.ar(1/4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.002*(1..8),3);
  sig = LPF.ar(sig,432);
  sig = GVerb.ar(sig,10,mul:0.1)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1105.963356274, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,1.5]+SinOsc.ar(1/4*LFSaw.ar(fib(8)).exprange(0.001,10)).range(-4,4),LFSaw.ar(1/4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.002*(1..8),3);
  sig = LPF.ar(sig,432);
  sig = GVerb.ar(sig,10,mul:0.1)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1109.289658892, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,1.5,2,4]+SinOsc.ar(1/4*LFSaw.ar(fib(8)).exprange(0.001,10)).range(-4,4),LFSaw.ar(1/4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.002*(1..8),3);
  sig = LPF.ar(sig,432);
  sig = GVerb.ar(sig,10,mul:0.1)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1116.225809194, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,1.5,2,4]+SinOsc.ar(1/4*LFSaw.ar(fib(8)).exprange(0.001,10)).range(-4,4),LFSaw.ar(1/4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(8))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.002*(1..8),3);
  sig = LPF.ar(sig,432);
  sig = GVerb.ar(sig,10,mul:0.1)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1119.68741836, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,1.5,2,4]+SinOsc.ar(1/4*LFSaw.ar(fib(8)).exprange(0.001,10)).range(-4,4),LFSaw.ar(1/4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(1/4/fib(8))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.002*(1..8),3);
  sig = LPF.ar(sig,432);
  sig = GVerb.ar(sig,10,mul:0.1)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1128.852208643, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,1.5,2,4]+SinOsc.ar(1/4*LFSaw.ar(fib(8)).exprange(0.001,10)).range(-4,4),LFSaw.ar(1/4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.002*(1..8),3);
  sig = LPF.ar(sig,432);
  sig = GVerb.ar(sig,10,mul:0.1)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1157.951951129, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,1.5,2,4]+SinOsc.ar(1/4*LFSaw.ar(fib(8)).exprange(0.001,10)).range(-4,4),LFSaw.ar(1/4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.002*(1..8),3);
  sig = LPF.ar(sig,432+LFSaw.ar(1/4).exprange(10.001,1000));
  sig = GVerb.ar(sig,10,mul:0.1)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1169.552706895, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,1.5,2,4]+SinOsc.ar(1/4*LFSaw.ar(fib(8)).exprange(0.001,10)).range(-4,4),LFSaw.ar(1/4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.002*(1..8),3);
  sig = LPF.ar(sig,432+LFSaw.ar(1/4).exprange(10.001,10000));
  sig = GVerb.ar(sig,10,mul:0.1)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1179.692113555, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,1.5,2,4]+SinOsc.ar(1/4*LFSaw.ar(fib(8)).exprange(0.001,10)).range(-4,4),LFSaw.ar(1/4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.002*(1..8),3);
  sig = LPF.ar(sig,432+LFSaw.ar(1/4).exprange(10.001,10000));
  sig = GVerb.ar(sig,100,mul:0.2)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1192.670362352, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,1.5,2,4]+SinOsc.ar(1/4*LFSaw.ar(fib(8)).exprange(0.001,10)).range(-4,4),LFSaw.ar(1/4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.002*(1..8),3);
  sig = RLPF.ar(sig,432+LFSaw.ar(1/4).exprange(10.001,10000));
  sig = GVerb.ar(sig,100,mul:0.2)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1199.651509301, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,1.5,2,4]+SinOsc.ar(1/4*LFSaw.ar(fib(8)).exprange(0.001,10)).range(-4,4),LFSaw.ar(1/4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.002*(1..8),3);
  sig = RLPF.ar(sig,432+LFSaw.ar(1/4).exprange(10000.001,10.0));
  sig = GVerb.ar(sig,100,mul:0.2)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1214.88115093, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,1.5,2,4]+SinOsc.ar(1/4*LFSaw.ar(fib(8)).exprange(0.001,10)).range(-4,4),LFSaw.ar(1/4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.002*(1..8),3);
  sig = RLPF.ar(sig,432+LFSaw.ar(4).exprange(10000.001,10.0));
  sig = GVerb.ar(sig,100,mul:0.2)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1224.865364181, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,1.5,2,4]+SinOsc.ar(1/4*LFSaw.ar(fib(8)).exprange(0.001,10)).range(-4,4),LFSaw.ar(1/4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.002*(1..8),3);
  sig = RLPF.ar(sig,432+LFSaw.ar(4/fib(8)).exprange(10000.001,10.0));
  sig = GVerb.ar(sig,100,mul:0.2)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1233.370252634, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,1.5,2,4]+SinOsc.ar(1/4*LFSaw.ar(fib(8)).exprange(0.001,10)).range(-4,4),LFSaw.ar(1/4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.002*(1..8),3);
  sig = RLPF.ar(sig,432+LFSaw.ar(4/fib(8)).exprange(10000.001,10.0));
  sig = GVerb.ar(sig,10,mul:0.2)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1236.335365528, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,1.5,2,4]+SinOsc.ar(1/4*LFSaw.ar(fib(8)).exprange(0.001,10)).range(-4,4),LFSaw.ar(1/4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.002*(1..8),3);
  sig = RLPF.ar(sig,432+LFSaw.ar(4/fib(8)).exprange(10000.001,10.0));
  sig = GVerb.ar(sig,10,mul:0.5)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1245.767008061, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,1.5,2,4]+SinOsc.ar(1/4*LFSaw.ar(fib(8)).exprange(0.001,10)).range(-4,4),LFSaw.ar(1/4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.002*(1..8),3);
  sig = RLPF.ar(sig,432+LFSaw.ar(4/fib(8)).exprange(10000.001,10.0));
  sig = GVerb.ar(sig,[10,11,100],mul:0.5)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1250.14196683, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,1.5,2,4]+SinOsc.ar(1/4*LFSaw.ar(fib(8)).exprange(0.001,10)).range(-4,4),LFSaw.ar(1/4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.002*(1..8),3);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(4/fib(8)).exprange(10000.001,10.0));
  sig = GVerb.ar(sig,[10,11,100],mul:0.5)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1266.335587731, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(43.2*[1,1.5,2,4]+SinOsc.ar(1/4*LFSaw.ar(fib(8)).exprange(0.001,10)).range(-4,4),LFSaw.ar(1/4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.002*(1..8),3);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(4/fib(8)).exprange(10000.001,10.0));
  sig = GVerb.ar(sig,[10,11,100],mul:0.5)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1282.772551299, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(43.2*[1,1.5,2,4]+SinOsc.ar(1/4*LFSaw.ar(fib(8)).exprange(0.001,10)).range(-4,400),LFSaw.ar(1/4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.002*(1..8),3);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(4/fib(8)).exprange(10000.001,10.0));
  sig = GVerb.ar(sig,[10,11,100],mul:0.5)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1300.179291428, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(43.2*[1,1.5,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,400),LFSaw.ar(1/4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.002*(1..8),3);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(4/fib(8)).exprange(10000.001,10.0));
  sig = GVerb.ar(sig,[10,11,100],mul:0.5)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1303.762754032, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(43.2*[1,1.5,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,400),LFSaw.ar(1/4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.002*(1..8),3);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(4/fib(8)).exprange(10000.001,10.0));
  sig = GVerb.ar(sig,[10,11,100],mul:0.5)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1305.448672942, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(43.2*[1,1.5,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(1/4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.002*(1..8),3);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(4/fib(8)).exprange(10000.001,10.0));
  sig = GVerb.ar(sig,[10,11,100],mul:0.5)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1314.33818695, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(43.2*[1,1.5,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.002*(1..8),3);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(4/fib(8)).exprange(10000.001,10.0));
  sig = GVerb.ar(sig,[10,11,100],mul:0.5)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1334.098401851, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(43.2*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.002*(1..8),3);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(4/fib(8)).exprange(10000.001,10.0));
  sig = GVerb.ar(sig,[10,11,100],mul:0.5)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1373.457120124, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(43.2*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),LFDNoise1.ar(1/fib(8)).range(0.002,0.1)*(1..8),3);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(4/fib(8)).exprange(10000.001,10.0));
  sig = GVerb.ar(sig,[10,11,100],mul:0.5)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1391.273646327, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(43.2*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(fib(8)).exprange(0.02,1),LFDNoise1.ar(1/fib(8)).range(0.002,0.1)*(1..8),3);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(4/fib(8)).exprange(10000.001,10.0));
  sig = GVerb.ar(sig,[10,11,100],mul:0.5)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1395.802032846, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(43.2*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(fib(8)).exprange(0.02,1),LFDNoise1.ar(fib(8)).range(0.002,0.1)*(1..8),3);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(4/fib(8)).exprange(10000.001,10.0));
  sig = GVerb.ar(sig,[10,11,100],mul:0.5)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1401.997487001, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(43.2*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(4/fib(8)).exprange(0.02,1),LFDNoise1.ar(4/fib(8)).range(0.002,0.1)*(1..8),3);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(4/fib(8)).exprange(10000.001,10.0));
  sig = GVerb.ar(sig,[10,11,100],mul:0.5)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1408.425299538, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(43.2*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(4/fib(8)).exprange(0.02,1),LFDNoise1.ar(4/fib(8)).range(0.002,0.1)*(1..8),3);
  sig = RLPF.ar(sig,4.32+LFSaw.ar(4/fib(8)).exprange(10000.001,10.0));
  sig = GVerb.ar(sig,[10,11,100],mul:0.5)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1412.805539817, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(43.2*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(4/fib(8)).exprange(0.02,1),LFDNoise1.ar(4/fib(8)).range(0.002,0.1)*(1..8),3);
  sig = RLPF.ar(sig,4.32+LFSaw.ar(4/fib(8)).exprange(1000.001,10.0));
  sig = GVerb.ar(sig,[10,11,100],mul:0.5)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1414.594510955, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(43.2*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(4/fib(8)).exprange(0.02,1),LFDNoise1.ar(4/fib(8)).range(0.002,0.1)*(1..8),3);
  sig = RLPF.ar(sig,4.32+LFSaw.ar(4/fib(8)).exprange(1000.001,1.0));
  sig = GVerb.ar(sig,[10,11,100],mul:0.5)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1420.192260529, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(43.2*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(4/fib(8)).exprange(0.02,1),LFDNoise1.ar(4/fib(8)).range(0.002,0.1)*(1..8),3);
  sig = RLPF.ar(sig,4.32+LFSaw.ar(4/fib(8)).exprange(1000.001,1.001));
  sig = GVerb.ar(sig,[10,11,100],mul:0.5)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1426.738945315, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(43.2*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4/fib(8)).exprange(0.02,1),LFDNoise1.ar(4/fib(8)).range(0.002,0.1)*(1..8),3);
  sig = RLPF.ar(sig,4.32+LFSaw.ar(4/fib(8)).exprange(1000.001,1.001));
  sig = GVerb.ar(sig,[10,11,100],mul:0.5)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1431.254613061, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(43.2*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4/fib(8)).exprange(0.02,1),LFDNoise0.ar(4/fib(8)).range(0.002,0.1)*(1..8),3);
  sig = RLPF.ar(sig,4.32+LFSaw.ar(4/fib(8)).exprange(1000.001,1.001));
  sig = GVerb.ar(sig,[10,11,100],mul:0.5)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1437.246147548, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(43.2*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4/fib(8)).exprange(0.02,1),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1)*(1..8),3);
  sig = RLPF.ar(sig,4.32+LFSaw.ar(4/fib(8)).exprange(1000.001,1.001));
  sig = GVerb.ar(sig,[10,11,100],mul:0.5)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1440.515572434, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(43.2*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4/fib(8)).exprange(0.002,1),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1)*(1..8),3);
  sig = RLPF.ar(sig,4.32+LFSaw.ar(4/fib(8)).exprange(1000.001,1.001));
  sig = GVerb.ar(sig,[10,11,100],mul:0.5)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1445.938991517, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(43.2*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4/fib(8)).exprange(0.002,0.1),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1)*(1..8),3);
  sig = RLPF.ar(sig,4.32+LFSaw.ar(4/fib(8)).exprange(1000.001,1.001));
  sig = GVerb.ar(sig,[10,11,100],mul:0.5)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1451.658287944, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(43.2*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4/fib(8)).exprange(0.002,0.1),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1)*(1..8),8);
  sig = RLPF.ar(sig,4.32+LFSaw.ar(4/fib(8)).exprange(1000.001,1.001));
  sig = GVerb.ar(sig,[10,11,100],mul:0.5)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1464.535771052, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(43.2*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4/fib(8)).exprange(0.002,0.1),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1)*(1..8),16);
  sig = RLPF.ar(sig,4.32+LFSaw.ar(4/fib(8)).exprange(1000.001,1.001));
  sig = GVerb.ar(sig,[10,11,100],mul:0.5)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1471.970428781, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(43.2*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4/fib(8)).exprange(0.002,0.1),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1)*(1..8),16);
  sig = RLPF.ar(sig,4.32+LFSaw.ar(4/fib(8)).exprange(1000.001,1.001));
  sig = GVerb.ar(sig,[100,110,100],mul:0.5)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1475.755852128, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(43.2*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4/fib(8)).exprange(0.002,0.1),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1)*(1..8),16);
  sig = RLPF.ar(sig,4.32+LFSaw.ar(4/fib(8)).exprange(1000.001,1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.5)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1479.594939965, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(43.2*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4/fib(8)).exprange(0.002,0.1),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1)*(1..8),16);
  sig = RLPF.ar(sig,4.32+LFSaw.ar(4/fib(8)).exprange(1000.001,1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1497.91168903, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(43.2*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4/fib(8)).exprange(0.002,0.1),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1)*(1..8),16);
  sig = RLPF.ar(sig,4.32+LFSaw.ar(4/fib(8)).exprange(1000.001,1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1503.430795947, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(43.2*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(4*[1,4,2,8]).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4/fib(8)).exprange(0.002,0.1),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1)*(1..8),16);
  sig = RLPF.ar(sig,4.32+LFSaw.ar(4/fib(8)).exprange(1000.001,1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1521.821203869, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(43.2*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4/fib(8)).exprange(0.002,0.1),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1)*(1..8),16);
  sig = RLPF.ar(sig,4.32+LFSaw.ar(4/fib(8)).exprange(1000.001,1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1533.321247331, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(43.2*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4/fib(8)).exprange(0.002,0.1).round(0.02),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1)*(1..8),16);
  sig = RLPF.ar(sig,4.32+LFSaw.ar(4/fib(8)).exprange(1000.001,1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1543.116964401, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(43.2*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4/fib(8)).exprange(0.002,0.1).round(0.02),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1).round(0.2)*(1..8),16);
  sig = RLPF.ar(sig,4.32+LFSaw.ar(4/fib(8)).exprange(1000.001,1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1547.343241697, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(43.2*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4/fib(8)).exprange(0.002,0.1).round(0.02),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1).round(0.02)*(1..8),16);
  sig = RLPF.ar(sig,4.32+LFSaw.ar(4/fib(8)).exprange(1000.001,1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1555.423828203, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(43.2*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4/fib(8)).exprange(0.002,0.1).round(0.02),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1).round(0.002)*(1..8),16);
  sig = RLPF.ar(sig,4.32+LFSaw.ar(4/fib(8)).exprange(1000.001,1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1558.929822385, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(43.2*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4/fib(8)).exprange(0.002,0.1).round(0.002),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1).round(0.002)*(1..8),16);
  sig = RLPF.ar(sig,4.32+LFSaw.ar(4/fib(8)).exprange(1000.001,1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1564.778833497, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(43.2*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(4/fib(8)).exprange(0.002,0.1).round(0.002),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1).round(0.002)*(1..8),16);
  sig = RLPF.ar(sig,4.32+LFSaw.ar(4/fib(8)).exprange(1000.001,1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1576.10047132, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(4/fib(8)).exprange(0.002,0.1).round(0.002),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1).round(0.002)*(1..8),16);
  sig = RLPF.ar(sig,4.32+LFSaw.ar(4/fib(8)).exprange(1000.001,1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1589.480605278, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(1/4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(4/fib(8)).exprange(0.002,0.1).round(0.002),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1).round(0.002)*(1..8),16);
  sig = RLPF.ar(sig,4.32+LFSaw.ar(4/fib(8)).exprange(1000.001,1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
);" ],
[ 1602.506168029, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombN.ar(sig,LFDNoise1.ar(4/fib(8)).exprange(0.002,0.1).round(0.002),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1).round(0.002)*(1..8),16);
  sig = RLPF.ar(sig,4.32+LFSaw.ar(4/fib(8)).exprange(1000.001,1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1612.874047256, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombC.ar(sig,LFDNoise1.ar(4/fib(8)).exprange(0.002,0.1).round(0.002),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1).round(0.002)*(1..8),16);
  sig = RLPF.ar(sig,4.32+LFSaw.ar(4/fib(8)).exprange(1000.001,1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1633.083649974, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombC.ar(sig,LFDNoise1.ar(4/fib(8)).exprange(0.002,0.1).round(0.002),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1).round(0.002)*(1..8),16);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(4/fib(8)).exprange(1000.001,1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1639.505659293, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombC.ar(sig,LFDNoise1.ar(4/fib(8)).exprange(0.002,0.1).round(0.002),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1).round(0.002)*(1..8),16);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(4/fib(8)).exprange(15000.001,1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1646.819314964, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombC.ar(sig,LFDNoise1.ar(4/fib(8)).exprange(0.002,0.1).round(0.002),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1).round(0.002)*(1..8),16);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(4/fib(8)).exprange(1500.001,1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1652.948257081, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombC.ar(sig,LFDNoise1.ar(4/fib(8)).exprange(0.002,0.1).round(0.002),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1).round(0.002)*(1..8),16);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(4/fib(8)).exprange(12500.001,1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1664.669012179, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombC.ar(sig,LFDNoise1.ar(4/fib(8)).exprange(0.002,0.1).round(0.002),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1).round(0.002)*(1..8),16);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(4/fib(8)).exprange(1250.001,1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1668.872242533, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombC.ar(sig,LFDNoise1.ar(4/fib(8)).exprange(0.002,0.1).round(0.002),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1).round(0.002)*(1..8),16);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(4).exprange(1250.001,1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1678.17037818, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombC.ar(sig,LFDNoise1.ar(4/fib(8)).exprange(0.002,0.1).round(0.002),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1).round(0.002)*(1..8),16);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(8).exprange(1250.001,1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1682.050261741, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombC.ar(sig,LFDNoise1.ar(4/fib(8)).exprange(0.002,0.1).round(0.002),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1).round(0.002)*(1..8),16);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(44).exprange(1250.001,1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1709.654060446, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombC.ar(sig,LFDNoise1.ar(4/fib(8)).exprange(0.002,0.1).round(0.002),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1).round(0.002)*(1..8),16);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(44+((1..8)/100)).exprange(1250.001,1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1720.090677818, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombC.ar(sig,LFDNoise1.ar(4/fib(8)).exprange(0.002,0.1).round(0.002),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1).round(0.002)*(1..8),16);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(44+((1..8)/10)).exprange(1250.001,1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1730.174648948, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombC.ar(sig,LFDNoise1.ar(4/fib(8)).exprange(0.002,0.1).round(0.002),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1).round(0.002)*(1..8),16);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(44+((1..8)/1000)).exprange(1250.001,1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1740.404689399, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombC.ar(sig,LFDNoise1.ar(4/fib(8)).exprange(0.002,0.1).round(0.002),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1).round(0.002)*(1..8),16);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(44+((1..8)/1000)).exprange(12500.001,1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1753.151577282, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombC.ar(sig,LFDNoise1.ar(4/fib(8)).exprange(0.002,0.1).round(0.002),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1).round(0.002)*(1..8),16);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(44+((1..8)/1000)).exprange(1250.001*[1,2,4,8],1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1760.280015566, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombC.ar(sig,LFDNoise1.ar(4/fib(8)).exprange(0.002,0.1).round(0.002),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1).round(0.002)*(1..8),16);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(44+((1..8)/1000)).exprange(1250.001*[1,1.5,4,8],1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1772.002081437, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombC.ar(sig,LFDNoise1.ar(4/fib(8)).exprange(0.002,0.1).round(0.002),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1).round(0.002)*(1..8),16);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(4/fib(8)+((1..8)/100)).exprange(1250.001*[1,1.5,4,8],1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1784.132000336, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombC.ar(sig,LFDNoise1.ar(4/fib(8)).exprange(0.002,0.1).round(0.002),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1).round(0.002)*(1..8),16);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(44/fib(8)+((1..8)/100)).exprange(1250.001*[1,1.5,4,8],1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1792.384931709, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombC.ar(sig,LFDNoise1.ar(4/fib(8)).exprange(0.002,0.1).round(0.002),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1).round(0.002)*(1..8),16);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(11/fib(8)+((1..8)/100)).exprange(1250.001*[1,1.5,4,8],1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1802.893791975, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombC.ar(sig,LFDNoise1.ar(4/fib(8)).exprange(0.002,0.1).round(0.002),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1).round(0.002)*(1..8),16);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(8/fib(8)+((1..8)/100)).exprange(1250.001*[1,1.5,4,8],1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1814.306392522, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(43.2*[1,1.25,2,4]+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombC.ar(sig,LFDNoise1.ar(4/fib(8)).exprange(0.002,0.1).round(0.002),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1).round(0.002)*(1..8),16);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(8/fib(8)+((1..8)/1000)).exprange(1250.001*[1,1.5,4,8],1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1832.035017577, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(4320/([1,1.25,2,4]*pi)+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombC.ar(sig,LFDNoise1.ar(4/fib(8)).exprange(0.002,0.1).round(0.002),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1).round(0.002)*(1..8),16);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(8/fib(8)+((1..8)/1000)).exprange(1250.001*[1,1.5,4,8],1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1844.530562301, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(4320/([1,1.5,2,4]*pi)+SinOsc.ar(LFSaw.ar(fib(8)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombC.ar(sig,LFDNoise1.ar(4/fib(8)).exprange(0.002,0.1).round(0.002),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1).round(0.002)*(1..8),16);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(8/fib(8)+((1..8)/1000)).exprange(1250.001*[1,1.5,4,8],1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1848.399064823, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(4320/([1,1.5,2,4]*pi)+SinOsc.ar(LFSaw.ar(fib(4)*1/4).exprange(0.001,10)).range(-4,4000),LFSaw.ar(4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombC.ar(sig,LFDNoise1.ar(4/fib(8)).exprange(0.002,0.1).round(0.002),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1).round(0.002)*(1..8),16);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(8/fib(8)+((1..8)/1000)).exprange(1250.001*[1,1.5,4,8],1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1852.124708052, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(4320/([1,1.5,2,4]*pi)+SinOsc.ar(LFSaw.ar(fib(4)*1/4).exprange(0.001,100)).range(-4,4000),LFSaw.ar(4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombC.ar(sig,LFDNoise1.ar(4/fib(8)).exprange(0.002,0.1).round(0.002),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1).round(0.002)*(1..8),16);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(8/fib(8)+((1..8)/1000)).exprange(1250.001*[1,1.5,4,8],1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1855.758839977, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(4320/([1,1.5,2,4]*pi)+SinOsc.ar(LFSaw.ar(fib(4)*1/4).exprange(0.001,10)).range(-4,400),LFSaw.ar(4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombC.ar(sig,LFDNoise1.ar(4/fib(8)).exprange(0.002,0.1).round(0.002),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1).round(0.002)*(1..8),16);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(8/fib(8)+((1..8)/1000)).exprange(1250.001*[1,1.5,4,8],1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1860.344306426, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(4320/([1,1.5,2,4]*pi)+SinOsc.ar(LFSaw.ar(fib(4)*1/4).exprange(0.001,10)).range(-4,40),LFSaw.ar(4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombC.ar(sig,LFDNoise1.ar(4/fib(8)).exprange(0.002,0.1).round(0.002),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1).round(0.002)*(1..8),16);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(8/fib(8)+((1..8)/1000)).exprange(1250.001*[1,1.5,4,8],1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1862.190549533, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(4320/([1,1.5,2,4]*pi)+SinOsc.ar(LFSaw.ar(fib(4)*1/4).exprange(0.001,10)).range(-4,4),LFSaw.ar(4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombC.ar(sig,LFDNoise1.ar(4/fib(8)).exprange(0.002,0.1).round(0.002),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1).round(0.002)*(1..8),16);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(8/fib(8)+((1..8)/1000)).exprange(1250.001*[1,1.5,4,8],1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1866.31052097, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(4320/([1,1.5,2,4]*pi)+SinOsc.ar(LFSaw.ar(fib(4)*1/4).exprange(0.001,10)).range(-4,4),LFSaw.ar(1/4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombC.ar(sig,LFDNoise1.ar(4/fib(8)).exprange(0.002,0.1).round(0.002),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1).round(0.002)*(1..8),16);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(8/fib(8)+((1..8)/1000)).exprange(1250.001*[1,1.5,4,8],1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1872.136996171, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(4320/([1,1.5,2,4]*pi)+SinOsc.ar(LFSaw.ar(fib(4)*1/4).exprange(0.001,10)).range(-4,4),LFSaw.ar(1/4/fib(8)).exprange(2.001,1000));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombC.ar(sig,LFDNoise1.ar(4/fib(8)).exprange(0.002,0.1).round(0.002),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1).round(0.002)*(1..8),16);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(8/fib(8)+((1..8)/1000)).exprange(1250.001*[1,1.5,4,8],1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1873.18679523, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(4320/([1,1.5,2,4]*pi)+SinOsc.ar(LFSaw.ar(fib(4)*1/4).exprange(0.001,10)).range(-4,4),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombC.ar(sig,LFDNoise1.ar(4/fib(8)).exprange(0.002,0.1).round(0.002),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1).round(0.002)*(1..8),16);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(8/fib(8)+((1..8)/1000)).exprange(1250.001*[1,1.5,4,8],1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1886.73113377, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/([1,1.5,2,4]*pi)+SinOsc.ar(LFSaw.ar(fib(4)*1/4).exprange(0.001,10)).range(-4,4),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombC.ar(sig,LFDNoise1.ar(4/fib(8)).exprange(0.002,0.1).round(0.002),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1).round(0.002)*(1..8),16);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(8/fib(8)+((1..8)/1000)).exprange(1250.001*[1,1.5,4,8],1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1900.305612334, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/([1,1.5,2,4]*pi)+SinOsc.ar(LFSaw.ar(fib(4)*1/4).exprange(0.001,10)).range(-4,4),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombC.ar(sig,LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1).round(0.002),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1).round(0.002)*(1..8),16);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(8/fib(8)+((1..8)/1000)).exprange(1250.001*[1,1.5,4,8],1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1908.180284688, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/([1,1.5,2,4]*pi)+SinOsc.ar(LFSaw.ar(fib(4)*1/4).exprange(0.001,10)).range(-4,4),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombC.ar(sig,LFDNoise0.ar(4/fib(8)).exprange(0.02,0.1).round(0.002),LFDNoise0.ar(4/fib(8)).exprange(0.002,0.1).round(0.002)*(1..8),16);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(8/fib(8)+((1..8)/1000)).exprange(1250.001*[1,1.5,4,8],1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1912.052794416, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/([1,1.5,2,4]*pi)+SinOsc.ar(LFSaw.ar(fib(4)*1/4).exprange(0.001,10)).range(-4,4),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombC.ar(sig,LFDNoise0.ar(4/fib(8)).exprange(0.02,0.1).round(0.002),LFDNoise0.ar(4/fib(8)).exprange(0.02,0.1).round(0.002)*(1..8),16);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(8/fib(8)+((1..8)/1000)).exprange(1250.001*[1,1.5,4,8],1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1915.86272266, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/([1,1.5,2,4]*pi)+SinOsc.ar(LFSaw.ar(fib(4)*1/4).exprange(0.001,10)).range(-4,4),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombC.ar(sig,LFDNoise0.ar(4/fib(8)).exprange(0.02,0.1).round(0.002),LFDNoise0.ar(4/fib(8)).exprange(0.02,0.1).round(0.02)*(1..8),16);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(8/fib(8)+((1..8)/1000)).exprange(1250.001*[1,1.5,4,8],1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1919.641378885, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/([1,1.5,2,4]*pi)+SinOsc.ar(LFSaw.ar(fib(4)*1/4).exprange(0.001,10)).range(-4,4),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombC.ar(sig,LFDNoise0.ar(4/fib(8)).exprange(0.02,0.1).round(0.02),LFDNoise0.ar(4/fib(8)).exprange(0.02,0.1).round(0.02)*(1..8),16);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(8/fib(8)+((1..8)/1000)).exprange(1250.001*[1,1.5,4,8],1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1927.868906417, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/([1,1.5,2,4]*pi)+SinOsc.ar(LFSaw.ar(fib(4)*1/4).exprange(0.001,10)).range(-4,4),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombC.ar(sig,LFDNoise0.ar(4/fib(8)).exprange(0.02,0.1).round(0.02),LFDNoise0.ar(4/fib(8)).exprange(0.02,1).round(0.02)*(1..8),16);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(8/fib(8)+((1..8)/1000)).exprange(1250.001*[1,1.5,4,8],1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1934.92284925, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/([1,1.5,2,4]*pi)+SinOsc.ar(LFSaw.ar(fib(4)*1/4).exprange(0.001,10)).range(-4,4),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombC.ar(sig,LFDNoise0.ar(4/fib(8)).exprange(0.02,1).round(0.02),LFDNoise0.ar(4/fib(8)).exprange(0.02,1).round(0.02)*(1..8),16);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(8/fib(8)+((1..8)/1000)).exprange(1250.001*[1,1.5,4,8],1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1939.423896207, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/([1,1.5,2,4]*pi)+SinOsc.ar(LFSaw.ar(fib(4)*1/4).exprange(0.001,10)).range(-4,4),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombC.ar(sig,LFDNoise0.ar(1/4/fib(8)).exprange(0.02,1).round(0.02),LFDNoise0.ar(4/fib(8)).exprange(0.02,1).round(0.02)*(1..8),16);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(8/fib(8)+((1..8)/1000)).exprange(1250.001*[1,1.5,4,8],1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1942.304155833, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/([1,1.5,2,4]*pi)+SinOsc.ar(LFSaw.ar(fib(4)*1/4).exprange(0.001,10)).range(-4,4),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombC.ar(sig,LFDNoise0.ar(1/4/fib(8)).exprange(0.02,1).round(0.02),LFDNoise0.ar(4/fib(8)).exprange(0.02,1).round(0.02)*(1..8),16);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(1/8/fib(8)+((1..8)/1000)).exprange(1250.001*[1,1.5,4,8],1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1949.306943384, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/([1,1.5,2,4]*pi)+SinOsc.ar(LFSaw.ar(fib(4)*1/4).exprange(0.001,10)).range(-4,4),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombC.ar(sig,LFDNoise0.ar(1/4/fib(8)).exprange(0.02,1).round(0.02),LFDNoise0.ar(4/fib(8)).exprange(0.02,1).round(0.02)*(1..8),16);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(1/8/fib(8)+((1..8)/1000)).exprange(12500.001*[1,1.5,4,8],1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1957.546794591, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(4320/([1,1.5,2,4]*pi)+SinOsc.ar(LFSaw.ar(fib(4)*1/4).exprange(0.001,10)).range(-4,4),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombC.ar(sig,LFDNoise0.ar(1/4/fib(8)).exprange(0.02,1).round(0.02),LFDNoise0.ar(4/fib(8)).exprange(0.02,1).round(0.02)*(1..8),16);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(1/8/fib(8)+((1..8)/1000)).exprange(12500.001*[1,1.5,4,8],1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1960.82416025, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/([1,1.5,2,4]*pi)+SinOsc.ar(LFSaw.ar(fib(4)*1/4).exprange(0.001,10)).range(-4,4),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombC.ar(sig,LFDNoise0.ar(1/4/fib(8)).exprange(0.02,1).round(0.02),LFDNoise0.ar(4/fib(8)).exprange(0.02,1).round(0.02)*(1..8),16);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(1/8/fib(8)+((1..8)/1000)).exprange(12500.001*[1,1.5,4,8],1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1961.538619372, 'me', "thisProcess.stop;" ],
[ 1962.098285017, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/([1,1.5,2,4]*pi)+SinOsc.ar(LFSaw.ar(fib(4)*1/4).exprange(0.001,10)).range(-4,4),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(2/fib(8)).exprange(0.001,1)) ;
  sig = CombC.ar(sig,LFDNoise0.ar(1/4/fib(8)).exprange(0.02,1).round(0.02),LFDNoise0.ar(4/fib(8)).exprange(0.02,1).round(0.02)*(1..8),16);
  sig = RLPF.ar(sig,43.2+LFSaw.ar(1/8/fib(8)+((1..8)/1000)).exprange(12500.001*[1,1.5,4,8],1.001));
  sig = GVerb.ar(sig,[101,110,100],mul:0.15)+sig.softclip;

  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1985.456039556, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.75pi*[1,1.25,4,8,16,1.75]+SinOsc.ar(4*LFSaw.ar(fib(8)).exprange(0.001,10)).range(-4,4),LFSaw.ar(1/4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.002*(1..8),3);
  sig = LPF.ar(sig,432);
  sig = GVerb.ar(sig,10,mul:0.1)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1989.420891787, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.75pi*[1,1.25,4,8,16,1.75]+SinOsc.ar(4*LFSaw.ar(4).exprange(0.001,10)).range(-4,4),LFSaw.ar(1/4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.002*(1..8),3);
  sig = LPF.ar(sig,432);
  sig = GVerb.ar(sig,10,mul:0.1)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1991.013437806, 'me', "thisProcess.stop;" ],
[ 1991.59170736, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.75pi*[1,1.25,4,8,16,1.75]+SinOsc.ar(4*LFSaw.ar(4).exprange(0.001,10)).range(-4,4),LFSaw.ar(1/4/fib(8)).exprange(2.001,10));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.002*(1..8),3);
  sig = LPF.ar(sig,432);
  sig = GVerb.ar(sig,10,mul:0.1)+sig.softclip;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1998.126264457, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.5pi*[1,1.5,3,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40),LFSaw.ar(1/4/fib(8)).exprange(2.001,100));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),0.01,3);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 2002.560736789, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.5pi*[1,1.5,3,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40));
  sig = sig * (SinOsc.ar(1/8*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(8/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),1,16);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 2004.631470952, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.75pi*[1,1.5,3,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40));
  sig = sig * (SinOsc.ar(1/8*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(8/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(0.02,1),1,16);
  sig = FreeVerb.ar(sig,0.1,100)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 2006.891184297, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.75pi*[1,1.5,3,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40));
  sig = sig * (SinOsc.ar(1/8*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(8/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4).exprange(),1/2,16);
  sig = FreeVerb.ar(sig,0.1,100)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 2008.370173284, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.75pi*[1,1.5,3,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40));
  sig = sig * (SinOsc.ar(1/8*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(8/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1/4!4),1/2,16);
  sig = FreeVerb.ar(sig,0.1,100)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 2013.679120563, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432/0.75pi*[1,2,4,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1!4),1/2,16);
  sig = FreeVerb.ar(sig,0.1,100)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 2021.759094147, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(432*[1,2,4,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1!4),1/2,16);
  sig = FreeVerb.ar(sig,0.1,100)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 2028.006726628, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(43.2*[1,2,4,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1!4),1/2,16);
  sig = FreeVerb.ar(sig,0.1,100)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 2032.253547215, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(43.2*[1,2,4,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1!4),1/2,16);
  sig = FreeVerb.ar(sig,0.1,10)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 2034.607137359, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(43.2*[1,2,4,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1!4),1/2,16);
  sig = FreeVerb.ar(sig,0.01,10)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 2042.035208474, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(43.2*[1,2,4,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1!4),1,16);
  sig = FreeVerb.ar(sig,0.01,10)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 2044.715258864, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(43.2*[1,2,4,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40));
  sig = sig * (SinOsc.ar(1/4*[1,4,2,8]).exprange(0.001,1) + Pulse.ar(4/fib(12))) ;
  sig = CombN.ar(sig,LFDNoise1.ar(1!8),1,16);
  sig = FreeVerb.ar(sig,0.01,10)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 2049.097606172, 'me', "(
~meta.quant=2;
~meta.fadeTime=4;
~meta={
  var sig = Blip.ar(43.2*[1,2,4,8]+SinOsc.ar(8*LFSaw.ar(1/4).exprange(0.001,100)).range(-40,40));
  sig = sig * (SinOsc.ar(4*[1,4,2,8]).