// History, as it was on Sat Jun  6 18:31:42 2015.

[
[ 0, 'me', "(
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
);" ],
[ 20.520711951, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.25,432/1.25,4320/1.25,432/1.5]*0.75);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,16,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 27.849321997, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.25,432/1.5,4320/1.25,432/1.5]*0.75);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,16,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 31.11189252, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.25,432/1.5,4320*1.25,432/1.5]*0.75);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,16,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 39.066347845, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.25,432/1.5,4320*1.25,432/1.25]*0.75);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,16,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 44.101276964, 'me', "(
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.25,432/1.5,4320*1.25,432/1.25]*1);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,16,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 44.661110669, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.25,432/1.5,4320*1.25,432/1.25]*1);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,16,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 52.05767315, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.25,432/1.5,4320*1.25,432/1.25]*1);
      sig = LPF.ar(sig * LFSaw.ar(1/4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,16,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 59.511712261, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.25,432/1.5,4320*1.25,432/1.25]*1.25);
      sig = LPF.ar(sig * LFSaw.ar(1/4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,16,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 67.145066027, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.25,432/1.5,4320*1.25,432/1.5]*1.25);
      sig = LPF.ar(sig * LFSaw.ar(1/4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,16,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 70.488632718, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.5,432/1.25,4320*1.25,432/1.5]*1.25);
      sig = LPF.ar(sig * LFSaw.ar(1/4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,16,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 78.514359486, 'me', "(
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
    Splay.ar(sig,0.15,0.13);
};
~multipass.play;
);" ],
[ 89.146558133, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([1000/1.5,432/1.25,4320*1.25,432/1.5]*1.25);
      sig = LPF.ar(sig * LFSaw.ar(1/4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,16,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 93.560344042, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([1000/1.25,432/1.25,4320*1.25,432/1.5]*1.25);
      sig = LPF.ar(sig * LFSaw.ar(1/4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,16,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 98.826927361, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([1000/1.25,432/1.5,4320*1.25,432/1.5]*1.25);
      sig = LPF.ar(sig * LFSaw.ar(1/4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,16,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 102.703995694, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([1000/1.25,432/1.5,4320*1.5,432/1.5]*1.25);
      sig = LPF.ar(sig * LFSaw.ar(1/4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,16,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 105.72002218, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([1000/1.25,432/1.5,4320*1.5,432/1.5]*1.5);
      sig = LPF.ar(sig * LFSaw.ar(1/4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,16,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 110.377566385, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([1000/1.25,432/1.5,4320*1.5,432/1.5]*1);
      sig = LPF.ar(sig * LFSaw.ar(1/4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,16,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 113.004381003, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([1000/1.25,432/1.5,432*1.5,432/1.5]*1);
      sig = LPF.ar(sig * LFSaw.ar(1/4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,16,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 117.514553898, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([1000/1.25,4320/1.5,432*1.5,432/1.5]*1);
      sig = LPF.ar(sig * LFSaw.ar(1/4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,16,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 119.58848997, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.25,4320/1.5,432*1.5,432/1.5]*1);
      sig = LPF.ar(sig * LFSaw.ar(1/4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,16,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 123.498393074, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.5,4320/1.5,432*1.5,432/1.5]*1);
      sig = LPF.ar(sig * LFSaw.ar(1/4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,16,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 126.892595448, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.5,4320/1.5,432*1.25,432/1.5]*1);
      sig = LPF.ar(sig * LFSaw.ar(1/4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,16,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 149.552715079, 'me', "(
~multipass.quant=2;
~multipass.fadeTime=8;
~multipass={
  var high,mid,low;
  var sig = m.ar;
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,4200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  sig = GVerb.ar(sig,10);
    Splay.ar(sig,0.15,0.13);
};
~multipass.play;
);" ],
[ 164.759523583, 'me', "(
~multipass.quant=2;
~multipass.fadeTime=8;
~multipass={
  var high,mid,low;
  var sig = m.ar;
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,4200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
    sig = GVerb.ar(sig,10+((1..8)/10));
    Splay.ar(sig,0.15,0.13);
};
~multipass.play;
);" ],
[ 173.095138509, 'me', "(
~multipass.quant=2;
~multipass.fadeTime=8;
~multipass={
  var high,mid,low;
  var sig = m.ar;
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,4200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
    sig = GVerb.ar(sig,10+((1..8)/10));
    Splay.ar(sig.flat,0.15,0.13);
};
~multipass.play;
);" ],
[ 177.502465506, 'me', "(
~multipass.quant=2;
~multipass.fadeTime=8;
~multipass={
  var high,mid,low;
  var sig = m.ar;
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,6200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
    sig = GVerb.ar(sig,10+((1..8)/10));
    Splay.ar(sig.flat,0.15,0.13);
};
~multipass.play;
);" ],
[ 183.826605413, 'me', "(
~multipass.quant=2;
~multipass.fadeTime=8;
~multipass={
  var high,mid,low;
  var sig = m.ar;
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,6200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
    sig = GVerb.ar(sig,10+((1..8)/10));
    Splay.ar(sig.flat,0.15,0.23);
};
~multipass.play;
);" ],
[ 196.248143606, 'me', "(
~multipass.quant=2;
~multipass.fadeTime=8;
~multipass={
  var high,mid,low;
  var sig = m.ar;
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,6200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
    sig = GVerb.ar(sig,10+((1..8)/10));
    Splay.ar(sig,0.15,0.23);
};
~multipass.play;
);" ],
[ 225.529719591, 'me', "(
~multipass.quant=2;
~multipass.fadeTime=8;
~multipass={
  var high,mid,low;
  var sig = m.ar;
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,6200),4/3,1/2,1/2);
    sig = Resonz.ar(high+mid+low,LFSaw.ar(1/4/fib(4)).exprange(110.001,11111)).flat;
    sig = GVerb.ar(sig,10+((1..8)/10));
    Splay.ar(sig,0.15,0.23);
};
~multipass.play;
);" ],
[ 242.334313374, 'me', "(
~multipass.quant=2;
~multipass.fadeTime=8;
~multipass={
  var high,mid,low;
  var sig = m.ar;
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,6200),4/3,1/2,1/2);
    sig = Resonz.ar(high+mid+low,LFSaw.ar(1/4/fib(4)).exprange(110.001,11111)).flat;
    sig = GVerb.ar(sig,10+((1..8)/10));
    Splay.ar(sig,0.15,0.3);
};
~multipass.play;
);" ],
[ 253.744895405, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.25,4320/1.5,432*1.25,432/1.5]*1);
      sig = LPF.ar(sig * LFSaw.ar(1/4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,16,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 258.565743033, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.25,4320/1.5,432*1.5,432/1.5]*1);
      sig = LPF.ar(sig * LFSaw.ar(1/4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,16,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 261.138666081, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.25,4320/1.5,432*1.5,432/1.5]*1.5);
      sig = LPF.ar(sig * LFSaw.ar(1/4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,16,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 266.153858391, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.25,4320/1.5,432*1.5,432/1.5]*2);
      sig = LPF.ar(sig * LFSaw.ar(1/4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,16,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 275.038703627, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.25,4320/1.5,432*1.5,432/1.5]*1.25);
      sig = LPF.ar(sig * LFSaw.ar(1/4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,16,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 281.396202178, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.25,4320/1.5,432*1.5,432/1.5]*0.75);
      sig = LPF.ar(sig * LFSaw.ar(1/4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,16,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 290.285848398, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.25,4320/1.5,432*1.5,432/1.5]*0.75);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,160,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 301.100951757, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.25,4320/1.5,432*1.5,432/1.5]*0.75);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 312.37266218, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.25,4320/1.5,432*1.5,432/1.5]*0.75);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.65);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 315.686946452, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.5,4320/1.5,432*1.5,432/1.5]*0.75);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.65);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 322.468094825, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.5,4320/1.5,432*1.25,432/1.25]*0.75);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.65);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 330.826887433, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.5,4320/1.5,432*1.25,432/1.25]*1.5);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.65);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 334.108690719, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.5,4320/1.5,432*1.25,432/1.25]*1.5);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.75);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 343.068902973, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.5,4320/4,432*1.25,432/1.25]*1.5);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.75);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 348.243805667, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.5,4320/4,432*1.5,432/1.25]*1.5);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.75);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 354.22298927, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.5,4320/4,432*1.5,432/4]*1.5);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.75);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 358.823273246, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.25,4320/4,432*1.5,432/4]*1.5);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.75);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 372.814539044, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.25,4320/4,432*1.5,432/4]*1.5);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,800,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.75);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 404.51512209, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.25,4320/4,432*1.5,432/4]*1.5);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,800,mul:0.15);
      sig = sig + (Pulse.ar(1/4) * BrownNoise.ar(0.2!2));
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.75);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 418.478968886, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.25,4320/4,432*1.5,432/4]*1.5);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,800,mul:0.15);
      sig = sig + (Pulse.ar(1/4) * BrownNoise.ar(0.2!2,mul:0.5));
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.75);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 433.204756223, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.25,4320/4,432*1.5,432/4]*1.5);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,800,mul:0.15);
      sig = sig + (Pulse.ar(1/4) * BrownNoise.ar(0.2!2,mul:0.25));
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.75);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 438.377662147, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.25,4320/4,432*1.5,432/4]*1.5);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,800,mul:0.15);
      sig = sig + (Pulse.ar(1/4) * BrownNoise.ar(0.1!2,mul:0.25));
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.75);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 444.796492173, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.25,4320/4,432*1.5,432/4]*1.5);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,800,mul:0.15);
      sig = sig + (Pulse.ar(1/4) * BrownNoise.ar(0.01!2));
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.75);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 453.282333334, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.25,4320/4,432*1.5,432/4]*1.5);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,800,mul:0.15);
      sig = sig + (Pulse.ar(1/4/fib(8)) * BrownNoise.ar(0.01!2));
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.75);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 462.141863608, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.25,4320/4,432*1.5,432/4]*1.5);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,800,mul:0.15);
      sig = sig + (Pulse.ar(1/4/fib(8)) * BrownNoise.ar(0.02!2));
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.75);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 475.604820105, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.25,4320/4,432*1.5,432/4]*1.25);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,800,mul:0.15);
      sig = sig + (Pulse.ar(1/4/fib(8)) * BrownNoise.ar(0.02!2));
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.75);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 485.84919083, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.25,4320/4,432*1.5,432/4]*1);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,800,mul:0.15);
      sig = sig + (Pulse.ar(1/4/fib(8)) * BrownNoise.ar(0.02!2));
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.75);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 490.279918941, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.25,4320/4,432*1.25,432/2]*1);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,800,mul:0.15);
      sig = sig + (Pulse.ar(1/4/fib(8)) * BrownNoise.ar(0.02!2));
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.75);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 498.572968155, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.25,4320/2,432*1.25,432/2]*1);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,800,mul:0.15);
      sig = sig + (Pulse.ar(1/4/fib(8)) * BrownNoise.ar(0.02!2));
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.75);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 502.46710932, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.5,4320/2,432*1.25,432/2]*1);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,800,mul:0.15);
      sig = sig + (Pulse.ar(1/4/fib(8)) * BrownNoise.ar(0.02!2));
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.75);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 511.81175999, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.5,4320/2,432*1.25,432/2]*1);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),800,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,800,mul:0.15);
      sig = sig + (Pulse.ar(1/4/fib(8)) * BrownNoise.ar(0.02!2));
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.75);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 524.074927524, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.5,4320/2,432*1.25,432/2]*1);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),800,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,1800,mul:0.15);
      sig = sig + (Pulse.ar(1/4/fib(8)) * BrownNoise.ar(0.02!2));
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.75);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 528.754123793, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.5,4320/2,432*1.25,432/2]*1);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),800,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,1800,mul:0.15);
      sig = sig + (Pulse.ar(1/2/fib(8)) * BrownNoise.ar(0.02!2));
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.75);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 546.50984589, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.5,4320/2,432*1.25,432/2]*1);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),800,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,1800,mul:0.15);
      sig = sig + (Pulse.ar(1/fib(8)) * BrownNoise.ar(0.03!2));
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.75);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 573.775026095, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.5,4320/2,432*1.25,432/2]*1);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),800,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,1800,mul:0.15);
      sig = sig + (Pulse.ar(1/fib(8)) * SinOsc.ar(75,mul:0.5));
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.75);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 583.732962853, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.5,4320/2,432*1.25,432/2]*1);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),800,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,1800,mul:0.15);
      sig = sig + (Pulse.ar(1/4/fib(8)) * SinOsc.ar(75,mul:0.5));
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.75);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 590.362707283, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.5,4320/2,432*1.25,432/2]*1);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),800,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,1800,mul:0.15);
      sig = sig + (Pulse.ar(1/3/fib(8)) * SinOsc.ar(75,mul:0.5));
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.75);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 593.796463719, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.5,4320/2,432*1.25,432/2]*1);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),800,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,1800,mul:0.15);
      sig = sig + (Pulse.ar(7/fib(8)) * SinOsc.ar(75,mul:0.5));
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.75);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 597.924124347, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.5,4320/2,432*1.25,432/2]*1);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),800,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,1800,mul:0.15);
      sig = sig + (Pulse.ar(8/fib(8)) * SinOsc.ar(75,mul:0.5));
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.75);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 600.364727706, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.5,4320/2,432*1.25,432/2]*1);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),800,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,1800,mul:0.15);
      sig = sig + (Pulse.ar(9/fib(8)) * SinOsc.ar(75,mul:0.5));
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.75);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 602.430223545, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.5,4320/2,432*1.25,432/2]*1);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),800,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,1800,mul:0.15);
      sig = sig + (Pulse.ar(5/fib(8)) * SinOsc.ar(75,mul:0.5));
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.75);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 604.270995703, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.5,4320/2,432*1.25,432/2]*1);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),800,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,1800,mul:0.15);
      sig = sig + (Pulse.ar(4/fib(8)) * SinOsc.ar(75,mul:0.5));
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.75);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 605.676361721, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.5,4320/2,432*1.25,432/2]*1);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),800,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,1800,mul:0.15);
      sig = sig + (Pulse.ar(3/fib(8)) * SinOsc.ar(75,mul:0.5));
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.75);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 608.433399615, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.5,4320/2,432*1.25,432/2]*1);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),800,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,1800,mul:0.15);
      sig = sig + (Pulse.ar(70/fib(8)) * SinOsc.ar(75,mul:0.5));
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.75);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 612.179769473, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.5,4320/2,432*1.25,432/2]*1);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),800,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,1800,mul:0.15);
      sig = sig + (Pulse.ar(72/fib(8)) * SinOsc.ar(75,mul:0.5));
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.75);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 614.305232818, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.5,4320/2,432*1.25,432/2]*1);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),800,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,1800,mul:0.15);
      sig = sig + (Pulse.ar(2/fib(8)) * SinOsc.ar(75,mul:0.5));
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.75);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 618.727220076, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.5,4320/2,432*1.25,432/2]*1);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),800,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,1800,mul:0.15);
     // sig = sig + (Pulse.ar(2/fib(8)) * SinOsc.ar(75,mul:0.5));
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.75);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 628.889295245, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.25,4320/2,432*1.25,432/2]*1);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),800,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,1800,mul:0.15);
     // sig = sig + (Pulse.ar(2/fib(8)) * SinOsc.ar(75,mul:0.5));
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.75);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 639.983823756, 'me', "(
~noise={
	var mel;
	var freq = LFSaw.ar(1/9/fib(12)).range(50,1500);
	var abc = PinkNoise.ar(1!12) + SinOsc.ar(44*[1,1,1.5,1.24],mul:SinOsc.kr(1/24/[1,3,6,9]).exprange(0.1,0.4))/2;
	abc = abc * LFTri.kr(1/8/fib(12)).exprange(0.0001,1);
	abc = CombN.ar(abc,0.1,1,8);
	abc = DFM1.ar(abc,freq,LFTri.ar(1/12/fib(12)).range(0.0001,1),1,[0,1])/[1,2];
	mel = BPF.ar(PitchShift.ar(abc,0.2,LFDNoise0.ar(4/fib(8)).range(1.5001,2)),LFDNoise0.ar(2/fib(8)).range(200,900),2);
	abc = Mix(abc)/8 + (Mix(mel)/20);

	abc = Pan2.ar(abc,SinOsc.ar(1/7,fib(12)));
	abc = LPF.ar(GVerb.ar(abc,100,12,0.2,0.2,32),SinOsc.ar(1/24/fib(8)).range(90,550))+(abc/1.2);
	abc = HPF.ar(abc,20);

	Splay.ar(abc.flat,0.125);
};
~noise.play;
)" ],
[ 645.246676265, 'me', "(
~noise={
	var mel;
	var freq = LFSaw.ar(1/9/fib(12)).range(50,1500);
	var abc = PinkNoise.ar(1!12) + SinOsc.ar(44*[1,1,1.5,1.24],mul:SinOsc.kr(1/24/[1,3,6,9]).exprange(0.1,0.4))/2;
	abc = abc * LFTri.kr(1/8/fib(12)).exprange(0.0001,1);
	abc = CombN.ar(abc,0.1,1,8);
	abc = DFM1.ar(abc,freq,LFTri.ar(1/12/fib(12)).range(0.0001,1),1,[0,1])/[1,2];
	mel = BPF.ar(PitchShift.ar(abc,0.2,LFDNoise0.ar(4/fib(8)).range(1.5001,2)),LFDNoise0.ar(2/fib(8)).range(200,900),2);
	abc = Mix(abc)/8 + (Mix(mel)/20);

	abc = Pan2.ar(abc,SinOsc.ar(1/7,fib(12)));
	abc = LPF.ar(GVerb.ar(abc,100,12,0.2,0.2,32),SinOsc.ar(1/24/fib(8)).range(90,550))+(abc/1.2);
	abc = HPF.ar(abc,20);

	Splay.ar(abc.flat,0.0125);
};
~noise.play;
)" ],
[ 664.268202945, 'me', "~one.stop(15);" ],
[ 670.91227276, 'me', "~noise.stop(10)" ],
[ 676.47374151, 'me', "~multipass.stop(15);" ],
];