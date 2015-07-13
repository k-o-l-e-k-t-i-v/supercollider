(
  p=ProxySpace.push(s.reboot);
  e=ProxySubmix.new(\filter);
);

// imp1 synth ///////////////////////////////////////

(
~imp1.quant=1;
~imp1.fadeTime=0.02;
~imp1={
  var sig = Impulse.ar(1.1666/fib(8),(1..3)/4);
  sig = RLPF.ar(sig*10,[100,50],0.2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~imp1,postVol:true);
~imp1.play;
);
~imp1.mold(4);
~imp1.stop(7);
~imp1.clear;

// hiss synth ///////////////////////////////////////

(
~hiss.quant=1;
~hiss.fadeTime=0.02;
~hiss={
  var sig = PinkNoise.ar(0.00001!2);
  sig = LPF.ar(sig,LFSaw.ar(1/4).exprange(100.001,10000));
  Splay.ar(sig.flat,0.25,0.005);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);
~hiss.stop(7);
~hiss.clear;

// ads filter ///////////////////////////////////////

(
~ads.quant=1;
~ads.fadeTime=1.02;
~ads={
  var high,mid,low;
  var sig = e.ar;
  sig = RLPF.ar(sig*20,(1..8)*100,0.2);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/(4*LFSaw.ar(1/16).exprange(0.001,1)),1/2)/2;
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,4200),4/3,1/4,1/2);
  sig = GVerb.ar(sig,10);
  sig = CompanderD.ar((high+mid+low).flat.clip,4/3,1/2,1/2);
  Splay.ar(sig,0.25,0.2);
};
~ads.play;
);
~ads.stop(7);
