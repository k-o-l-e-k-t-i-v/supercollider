(
  p=ProxySpace.push(s.reboot);
  m=ProxySubmix.new(\filter);
);

// meta synth ///////////////////////////////////////

(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2*[1,1.5,1.25,4]);
  sig = sig * (1-LFSaw.ar(1/4/fib(4)).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,15000/2));
  sig = sig + HPF.ar((SinOsc.ar(5000/([1,2,4,8]*pi),mul:0.004)*Pulse.ar(2/fib(8))),50);
  sig = sig + (PinkNoise.ar(0.1!2) * Pulse.ar(2/fib(8)));
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = CombN.ar(sig,1,LFDNoise1.ar(1/4!4).exprange(0.0002,2).round(0.002),2)/2+sig;
  sig = Greyhole.ar(sig)/2+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~meta,postVol:true);
~meta.play;
);
~meta.stop(60);

History.end;
