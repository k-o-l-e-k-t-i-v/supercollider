// History, as it was on Sat Jun 20 00:31:04 2015.

[
[ 0, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = 60.midicps*2/([1,1.5,2,1.25]*pi);
  var sig = LFSaw.ar(note);
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*5000+100);
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 26.360906706, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = 60.midicps*2/([1,1.5,2,1.25,0.25,0.1125]*pi);
  var sig = LFSaw.ar(note);
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*5000+100);
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 43.645442022, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = 60.midicps*2/([1,1.5,2,1.25,0.25,0.1125,1/64]*pi);
  var sig = LFSaw.ar(note);
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*5000+100);
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 59.308612783, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = 60.midicps*2/([1,1.5,2,1.25,0.25,0.1125,1/64]*1.5pi);
  var sig = LFSaw.ar(note);
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*5000+100);
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 77.558696582, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = 60.midicps*2/([1,1.5,2,1.25,0.25,0.1125,1/64]*1pi);
  var sig = LFSaw.ar(note);
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*5000+100);
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 91.295365261, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = 60.midicps*1.5/([1,1.5,2,1.25,0.25,0.1125,1/64]*1pi);
  var sig = LFSaw.ar(note);
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*5000+100);
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 104.350977684, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = 60.midicps*1.5/([1,1.25,2,1.5,0.25,0.1125,1/64]*1pi);
  var sig = LFSaw.ar(note);
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*5000+100);
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 118.380596082, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = 60.midicps*1.5/([1,1.25,2,1.5,0.25,0.1125,1/64]*1pi);
  var sig = LFSaw.ar(note);
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*15000+100);
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 168.595093979, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = 60.midicps*1.5/([1,1.25,2,1.5,0.25,0.1125,1/64]*1pi);
  var sig = LFSaw.ar(note);
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*5000+100);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(1/8/fib(8)).exprange(0.001,1)*15000+100));
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 181.047604438, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = 60.midicps*2/([1,1.25,2,1.5,0.25,0.1125,1/64]*1pi);
  var sig = LFSaw.ar(note);
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*5000+100);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(1/8/fib(8)).exprange(0.001,1)*15000+100));
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 192.921543105, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [60,72,65,67].midicps*2/([1,1.25,2,1.5,0.25,0.1125,1/64]*1pi);
  var sig = LFSaw.ar(note);
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*5000+100);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(1/8/fib(8)).exprange(0.001,1)*15000+100));
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 224.036568387, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [60,72,65,67].midicps*2/([1,1.25,2,1.5,0.25,0.1125,1/64]*1pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1).range(-2,2));
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*5000+100);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(1/8/fib(8)).exprange(0.001,1)*15000+100));
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 233.928249057, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [60,72,65,67].midicps*2/([1,1.25,2,1.5,0.25,0.1125,1/64]*1pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1*fib(8)).range(-2,2));
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*5000+100);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(1/8/fib(8)).exprange(0.001,1)*15000+100));
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 265.612110225, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [60,72,65,67].midicps*2/([1,1.25,2,1.5,0.25,0.1125,1/64]*1pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1*fib(8)).range(-2,2));
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*5000+100);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(1/8/fib(8)).exprange(0.001,1)*15000+100));
  sig = sig * Pulse.ar([1,2,3,4]);
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 286.478273674, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [60,72,65,67].midicps*2/([1,1.25,2,1.5,0.25,0.1125,1/64]*1pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1*fib(8)).range(-2,2));
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*5000+100);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(1/8/fib(8)).exprange(0.001,1)*15000+100));
  sig = sig * Pulse.ar([1,2,3,4]);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 294.065638955, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [60,72,65,67].midicps*2/([1,1.25,2,1.5,0.25,0.1125,1/64]*1pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1*fib(8)).range(-2,2));
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*5000+100);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(1/8/fib(8)).exprange(0.001,1)*15000+100));
  sig = sig * Pulse.ar([1,2,3,4]);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
