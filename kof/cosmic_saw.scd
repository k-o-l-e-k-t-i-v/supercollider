/*
                         _      
  ___ ___  ___ _ __ ___ (_) ___ 
 / __/ _ \/ __| '_ ` _ \| |/ __|
| (_| (_) \__ \ | | | | | | (__ 
 \___\___/|___/_| |_| |_|_|\___|
*/

(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var mod = Duty.kr(4,0,Dseq(1/[1,2,4,8]+1,inf)).lag(1/4);
  var imp = Decay.ar(Impulse.ar(1/4,(0..15)/16),3)**2;
  var sig = Blip.ar([100,150]*mod/[1,1,1,1,1.5,1,1.25,2,8]-(imp*2),LFSaw.ar(1/4/fib(8)).exprange(2.01,8)) * imp;
  sig = Resonz.ar(sig,imp*2000+100) + sig;
  sig = GVerb.ar(sig,[2,3,4]*10,mul:0.24)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
m.addMix(~saw,postVol:true);
);
~saw.stop(7);


(
~kick.quant=2;
~kick.fadeTime=2;
~kick={
  var imp = Pulse.ar(4/fib(8));
  var sig = SinOsc.ar(90*(1.0001**(1..8)) + (imp*4) );
  sig = sig * imp;
  Splay.ar(sig.flat,0.25,0.025);
};
~kick.play;
m.addMix(~kick,postVol:true);
);
~kick.stop(7);

(
~hiss.quant=2;
~hiss.fadeTime=2;
~hiss={
  var sig = WhiteNoise.ar(0.1!2);
  sig = sig * (Pulse.ar(4/fib(8)) ** 2);
  Splay.ar(sig.flat,0.25,0.0025);
};
~hiss.play;
m.addMix(~hiss,postVol:true);
);
~hiss.stop(7);


(
~filt.quant=2;
~filt.fadeTime=2;
~filt={
  var sig = m.ar;
  sig = GVerb.ar(sig,100);
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.04);
};
~filt.play;
);
~filt.stop(7);


