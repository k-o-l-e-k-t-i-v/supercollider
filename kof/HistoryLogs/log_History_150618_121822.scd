// History, as it was on Thu Jun 18 12:18:22 2015.

[
[ 0, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = 60.midicps*2/pi;
  var sig = [] ++ LFSaw.ar(note!2) ++ WhiteNoise.ar(0.2) ++ Blip.ar(note,20) ++ VarSaw.ar(note);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~bastard.play;
);" ],
[ 24.753344538, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = 60.midicps*2/([1,1.5,2,1.25]*pi);
  var sig = [] ++ LFSaw.ar(note!2) ++ WhiteNoise.ar(0.2) ++ Blip.ar(note,20) ++ VarSaw.ar(note);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~bastard.play;
);" ],
[ 47.962013176, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = 60.midicps*2/([1,1.5,2,1.25]*pi);
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.2) ++ Blip.ar(note,20) ++ VarSaw.ar(note);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~bastard.play;
);" ],
[ 85.797055763, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = 60.midicps*2/([1,1.5,2,1.25]*pi);
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.2) ++ Blip.ar(note,20) ++ VarSaw.ar(note);
  sig = SelectX.ar(LFDNoise1.kr(0,sig.size+0.1),sig);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~bastard.play;
);" ],
[ 101.247691356, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = 60.midicps*2/([1,1.5,2,1.25]*pi);
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.2) ++ Blip.ar(note*1.5,20) ++ VarSaw.ar(note/1.5);
  sig = SelectX.ar(LFDNoise1.kr(0,sig.size+0.1),sig);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~bastard.play;
);" ],
[ 109.786058591, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = 60.midicps*2/([1,1.5,2,1.25]*pi);
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5);
  sig = SelectX.ar(LFDNoise1.kr(0,sig.size+0.1),sig);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~bastard.play;
);" ],
[ 167.63976612, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = 60.midicps*2/([1,1.5,2,1.25]*pi);
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5);
  sig = SelectX.ar(LFDNoise1.kr(0,sig.size+0.1),sig);
  sig = LPF.ar(sig,LFDNoise1.ar(1!4).range(400,8000)) + BPF.ar(sig,LFDNoise1.ar(1!4).range(400,8000)) ;
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~bastard.play;
);" ],
[ 184.412834148, 'me', "(
~bastard.fadeTime=5;
~bastard={
  var note = 60.midicps*2/([1,1.5,2,1.25]*pi);
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5);
  sig = SelectX.ar(LFDNoise1.kr(0,sig.size+0.1),sig);
  sig = LPF.ar(sig,LFDNoise1.ar(1!4).range(40,8000)) + BPF.ar(sig,LFDNoise1.ar(1!4).range(400,8000)) ;
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = 
  Splay.ar(sig.flat,0.25,0.5);
};
~bastard.play;
);" ],
[ 191.259788232, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = 60.midicps*2/([1,1.5,2,1.25]*pi);
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5);
  sig = SelectX.ar(LFDNoise1.kr(0,sig.size+0.1),sig);
  sig = LPF.ar(sig,LFDNoise1.ar(1!4).range(40,1200)) + BPF.ar(sig,LFDNoise1.ar(1!4).range(400,8000)) ;
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = 
  Splay.ar(sig.flat,0.25,0.5);
};
~bastard.play;
);" ],
[ 227.306668362, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = 60.midicps*2/([1,1.5,2,1.25]*pi);
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5);
  sig = SelectX.ar(LFDNoise1.kr(0,sig.size+0.1),sig);
  sig = LPF.ar(sig,LFDNoise1.ar(1!4).range(40,1200)) + BPF.ar(sig,LFDNoise1.ar(1!4).range(400,8000)) ;
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(sig,[5,6]);
  Splay.ar(sig.flat,0.25,0.5);
};
~bastard.play;
);" ],
[ 229.729681992, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = 60.midicps*2/([1,1.5,2,1.25]*pi);
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5);
  sig = SelectX.ar(LFDNoise1.kr(0,sig.size+0.1),sig);
  sig = LPF.ar(sig,LFDNoise1.ar(1!4).range(40,1200)) + BPF.ar(sig,LFDNoise1.ar(1!4).range(400,8000)) ;
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(sig,[5,6])+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~bastard.play;
);" ],
[ 239.948904767, 'me', "(
~bastard.fadeTime=5;
~bastard={
  var note = 60.midicps*2/([1,1.5,2,1.25]*pi);
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5);
  sig = SelectX.ar(LFDNoise1.kr(0,sig.size+0.1),sig);
  sig = LPF.ar(sig,LFDNoise1.ar(1!4).range(40,1200)) + BPF.ar(sig,LFDNoise1.ar(1!4).range(400,8000)) ;
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  //sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(sig,[5,6])+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~bastard.play;
);" ],
[ 263.706723508, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = [60,72,48,67].midicps*2/([1,1.5,2,1.25]*pi);
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5);
  sig = SelectX.ar(LFDNoise1.kr(0,sig.size+0.1),sig);
  sig = LPF.ar(sig,LFDNoise1.ar(1!4).range(40,1200)) + BPF.ar(sig,LFDNoise1.ar(1!4).range(400,8000)) ;
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  //sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(sig,[5,6])+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~bastard.play;
);" ],
[ 281.797256673, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = [60,72,48,67].midicps*2/([1,1.5,2,1.25]*pi);
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.1) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5);
  sig = SelectX.ar(LFDNoise1.kr(0,sig.size+0.1),sig);
  sig = LPF.ar(sig,LFDNoise1.ar(1!4).range(40,1200)) + BPF.ar(sig,LFDNoise1.ar(1!4).range(400,8000)) ;
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  //sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(sig,[5,6])+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~bastard.play;
);" ],
[ 288.565091234, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = [60,72,48,67].midicps*2/([1,1.5,2,1.25]*pi);
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.1!2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5);
  sig = SelectX.ar(LFDNoise1.kr(0,sig.size+0.1),sig);
  sig = LPF.ar(sig,LFDNoise1.ar(1!4).range(40,1200)) + BPF.ar(sig,LFDNoise1.ar(1!4).range(400,8000)) ;
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  //sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(sig,[5,6])+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~bastard.play;
);" ],
[ 296.272486473, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = [60,72,48,67].midicps*2/([1,1.5,2,1.25]*pi);
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.1!2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5) ++ SinOsc.ar(note);
  sig = SelectX.ar(LFDNoise1.kr(0,sig.size+0.1),sig);
  sig = LPF.ar(sig,LFDNoise1.ar(1!4).range(40,1200)) + BPF.ar(sig,LFDNoise1.ar(1!4).range(400,8000)) ;
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  //sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(sig,[5,6])+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~bastard.play;
);" ],
[ 347.949421951, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = [60,72,48,67].midicps*2/([1,1.5,2,1.25]*pi) + SinOsc.ar(1*(1.01**(1..8))).range(-5,5);
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.1!2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5) ++ SinOsc.ar(note);
  sig = SelectX.ar(LFDNoise1.kr(0,sig.size+0.1),sig);
  sig = LPF.ar(sig,LFDNoise1.ar(1!4).range(40,1200)) + BPF.ar(sig,LFDNoise1.ar(1!4).range(400,8000)) ;
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  //sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(sig,[5,6])+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~bastard.play;
);" ],
[ 362.345049294, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = [60,72,48,67].midicps*2/([1,1.5,2,1.25]*pi) + SinOsc.ar(4*(1.01**(1..8))).range(-5,5);
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.1!2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5) ++ SinOsc.ar(note);
  sig = SelectX.ar(LFDNoise1.kr(0,sig.size+0.1),sig);
  sig = LPF.ar(sig,LFDNoise1.ar(1!4).range(40,1200)) + BPF.ar(sig,LFDNoise1.ar(1!4).range(400,8000)) ;
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  //sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(sig,[5,6])+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~bastard.play;
);" ],
[ 376.264230831, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = [60,72,48,67].midicps*2/([1,1.5,2,1.25]*pi) + SinOsc.ar(44*(1.01**(1..8))).range(-5,5);
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.1!2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5) ++ SinOsc.ar(note);
  sig = SelectX.ar(LFDNoise1.kr(0,sig.size+0.1),sig);
  sig = LPF.ar(sig,LFDNoise1.ar(1!4).range(40,1200)) + BPF.ar(sig,LFDNoise1.ar(1!4).range(400,8000)) ;
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  //sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(sig,[5,6])+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~bastard.play;
);" ],
[ 413.790396093, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = [60,72,48,67].midicps*2/([1,1.5,2,1.25]*pi) + SinOsc.ar(44*(1.01**(1..8))).range(-1,1);
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.1!2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5) ++ SinOsc.ar(note);
  sig = SelectX.ar(LFDNoise1.kr(0,sig.size+0.1),sig);
  sig = LPF.ar(sig,LFDNoise1.ar(1!4).range(40,1200)) + BPF.ar(sig,LFDNoise1.ar(1!4).range(400,8000)) ;
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  //sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(sig,[5,6])+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~bastard.play;
);" ],
[ 430.587050052, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = [60,72,48,67].midicps*2/([1,1.5,2,1.25]*pi) + SinOsc.ar(44*(1.01**(1..8))).range(-1,LFSaw.ar(1/4).exprange(0.001,10));
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.1!2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5) ++ SinOsc.ar(note);
  sig = SelectX.ar(LFDNoise1.kr(0,sig.size+0.1),sig);
  sig = LPF.ar(sig,LFDNoise1.ar(1!4).range(40,1200)) + BPF.ar(sig,LFDNoise1.ar(1!4).range(400,8000)) ;
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  //sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(sig,[5,6])+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~bastard.play;
);" ],
[ 457.585800638, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = [60,72,48,67].midicps*2/([1,1.5,2,1.25]*pi) + SinOsc.ar(440*(1.01**(1..8))).range(-1,LFSaw.ar(1/4).exprange(0.001,100));
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.1!2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5) ++ SinOsc.ar(note);
  sig = SelectX.ar(LFDNoise1.kr(0,sig.size+0.1),sig);
  sig = LPF.ar(sig,LFDNoise1.ar(1!4).range(40,1200)) + BPF.ar(sig,LFDNoise1.ar(1!4).range(400,8000)) ;
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  //sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(sig,[5,6])+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~bastard.play;
);" ],
[ 469.357517868, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = [60,72,48,67].midicps*2/([1,1.5,2,1.25]*pi) + SinOsc.ar(4400*(1.01**(1..8))).range(-1,LFSaw.ar(1/4).exprange(0.001,100));
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.1!2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5) ++ SinOsc.ar(note);
  sig = SelectX.ar(LFDNoise1.kr(0,sig.size+0.1),sig);
  sig = LPF.ar(sig,LFDNoise1.ar(1!4).range(40,1200)) + BPF.ar(sig,LFDNoise1.ar(1!4).range(400,8000)) ;
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  //sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(sig,[5,6])+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~bastard.play;
);" ],
[ 492.004727846, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = [60,72,48,67].midicps*2/([1,1.5,2,1.25]*pi) + SinOsc.ar(4400*(1.01**(1..8))).range(-1,LFSaw.ar(1/4).exprange(0.001,100));
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.1!2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5) ++ SinOsc.ar(note);
  sig = SelectX.ar(LFDNoise1.kr(0,sig.size+0.1),sig);
  sig = LPF.ar(sig,LFDNoise1.ar(1!4).range(40,1200)) + Resonz.ar(sig,LFDNoise1.ar(1!4).range(400,8000)) ;
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = Limiter.ar(sig);
  //sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(sig,[5,6])+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~bastard.play;
);" ],
[ 514.687167188, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = [60,72,48,67].midicps*2/([1,1.5,2,1.25]*pi) + SinOsc.ar(440*(1.01**(1..8))).range(-1,LFSaw.ar(1/4).exprange(0.001,100));
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.1!2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5) ++ SinOsc.ar(note);
  sig = SelectX.ar(LFDNoise1.kr(0,sig.size+0.1),sig);
  sig = LPF.ar(sig,LFDNoise1.ar(1!4).range(40,1200)) + Resonz.ar(sig,LFDNoise1.ar(1!4).range(400,8000)) ;
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = Limiter.ar(sig);
  //sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(sig,[5,6])+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~bastard.play;
);" ],
[ 521.474423329, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = [60,72,48,67].midicps*2/([1,1.5,2,1.25]*pi) + SinOsc.ar(44*(1.01**(1..8))).range(-1,LFSaw.ar(1/4).exprange(0.001,100));
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.1!2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5) ++ SinOsc.ar(note);
  sig = SelectX.ar(LFDNoise1.kr(0,sig.size+0.1),sig);
  sig = LPF.ar(sig,LFDNoise1.ar(1!4).range(40,1200)) + Resonz.ar(sig,LFDNoise1.ar(1!4).range(400,8000)) ;
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = Limiter.ar(sig);
  //sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(sig,[5,6])+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~bastard.play;
);" ],
[ 526.297188073, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = [60,72,48,67].midicps*2/([1,1.5,2,1.25]*pi) + SinOsc.ar(44*(1.01**(1..8))).range(-1,LFSaw.ar(1/4/fib(12)).exprange(0.001,100));
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.1!2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5) ++ SinOsc.ar(note);
  sig = SelectX.ar(LFDNoise1.kr(0,sig.size+0.1),sig);
  sig = LPF.ar(sig,LFDNoise1.ar(1!4).range(40,1200)) + Resonz.ar(sig,LFDNoise1.ar(1!4).range(400,8000)) ;
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = Limiter.ar(sig);
  //sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(sig,[5,6])+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~bastard.play;
);" ],
[ 557.291759954, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = [60,72,48,67].midicps*2/([1,1.5,2,1.25]*pi) + SinOsc.ar(44*(1.01**(1..8))).range(-1,LFSaw.ar(1/4/fib(12)).exprange(0.001,100));
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.1!2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5) ++ SinOsc.ar(note);
  sig = SelectX.ar(LFDNoise1.kr(0,sig.size+0.1),sig);
  sig = BPF.ar(sig,LFDNoise1.ar(1!4).range(40,12000)) + Resonz.ar(sig,LFDNoise1.ar(1!4).range(400,8000)) ;
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = Limiter.ar(sig);
  //sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(sig,[5,6])+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~bastard.play;
);" ],
[ 571.207594154, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = [60,72,48,67].midicps*2/([1,1.5,2,1.25]*pi) + SinOsc.ar(44*(1.01**(1..8))).range(-1,LFSaw.ar(1/4/fib(12)).exprange(0.001,100));
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.1!2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5) ++ SinOsc.ar(note);
  sig = SelectX.ar(LFDNoise1.kr(0,sig.size+0.1),sig);
  sig = BPF.ar(sig,LFDNoise1.ar(1!8).range(40,12000)) + Resonz.ar(sig,LFDNoise1.ar(1!8).range(400,8000)) ;
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = Limiter.ar(sig);
  //sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(sig,[5,6])+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~bastard.play;
);" ],
[ 583.642959048, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = [60,72,48,67].midicps*2/([1,1.5,2,1.25]*pi) + SinOsc.ar(44*(1.01**(1..8))).range(-1,LFSaw.ar(1/4/fib(12)).exprange(0.001,100));
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.1!2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5) ++ SinOsc.ar(note);
  sig = SelectX.ar(LFDNoise1.kr(0,sig.size+0.1),sig);
  sig = BPF.ar(sig,LFDNoise1.ar(1!8).range(40,12000)) + Resonz.ar(sig,LFDNoise1.ar(1!8).range(400,8000)) ;
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = Limiter.ar(sig);
  //sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(sig,[5,6])/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~bastard.play;
);" ],
[ 615.692729538, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = [60,72,48,67].midicps*2/([1,1.5,2,1.25]*pi) + SinOsc.ar(44*(1.01**(1..8))).range(-1,LFSaw.ar(1/4/fib(12)).exprange(0.001,10000));
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.1!2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5) ++ SinOsc.ar(note);
  sig = SelectX.ar(LFDNoise1.kr(0,sig.size+0.1),sig);
  sig = BPF.ar(sig,LFDNoise1.ar(1!8).range(40,12000)) + Resonz.ar(sig,LFDNoise1.ar(1!8).range(400,8000)) ;
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = Limiter.ar(sig);
  //sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(sig,[5,6])/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~bastard.play;
);" ],
[ 638.755750467, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = [60,72,48,67].midicps*2/([1,1.5,2,1.25]*pi) + SinOsc.ar(44*(1.01**(1..8))).range(-1,LFSaw.ar(4/fib(12)).exprange(0.001,10000));
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.1!2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5) ++ SinOsc.ar(note);
  sig = SelectX.ar(LFDNoise1.kr(0,sig.size+0.1),sig);
  sig = BPF.ar(sig,LFDNoise1.ar(1!8).range(40,12000)) + Resonz.ar(sig,LFDNoise1.ar(1!8).range(400,8000)) ;
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = Limiter.ar(sig);
  //sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(sig,[5,6])/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~bastard.play;
);" ],
[ 643.34964861, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = [60,72,48,67].midicps*2/([1,1.5,2,1.25]*pi) + SinOsc.ar(44*(1.01**(1..8))).range(-1,LFSaw.ar(4/fib(12)).exprange(0.001,1000));
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.1!2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5) ++ SinOsc.ar(note);
  sig = SelectX.ar(LFDNoise1.kr(0,sig.size+0.1),sig);
  sig = BPF.ar(sig,LFDNoise1.ar(1!8).range(40,12000)) + Resonz.ar(sig,LFDNoise1.ar(1!8).range(400,8000)) ;
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = Limiter.ar(sig);
  //sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(sig,[5,6])/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~bastard.play;
);" ],
[ 668.825125053, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = [60,72,48,67].midicps*2/([1,1.5,2,1.25]*pi) + SinOsc.ar(44*(1.01**(1..8))).range(-1,LFSaw.ar(4/fib(12)).exprange(0.001,1000));
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.1!2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5) ++ SinOsc.ar(note);
  sig = SelectX.ar(LFDNoise1.kr(0,sig.size+0.1),sig);
  sig = BPF.ar(sig,LFDNoise1.ar(1!8).range(40,12000),2) + Resonz.ar(sig,LFDNoise1.ar(1!8).range(400,8000)) ;
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = Limiter.ar(sig);
  //sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(sig,[5,6])/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~bastard.play;
);" ],
[ 670.325297479, 'me', "thisProcess.stop;" ],
[ 674.275547331, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = [60,72,48,67].midicps*2/([1,1.5,2,1.25]*pi) + SinOsc.ar(44*(1.01**(1..8))).range(-1,LFSaw.ar(4/fib(12)).exprange(0.001,1000));
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.1!2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5) ++ SinOsc.ar(note);
  sig = SelectX.ar(LFDNoise1.kr(0,sig.size+0.1),sig);
  sig = BPF.ar(sig,LFDNoise1.ar(1!8).range(140,12000),2) + Resonz.ar(sig,LFDNoise1.ar(1!8).range(400,8000)) ;
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = Limiter.ar(sig);
  //sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(sig,[5,6])/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~bastard.play;
);" ],
[ 693.688522657, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = [60,72,48,67].midicps*2/([1,1.5,2,1.25]*pi) + SinOsc.ar(44*(1.01**(1..8))).range(-1,LFSaw.ar(4/fib(12)).exprange(0.001,1000));
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.1!2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5) ++ SinOsc.ar(note);
  sig = SelectX.ar(LFDNoise1.kr(0,sig.size+0.1),sig);
  sig = Resonz.ar(sig,LFDNoise1.ar(1!8).range(400,8000)) ;
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = Limiter.ar(sig);
  //sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(sig,[5,6])/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~bastard.play;
);" ],
[ 710.491928304, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = [60,72,48,67].midicps*2/([1,1.5,2,1.25]*pi) + SinOsc.ar(44*(1.01**(1..8))).range(-1,LFSaw.ar(4/fib(12)).exprange(0.001,1000));
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.1!2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5) ++ SinOsc.ar(note);
  sig = SelectX.ar(LFDNoise1.kr(0,sig.size+0.1),sig);
  sig = Resonz.ar(sig,LFDNoise1.ar(1!8).range(400,8000)) ;
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = Limiter.ar(sig);
  //sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(sig,[5,6])/4+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
