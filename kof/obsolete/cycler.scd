
(
  p=ProxySpace.push(s.reboot);
  m=ProxySubmix.new(\filter);
);

// one synth ///////////////////////////////////////

(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.5,432/1.25,4320/1.25,432/1.5]*0.75);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,16,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);
~one.stop(15);


// multipass filter ///////////////////////////////////////

(
~multipass.quant=2;
~multipass.fadeTime=2;
~multipass={
  var high,mid,low;
  var sig = m.ar;
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  sig = GVerb.ar(sig,10);
    Splay.ar(sig,0.15,0.3);
};
~multipass.play;
);
~multipass.stop(15);

History.end;


