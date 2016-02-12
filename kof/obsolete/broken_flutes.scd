


// fader synth ///////////////////////////////////////

(
  p=ProxySpace.push(s.reboot);
  e=ProxySubmix.new(\filter);
);

(
~fader.quant=2;
~fader.fadeTime=5;
~fader={
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
e.addMix(~fader,postVol:true);
~fader.play;
);
~fader.stop(7);


History.end;