~bastard.play;
);" ],
[ 731.873563489, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = [60,72,48,67].midicps*2/([1,1.5,2,1.25]*pi) + SinOsc.ar(44*(1.01**(1..8))).range(-1,SinOsc.ar(1/8/fib(12)).exprange(0.001,10));
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.1!2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5) ++ SinOsc.ar(note);
  sig = SelectX.ar(LFDNoise1.kr(0,sig.size+0.1),sig);
  sig = Resonz.ar(sig,LFDNoise1.ar(1!8).range(400,8000)) ;
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = Limiter.ar(sig);
  //sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(sig,[5,6])/4+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
~bastard.play;
);" ],
[ 756.737978892, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = [60,72,48,67].midicps*2/([1,1.5,2,1.25]*pi) + SinOsc.ar(44*(1.01**(1..8))).range(-1,SinOsc.ar(1/8/fib(12)).exprange(0.001,10));
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.1!2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5) ++ SinOsc.ar(note);
  sig = SelectX.ar(LFDNoise1.kr(0,sig.size+0.1),sig);
  sig = Resonz.ar(sig,LFDNoise1.ar(1!8).range(400,8000)) ;
  sig = sig * SinOsc.ar(1/4/fib(8)).exprange(0.001,1);
  sig = Limiter.ar(sig);
  //sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(sig,[5,6])/4+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
