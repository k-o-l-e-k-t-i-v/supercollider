(
  p=ProxySpace.push(s.reboot);
  e=ProxySubmix.new(\filter);
);

// aaa synth ///////////////////////////////////////

(
~aaa.quant=2;
~aaa.fadeTime=0.1;
~aaa={
  var sig = LFSaw.ar(LFDNoise0.kr(4*(1..8)).exprange(430.1,432*pi));
  var detect = Decay.ar(Changed.ar(sig,0.98),0.0025+LFSaw.ar(1/4/fib(8)).exprange(0.00001,0.1));
  sig = sig + LFSaw.ar(90*[1,2,1.5,4],mul:0.01) * detect;
  sig = RLPF.ar(sig,800*(detect)+40);
  sig = Resonz.ar(sig,LFTri.ar(1/4/fib(8)).exprange(100.001,10000));
  sig = GVerb.ar(sig/4,[4,10])+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2).clip;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~aaa,postVol:true);
~aaa.play;
);
~aaa.stop(7);
