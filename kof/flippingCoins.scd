

(
  p=ProxySpace.push(s.reboot);
  e=ProxySubmix.new(\filter);
);


// brown synth ///////////////////////////////////////

(
~brown.quant=1;
~brown.fadeTime=0.02;
~brown={
  var sig = [] ++ Dust.ar(1111) ++ LFSaw.ar(44) ++ SinOsc.ar(8000) ++ SinOsc.ar(12000) ++ LFPulse.ar(100);
  sig = sig * SinOsc.ar(22*(1..8)) + SinOsc.ar([3,4,5,6]).range(-0.2,0.2);
  sig = Limiter.ar(sig);
  sig = LPF.ar(sig,18000*LFSaw.ar(1/8/fib(8)).exprange(0.001,1)+100) * Decay.ar(CoinGate.ar(0.75,Impulse.ar(1/4,(1..8)/8)),LFDNoise1.ar(1!4).range(0.1,4.5)) * LFDNoise1.ar(1!4);
  sig = GVerb.ar(sig,80)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig);
};
e.addMix(~brown,postVol:true);
~brown.play;
);
~brown.stop(7);
~brown.clear;
// brown synth ///////////////////////////////////////

(
~brown.quant=1;
~brown.fadeTime=0.02;
~brown={
  var sig = BrownNoise.ar(1!2);
  sig = LPF.ar(sig,8000*LFSaw.ar(1/4).exprange(0.001,1)+100) * LFSaw.ar(4).exprange(0.001,1);
  sig = GVerb.ar(sig/4,80);
  Mix.ar(sig)!2 * 0.5;
};
e.addMix(~brown,postVol:true);
~brown.play;
);
~brown.stop(7);
~brown.clear;