~bastard.play;
);" ],
[ 783.593512782, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = [60,72,48,67].midicps*2/([1,1.5,2,1.25]*pi) + SinOsc.ar(44*(1.01**(1..8))).range(-1,SinOsc.ar(1/8/fib(12)).exprange(0.001,10));
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.1!2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5) ++ SinOsc.ar(note);
  sig = SelectX.ar(LFDNoise1.kr(0,sig.size+0.1),sig);
  sig = Resonz.ar(sig,LFDNoise1.ar(1!8).range(400,8000)) ;
  sig = sig * SinOsc.ar(1/4/fib(8)).exprange(0.001,1);
  sig = Limiter.ar(sig);
  //sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(sig,[5,6])/2+sig;
  Splay.ar(sig.flat,0.25,0.95);
};
~bastard.play;
);" ],
[ 830.663255811, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = ([60,72,48,67]+12).midicps*2/([1,1.5,2,1.25]*pi) + SinOsc.ar(44*(1.01**(1..8))).range(-1,SinOsc.ar(1/8/fib(12)).exprange(0.001,10));
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.1!2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5) ++ SinOsc.ar(note);
  sig = SelectX.ar(LFDNoise1.kr(0,sig.size+0.1),sig);
  sig = Resonz.ar(sig,LFDNoise1.ar(1!8).range(400,8000)) ;
  sig = sig * SinOsc.ar(1/4/fib(8)).exprange(0.001,1);
  sig = Limiter.ar(sig);
  //sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(sig,[5,6])/2+sig;
  Splay.ar(sig.flat,0.25,0.95);
};
~bastard.play;
);" ],
[ 856.052367279, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = ([60,72,48,67]+12).midicps*2/([1,1.5,2,1.25]*pi) + SinOsc.ar(44*(1.01**(1..8))).range(-1,SinOsc.ar(1/8/fib(12)).exprange(0.001,10));
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.1!2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5) ++ SinOsc.ar(note);
  sig = SelectX.ar(LFDNoise1.kr(0,sig.size+0.1),sig);
  sig = BBandPass.ar(sig,LFDNoise1.ar(1!8).range(400,8000)) ;
  sig = sig * SinOsc.ar(1/4/fib(8)).exprange(0.001,1);
  sig = Limiter.ar(sig);
  //sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(sig,[5,6])/2+sig;
  Splay.ar(sig.flat,0.25,0.95);
};
~bastard.play;
);" ],
[ 888.514836559, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = ([60,72,48,67]-12).midicps*2/([1,1.5,2,1.25]*pi) + SinOsc.ar(44*(1.01**(1..8))).range(-1,SinOsc.ar(1/8/fib(12)).exprange(0.001,10));
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.1!2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5) ++ SinOsc.ar(note);
  sig = SelectX.ar(LFDNoise1.kr(0,sig.size+0.1),sig);
  sig = BBandPass.ar(sig,LFDNoise1.ar(1!8).range(400,8000)) ;
  sig = sig * SinOsc.ar(1/4/fib(8)).exprange(0.001,1);
  sig = Limiter.ar(sig);
  //sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(sig,[5,6])/2+sig;
  Splay.ar(sig.flat,0.25,0.95);
};
~bastard.play;
);" ],
[ 944.243500554, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = ([60,72,48,67]-12).midicps*2/([1,1.5,2,1.25]*pi) + SinOsc.ar(44*(1.01**(1..8))).range(-1,SinOsc.ar(1/8/fib(12)).exprange(0.001,10));
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.1!2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5) ++ SinOsc.ar(note);
  sig = SelectX.ar(LFDNoise1.kr(1!8).range(0,sig.size+0.1),sig);
  sig = BBandPass.ar(sig,LFDNoise1.ar(1!8).range(400,8000)) ;
  sig = sig * SinOsc.ar(1/4/fib(8)).exprange(0.001,1);
  sig = Limiter.ar(sig);
  //sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(sig,[5,6])/2+sig;
  Splay.ar(sig.flat,0.25,0.95);
};
~bastard.play;
);" ],
[ 989.097310151, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = ([60,72,48,67]).midicps*2/([1,1.5,2,1.25]*pi) + SinOsc.ar(44*(1.01**(1..8))).range(-1,SinOsc.ar(1/8/fib(12)).exprange(0.001,10));
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.1!2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5) ++ SinOsc.ar(note);
  sig = SelectX.ar(LFDNoise1.kr(1!8).range(0,sig.size+0.1),sig);
  sig = BBandPass.ar(sig,LFDNoise1.ar(1!8).range(400,8000)) ;
  sig = sig * SinOsc.ar(1/4/fib(8)).exprange(0.001,1);
  sig = Limiter.ar(sig);
  //sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(sig,[5,6])/2+sig;
  Splay.ar(sig.flat,0.25,0.95);
};
~bastard.play;
);" ],
[ 1049.687045049, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = ([60,72,48,67]).midicps*2/([1,1.5,2,1.25]*pi) + SinOsc.ar(44*(1.01**(1..8))).range(-1,SinOsc.ar(1/8/fib(12)).exprange(0.001,10));
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.1!2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5) ++ SinOsc.ar(note);
  var eff;

  sig = SelectX.ar(LFDNoise1.kr(1!8).range(0,sig.size+0.1),sig);
  eff = BBandPass.ar(sig,LFDNoise1.ar(1!8).range(400,8000)) ;
  eff = eff * SinOsc.ar(1/4/fib(8)).exprange(0.001,1);
  eff = Limiter.ar(eff);
  //sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(eff,[5,6])/2+sig;
  Splay.ar(sig.flat,0.25,0.95);
};
~bastard.play;
);" ],
[ 1056.011341504, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = ([60,72,48,67]).midicps*2/([1,1.5,2,1.25]*pi) + SinOsc.ar(44*(1.01**(1..8))).range(-1,SinOsc.ar(1/8/fib(12)).exprange(0.001,10));
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.1!2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5) ++ SinOsc.ar(note);
  var eff;

  sig = SelectX.ar(LFDNoise1.kr(1!8).range(0,sig.size+0.1),sig);
  eff = BBandPass.ar(sig,LFDNoise1.ar(1!8).range(400,8000)) ;
  eff = eff * SinOsc.ar(1/4/fib(8)).exprange(0.001,1);
  eff = Limiter.ar(eff);
  //sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(eff,[5,6])/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~bastard.play;
);" ],
[ 1078.856077503, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = ([60,72,48,67]).midicps*2/([1,1.5,2,1.25]*pi) + SinOsc.ar(44*(1.01**(1..8))).range(-1,SinOsc.ar(1/8/fib(12)).exprange(0.001,10));
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.1!2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5) ++ SinOsc.ar(note);
  var eff;

  sig = SelectX.ar(LFDNoise1.kr(1!8).range(0,sig.size+0.1),sig);
  eff = BBandPass.ar(sig,LFDNoise1.ar(1!8).range(400,8000)) ;
  eff = eff * SinOsc.ar(1/4/fib(8)).exprange(0.001,1);
  eff = Limiter.ar(eff);
  //sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(eff,[5,6])/2+(sig*LFSaw.ar(1/8/fib(8)).exprange(0.001,1));
  Splay.ar(sig.flat,0.25,0.5);
};
~bastard.play;
);" ],
[ 1105.606675256, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = ([60,72,48,67]).midicps*2/([1,1.5,2,1.25]*pi) + SinOsc.ar(44*(1.01**(1..8))).range(-1,SinOsc.ar(1/8/fib(12)).exprange(0.001,10));
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.1!2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5) ++ SinOsc.ar(note);
  var eff;

  sig = SelectX.ar(LFDNoise1.kr(1).range(0,sig.size+0.1),sig);
  eff = BBandPass.ar(sig,LFDNoise1.ar(1!8).range(400,8000)) ;
  eff = eff * SinOsc.ar(1/4/fib(8)).exprange(0.001,1);
  eff = Limiter.ar(eff);
  //sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(eff,[5,6])/2+(sig*LFSaw.ar(1/8/fib(8)).exprange(0.001,1));
  Splay.ar(sig.flat,0.25,0.5);
};
~bastard.play;
);" ],
[ 1140.528654722, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = ([60,72,48,67]).midicps*2/([1,1.5,2,1.25]*pi) + SinOsc.ar(44*(1.01**(1..8))).range(-1,SinOsc.ar(1/8/fib(12)).exprange(0.001,10));
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.1!2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5) ++ SinOsc.ar(note);

  sig = SelectX.ar(LFDNoise1.kr(1!2).range(0,sig.size+0.1),sig);
