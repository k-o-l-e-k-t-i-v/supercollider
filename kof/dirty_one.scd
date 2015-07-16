



(
  p=ProxySpace.push(s.reboot);
);

// fbck synth ///////////////////////////////////////

(
~fbck.quant=1;
~fbck.fadeTime=0.02;
~fbck={
  var mod = Duty.kr(Dseq([7,1/4,1/4,1/2],inf),0,Dseq([1,2,1.5,1.25],inf));
  var sig = Dust.ar(10000*LFSaw.ar(1/2/fib(8)).exprange(0.001,1));
  sig = LPF.ar(sig,80*(1..8)+(LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*12000));
  sig = Formlet.ar(sig,[43.2,432/2,432]*mod*LFSaw.ar(1/16/fib(8)).exprange(1.001,4).round(1.25),0.0001,0.08);
  sig = sig * (AllpassN.ar(~fbck.ar,1,LFNoise1.ar(1!8).exprange(0.002,0.004),4)) + sig /1.5;
  sig = sig * Pulse.ar(4/fib(8)) + (Resonz.ar(~fbck.ar,43.2*mod*[1,2,4,8],0.2)/4*LFSaw.ar(4/fib(8)).exprange(0.001,1));
  sig = Decimator.ar(sig,44100,LFSaw.ar(1/4).exprange(4.001,24));
  sig = Limiter.ar(sig,0.85);
  sig = CompanderD.ar(sig,4/3,1/1.5,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
~fbck.play;
);
~fbck.stop(7);
~fbck.clear;

