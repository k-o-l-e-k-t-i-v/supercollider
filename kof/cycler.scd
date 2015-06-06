
(
  p=ProxySpace.push(s.reboot);
  m=ProxySubmix.new(\filter);
);

// one synth ///////////////////////////////////////

(
  ~one.quant=2;
  ~one.fadeTime=2;
  ~one={
    var sig = LFSaw.ar([50,5000,15000]);
    sig = LPF.ar(sig * LFSaw.ar(2/[4,1,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/8,16,CoinGate.ar(0.15,Impulse.ar(8)))).softclip,400,mul:0.15);
    sig = GVerb.ar(sig,10,mul:0.1) + sig;
    sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);
~one.stop(7);


History.end;