sig = BBandPass.ar(sig,LFDNoise1.ar(1!8).range(400,8000)) ;
  sig = sig * SinOsc.ar(1/4/fib(8)).exprange(0.001,1);
  sig = Limiter.ar(sig);
  //sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(sig,[5,6])/2+(sig*LFSaw.ar(1/8/fib(8)).exprange(0.001,1));
  Splay.ar(sig.flat,0.25,0.5);
};
~bastard.play;
);" ],
[ 1166.864805036, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = ([60,72,48,67]).midicps*[1,1.5,2,4]/([1,1.5,2,1.25]*pi) + SinOsc.ar(44*(1.01**(1..8))).range(-1,SinOsc.ar(1/8/fib(12)).exprange(0.001,10));
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.1!2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5) ++ SinOsc.ar(note);

  sig = SelectX.ar(LFDNoise1.kr(1!2).range(0,sig.size+0.1),sig);
sig = BBandPass.ar(sig,LFDNoise1.ar(1!8).range(400,8000)) ;
  sig = sig * SinOsc.ar(1/4/fib(8)).exprange(0.001,1);
  sig = Limiter.ar(sig);
  //sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(sig,[5,6])/2+(sig*LFSaw.ar(1/8/fib(8)).exprange(0.001,1));
  Splay.ar(sig.flat,0.25,0.5);
};
~bastard.play;
);" ],
[ 1204.655206493, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = ([60,72,48,67]).midicps*[1,1.5,2,4]/([1,1.5,2,1.25]*pi) + SinOsc.ar(44*(1.01**(1..8))).range(-1,SinOsc.ar(1/8/fib(12)).exprange(0.001,100));
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.1!2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5) ++ SinOsc.ar(note);

  sig = SelectX.ar(LFDNoise1.kr(1!2).range(0,sig.size+0.1),sig);