~saw.play;
);" ],
[ 323.759249689, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [60,72,65,67].midicps*2/([1,1.25,2,1.5,0.25,0.1125,1/64]*1pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1*fib(8)).range(-2,2));
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*5000+100);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(1/8/fib(8)).exprange(0.001,1)*15000+100));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
~saw.play;
);" ],
[ 337.350754826, 'me', "(
~saw.fadeTime=5;
~saw={
  var note = [60,72,65,67].midicps*2/([1,1.25,2,1.5,0.25,0.1125,1/64]*1pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1*fib(8)).range(-2,2));
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*5000+100);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(1/8/fib(8)).exprange(0.001,1)*15000+100));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 352.392711757, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [60,72,63,67].midicps*2/([1,1.25,2,1.5,0.25,0.1125,1/64]*1pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1*fib(8)).range(-2,2));
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*5000+100);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(1/8/fib(8)).exprange(0.001,1)*15000+100));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 362.79263566, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [60,72,63,65].midicps*2/([1,1.25,2,1.5,0.25,0.1125,1/64]*1pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1*fib(8)).range(-2,2));
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*5000+100);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(1/8/fib(8)).exprange(0.001,1)*15000+100));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 370.32803119, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [60,72,69,65].midicps*2/([1,1.25,2,1.5,0.25,0.1125,1/64]*1pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1*fib(8)).range(-2,2));
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*5000+100);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(1/8/fib(8)).exprange(0.001,1)*15000+100));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 377.014523909, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [60,72,60,65].midicps*2/([1,1.25,2,1.5,0.25,0.1125,1/64]*1pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1*fib(8)).range(-2,2));
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*5000+100);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(1/8/fib(8)).exprange(0.001,1)*15000+100));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 381.327600087, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [60,72,60,60].midicps*2/([1,1.25,2,1.5,0.25,0.1125,1/64]*1pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1*fib(8)).range(-2,2));
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*5000+100);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(1/8/fib(8)).exprange(0.001,1)*15000+100));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 388.017737773, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [60,72,48,60].midicps*2/([1,1.25,2,1.5,0.25,0.1125,1/64]*1pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1*fib(8)).range(-2,2));
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*5000+100);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(1/8/fib(8)).exprange(0.001,1)*15000+100));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 399.924222149, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [60,72,48,60].midicps*2/([1,1.25,2,1.5,0.25,0.1125,1/64]*1pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1*fib(8)).range(-2,2));
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*15000+100);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(1/8/fib(8)).exprange(0.001,1)*15000+100));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 405.274506457, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [60,72,48,60].midicps*2/([1,1.25,2,1.5,0.25,0.1125,1/64]*1pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1*fib(8)).range(-2,2));
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*15000+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(1/8/fib(8)).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 412.957605743, 'me', "(
~saw.fadeTime=5;
~saw={
  var note = [60,72,48,60].midicps*2/([1,1.25,2,1.5,0.25,0.1125,1/64]*1pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1*fib(8)).range(-2,2));
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*15000+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(1/3/fib(8)).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 416.434946101, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [60,72,48,60].midicps*2/([1,1.25,2,1.5,0.25,0.1125,1/64]*1pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1*fib(8)).range(-2,2));
  sig = LPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*15000+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(1/3/fib(8)).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 431.378593015, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [60,72,48,60].midicps*2/([1,1.25,2,1.5,0.25,0.1125,1/64]*1pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1*fib(8)).range(-2,2));
  sig = LPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*15000+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(4/fib(8)).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 433.632460574, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [60,72,48,60].midicps*2/([1,1.25,2,1.5,0.25,0.1125,1/64]*1pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1*fib(8)).range(-2,2));
  sig = LPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*15000+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 440.927801269, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [60,72,48,60].midicps/([1,1.25,2,1.5,0.25,0.1125,1/64]*1pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1*fib(8)).range(-2,2));
  sig = LPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*15000+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 452.744379808, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [60,72,48,60].midicps*4/([1,1.25,2,1.5,0.25,0.1125,1/64]*1pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1*fib(8)).range(-2,2));
  sig = LPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*15000+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 458.528448707, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [60,72,48,60].midicps*4/([1,1.25,2,1.5,0.25,0.1125,1/64]*0.5pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1*fib(8)).range(-2,2));
  sig = LPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*15000+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 464.084282731, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [60,72,48,60].midicps*2/([1,1.25,2,1.5,0.25,0.1125,1/64]*0.5pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1*fib(8)).range(-2,2));
  sig = LPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*15000+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 473.882766211, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [60,72,48,60].midicps*[1.5,1]/([1,1.25,2,1.5,0.25,0.1125,1/64]*0.5pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1*fib(8)).range(-2,2));
  sig = LPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*15000+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 482.385200046, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [60,72,48,60].midicps*[1.5,2]/([1,1.25,2,1.5,0.25,0.1125,1/64]*0.5pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1*fib(8)).range(-2,2));
  sig = LPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*15000+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 485.011240565, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [60,72,48,60].midicps*[1.25,2]/([1,1.25,2,1.5,0.25,0.1125,1/64]*0.5pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1*fib(8)).range(-2,2));
  sig = LPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*15000+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 493.775052135, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [60,72,48,60].midicps*[1,0.5]/([1,1.25,2,1.5,0.25,0.1125,1/64]*0.5pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1*fib(8)).range(-2,2));
  sig = LPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*15000+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 498.273741974, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [60,72,48,60].midicps*[1,0.5,0.25]/([1,1.25,2,1.5,0.25,0.1125,1/64]*0.5pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1*fib(8)).range(-2,2));
  sig = LPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*15000+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 501.989151102, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [60,72,48,60].midicps*[1,0.5]/([1,1.25,2,1.5,0.25,0.1125,1/64]*0.5pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1*fib(8)).range(-2,2));
  sig = LPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*15000+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 508.500214043, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [60,72,48,60].midicps*[1,0.5]/([1,1.25,2,1.5,0.25,0.1125,1/64]*0.5pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1).range(-2,2));
  sig = LPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*15000+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 518.526628144, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [60,72,48,60].midicps*[1,0.5]/([1,1.25,2,1.5,0.25,0.1125,1/64]*0.5pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1).range(-2,2));
  sig = LPF.ar(sig,LFSaw.ar(1).exprange(0.001,1)*15000+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 521.767528077, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [60,72,48,60].midicps*[1,0.5]/([1,1.25,2,1.5,0.25,0.1125,1/64]*0.5pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1).range(-2,2));
  sig = LPF.ar(sig,LFSaw.ar(1).exprange(0.001,1)*15000+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(2).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 524.56052783, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [60,72,48,60].midicps*[1,0.5]/([1,1.25,2,1.5,0.25,0.1125,1/64]*0.5pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1).range(-2,2));
  sig = LPF.ar(sig,LFSaw.ar(1).exprange(0.001,1)*15000+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(2).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4).exprange(0.001,1);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 534.285298439, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [60,72,48+12,60].midicps*[1,0.5]/([1,1.25,2,1.5,0.25,0.1125,1/64]*0.5pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1).range(-2,2));
  sig = LPF.ar(sig,LFSaw.ar(1).exprange(0.001,1)*15000+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(2).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4).exprange(0.001,1);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 539.580345654, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [60,72,48+12,65].midicps*[1,0.5]/([1,1.25,2,1.5,0.25,0.1125,1/64]*0.5pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1).range(-2,2));
  sig = LPF.ar(sig,LFSaw.ar(1).exprange(0.001,1)*15000+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(2).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4).exprange(0.001,1);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 543.06371671, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [63,72,48+12,65].midicps*[1,0.5]/([1,1.25,2,1.5,0.25,0.1125,1/64]*0.5pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1).range(-2,2));
  sig = LPF.ar(sig,LFSaw.ar(1).exprange(0.001,1)*15000+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(2).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4).exprange(0.001,1);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 549.362679982, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [63,72,48+12,65].midicps*[1,0.5]/([1,1.25,2,1.5,0.25,0.1125,1/64]*0.5pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1).range(-2,2));
  sig = LPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*15000+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(2).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4).exprange(0.001,1);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 554.011671315, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [63,72,48+12,65].midicps*[1,0.5]/([1,1.25,2,1.5,0.25,0.1125,1/64]*0.5pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1).range(-2,2));
  sig = LPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*15000+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4).exprange(0.001,1);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 558.885651053, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [63,72,48+12,65].midicps*[1,0.5]/([1,1.25,2,1.5,0.25,0.1125,1/64]*0.5pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1).range(-2,2));
  sig = LPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*15000+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 579.63015361, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [63,72,48+12,65].midicps*[1,0.5]/([1,1.25,2,1.5,0.25,0.1125,1/64]*0.5pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1).range(-2,2));
  sig = LPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*15000+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig)/2+(sig/2);
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 589.629801294, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [63,72,48+12,65].midicps*[1,0.5]/([1,1.25,2,1.5,0.25,0.1125,1/64]*0.5pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1).range(-2,2));
  sig = LPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*15000+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig)+(sig/3);
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 594.524275748, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [63,72,48+12,65].midicps*[1,0.5]/([1,1.25,2,1.5,0.25,0.1125,1/64]*0.5pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1).range(-2,2));
  sig = LPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*15000+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig,100)+(sig/3);
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 611.412339336, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [63,72,48+12,65].midicps*[1,0.5]/([1,1.25,2,1.5,0.25,0.1125,1/64]*0.5pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1).range(-2,2));
  sig = LPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*15000+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig,100)+LPF.ar(sig/2,800);
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 625.480811608, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [63,72,48+12,65].midicps*[1,0.5]/([1,1.25,2,1.5,0.25,0.1125,1/64]*0.5pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1).range(-2,2));
  sig = LPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*15000+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig,10) + LPF.ar(sig/2,800);
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 634.414499981, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [63,72,48+12,65].midicps*[1,0.5]/([1,1.25,2,1.5,0.25,0.1125,1/64]*0.5pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1).range(-2,2));
  sig = RLPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*15000+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig,10) + LPF.ar(sig/2,800);
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 637.430095183, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [63,72,48+12,65].midicps*[1,0.5]/([1,1.25,2,1.5,0.25,0.1125,1/64]*0.5pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1).range(-2,2));
  sig = RLPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*15000+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig,100) + LPF.ar(sig/2,800);
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 645.315556534, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [63,72,48+12,65].midicps*[1,0.5]/([1,1.25,2,1.5,0.25,0.1125,1/64]*0.5pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1).range(-2,2));
  sig = RLPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*1500+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig,100) + LPF.ar(sig/2,800);
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 655.362932608, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [63,72,48+12,65].midicps*[1,0.5]/([1,1.25,2,1.5,0.25,0.1125,1/64]*0.5pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1).range(-2,2));
  sig = RLPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*5500+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig,100) + LPF.ar(sig/2,800);
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 662.258171083, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [63,72,48+12,65].midicps*[1,0.5]/([1,1.25,2,1.5,0.25,0.1125,1/64]*0.5pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1).range(-2,2));
  sig = RLPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*15500+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig,100) + LPF.ar(sig/2,800);
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 671.015433092, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [63,72,48+12,65].midicps*[1,0.5]/([1,1.25,2,1.5,0.25,0.1125,1/64]*0.5pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1).range(-2,2));
  sig = RLPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*15500+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(1/2/fib(8)).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig,100) + LPF.ar(sig/2,800);
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 676.66966372, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [63,72,48+12,63].midicps*[1,0.5]/([1,1.25,2,1.5,0.25,0.1125,1/64]*0.5pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1).range(-2,2));
  sig = RLPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*15500+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(1/2/fib(8)).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig,100) + LPF.ar(sig/2,800);
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 687.264178935, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [60,72,48+12,63].midicps*[1,0.5]/([1,1.25,2,1.5,0.25,0.1125,1/64]*0.5pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1).range(-2,2));
  sig = RLPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*15500+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(1/2/fib(8)).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig,100) + LPF.ar(sig/2,800);
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 700.855047218, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [60-7,72-7,48+12,63].midicps*[1,0.5]/([1,1.25,2,1.5,0.25,0.1125,1/64]*0.5pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1).range(-2,2));
  sig = RLPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*15500+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(1/2/fib(8)).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig,100) + LPF.ar(sig/2,800);
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 709.433782485, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [60-7,72-14,48+12,63].midicps*[1,0.5]/([1,1.25,2,1.5,0.25,0.1125,1/64]*0.5pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1).range(-2,2));
  sig = RLPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*15500+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(1/2/fib(8)).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig,100) + LPF.ar(sig/2,800);
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 717.53174274, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [60-14,72-14,48+12,63].midicps*[1,0.5]/([1,1.25,2,1.5,0.25,0.1125,1/64]*0.5pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1).range(-2,2));
  sig = RLPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*15500+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(1/2/fib(8)).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig,100) + LPF.ar(sig/2,800);
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 720.987652412, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [60-14,72-14,48+14,63].midicps*[1,0.5]/([1,1.25,2,1.5,0.25,0.1125,1/64]*0.5pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1).range(-2,2));
  sig = RLPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*15500+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(1/2/fib(8)).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig,100) + LPF.ar(sig/2,800);
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 725.096327361, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [60-14,72-14,48+14,63-7].midicps*[1,0.5]/([1,1.25,2,1.5,0.25,0.1125,1/64]*0.5pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1).range(-2,2));
  sig = RLPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*15500+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(1/2/fib(8)).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig,100) + LPF.ar(sig/2,800);
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 734.018755445, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [60-14,72,48+12,60].midicps*[1,0.5]/([1,1.25,2,1.5,0.25,0.1125,1/64]*0.5pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1).range(-2,2));
  sig = RLPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*15500+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(1/2/fib(8)).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig,100) + LPF.ar(sig/2,800);
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 741.836333652, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [60,72,48+12,60].midicps*[1,0.5]/([1,1.25,2,1.5,0.25,0.1125,1/64]*0.5pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1).range(-2,2));
  sig = RLPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*15500+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(1/2/fib(8)).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig,100) + LPF.ar(sig/2,800);
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 744.733181178, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [60,72,48+12,60].midicps*[2,0.5]/([1,1.25,2,1.5,0.25,0.1125,1/64]*0.5pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1).range(-2,2));
  sig = RLPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*15500+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(1/2/fib(8)).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig,100) + LPF.ar(sig/2,800);
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 746.689821607, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [60,72,48+12,60].midicps*[2,1.5]/([1,1.25,2,1.5,0.25,0.1125,1/64]*0.5pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1).range(-2,2));
  sig = RLPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*15500+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(1/2/fib(8)).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig,100) + LPF.ar(sig/2,800);
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 752.234153092, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [60,72,48+12,60].midicps*[2,1.25]/([1,1.25,2,1.5,0.25,0.1125,1/64]*0.5pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1).range(-2,2));
  sig = RLPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*15500+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(1/2/fib(8)).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig,100) + LPF.ar(sig/2,800);
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
);" ],
[ 758.490866655, 'me', "~saw.stop(30);" ],
];