sig = BBandPass.ar(sig,LFDNoise1.ar(1!8).range(400,8000)) ;
  sig = sig * SinOsc.ar(1/4/fib(8)).exprange(0.001,1);
  sig = Limiter.ar(sig);
  //sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(sig,[5,6])/2+(sig*LFSaw.ar(1/8/fib(8)).exprange(0.001,1));
  Splay.ar(sig.flat,0.25,0.5);
};
~bastard.play;
);" ],
[ 1232.470706261, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = ([60,72,48,67]).midicps*[1,1.5]/([1,1.5,2,1.25]*0.5pi) + SinOsc.ar(44*(1.01**(1..8))).range(-1,SinOsc.ar(1/8/fib(12)).exprange(0.001,100));
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.1!2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5) ++ SinOsc.ar(note);

  sig = SelectX.ar(LFDNoise1.kr(1!2).range(0,sig.size+0.1),sig);
sig = BBandPass.ar(sig,LFDNoise1.ar(1!8).range(400,8000)) ;
  sig = sig * SinOsc.ar(1/4/fib(8)).exprange(0.001,1);
  sig = Limiter.ar(sig);
  //sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(sig,[5,6])/2+(sig*LFSaw.ar(1/8/fib(8)).exprange(0.001,1));
  Splay.ar(sig.flat,0.25,0.5);
};
~bastard.play;
);" ],
[ 1251.838873886, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = ([60,72,48,67]).midicps*[1,1.5]/([1,1.5,2,1.25]*0.5pi) + SinOsc.ar(44*(1.01**(1..8))).range(-1,SinOsc.ar(1/8/fib(12)).exprange(0.001,10));
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.1!2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5) ++ SinOsc.ar(note);

  sig = SelectX.ar(LFDNoise1.kr(1!2).range(0,sig.size+0.1),sig);
sig = BBandPass.ar(sig,LFDNoise1.ar(1!8).range(400,8000)) ;
  sig = sig * SinOsc.ar(1/4/fib(8)).exprange(0.001,1);
  sig = Limiter.ar(sig);
  //sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(sig,[5,6])/2+(sig*LFSaw.ar(1/8/fib(8)).exprange(0.001,1));
  Splay.ar(sig.flat,0.25,0.5);
};
~bastard.play;
);" ],
[ 1280.971562137, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = ([60,72,48,67]).midicps*[1,1.5]/([1,1.5,2,1.25]*0.5pi) + SinOsc.ar(44*(1.01**(1..8))).range(-1,SinOsc.ar(1/8/fib(12)).exprange(0.001,10));
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.1!2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5) ++ SinOsc.ar(note);

  sig = SelectX.ar(SinOsc.ar(1/16/fib(8)).range(0,sig.size+0.1),sig);
sig = BBandPass.ar(sig,LFDNoise1.ar(1!8).range(400,8000)) ;
  sig = sig * SinOsc.ar(1/4/fib(8)).exprange(0.001,1);
  sig = Limiter.ar(sig);
  //sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(sig,[5,6])/2+(sig*LFSaw.ar(1/8/fib(8)).exprange(0.001,1));
  Splay.ar(sig.flat,0.25,0.5);
};
~bastard.play;
);" ],
[ 1284.774440115, 'me', "(
~bastard.quant=2;
~bastard.fadeTime=5;
~bastard={
  var note = ([60,72,48,67]).midicps*[1,1.5]/([1,1.5,2,1.25]*0.5pi) + SinOsc.ar(44*(1.01**(1..8))).range(-1,SinOsc.ar(1/8/fib(12)).exprange(0.001,10));
  var sig = [] ++ LFSaw.ar(note!2,mul:0.2) ++ WhiteNoise.ar(0.1!2) ++ Blip.ar(note*1.5,10) ++ VarSaw.ar(note/1.5) ++ SinOsc.ar(note);

  sig = SelectX.ar(SinOsc.ar(1/16/fib(8)).range(0,sig.size+0.1),sig);
sig = BBandPass.ar(sig,LFDNoise1.ar(1!8).range(400,18000)) ;
  sig = sig * SinOsc.ar(1/4/fib(8)).exprange(0.001,1);
  sig = Limiter.ar(sig);
  //sig = sig * Pulse.ar(note/10/fib(8));
  sig = GVerb.ar(sig,[5,6])/2+(sig*LFSaw.ar(1/8/fib(8)).exprange(0.001,1));
  Splay.ar(sig.flat,0.25,0.5);
};
~bastard.play;
);" ],
];