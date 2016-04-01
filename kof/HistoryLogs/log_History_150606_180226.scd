// History, as it was on Sat Jun  6 18:02:26 2015.

[
[ 0, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=2;
  ~one={
    var sig = LFSaw.ar([50,5000,15000]);
    sig = LPF.ar(sig * LFSaw.ar(2/[4,1,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,32,CoinGate.ar(0.15,Impulse.ar(8)))).softclip,400,mul:0.15);
    sig = GVerb.ar(sig,10,mul:0.1) + sig;
    sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 56.662442452, 'me', "thisProcess.stop;" ],
[ 153.689211632, 'me', "(
  p=ProxySpace.push(s.reboot);
  m=ProxySubmix.new(\\filter);
);" ],
[ 156.986015736, 'me', "(
~abc.quant=2;
~abc.fadeTime=2;
~abc={
  var high,mid,low;
  var sig = m.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.1);
};
~abc.play;
);" ],
[ 159.171247067, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=2;
  ~one={
    var sig = LFSaw.ar([50,5000,15000]);
    sig = LPF.ar(sig * LFSaw.ar(2/[4,1,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,32,CoinGate.ar(0.15,Impulse.ar(8)))).softclip,400,mul:0.15);
    sig = GVerb.ar(sig,10,mul:0.1) + sig;
    sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 177.595344254, 'me', "(
~abc.quant=2;
~abc.fadeTime=2;
~abc={
  var high,mid,low;
  var sig = m.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/1.5,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/1.25,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.1);
};
~abc.play;
);" ],
[ 181.818745327, 'me', "(
~abc.quant=2;
~abc.fadeTime=2;
~abc={
  var high,mid,low;
  var sig = m.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/1.5,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/3,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.1);
};
~abc.play;
);" ],
[ 190.278235821, 'me', "(
~abc.quant=2;
~abc.fadeTime=2;
~abc={
  var high,mid,low;
  var sig = m.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/0.5,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/3,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.1);
};
~abc.play;
);" ],
[ 199.424811653, 'me', "(
~abc.quant=2;
~abc.fadeTime=2;
~abc={
  var high,mid,low;
  var sig = m.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/4,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/0.5,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/3,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.1);
};
~abc.play;
);" ],
[ 205.786822398, 'me', "(
~abc.quant=2;
~abc.fadeTime=2;
~abc={
  var high,mid,low;
  var sig = m.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/4,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/0.5,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/8,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.1);
};
~abc.play;
);" ],
[ 210.326485648, 'me', "(
~abc.quant=2;
~abc.fadeTime=2;
~abc={
  var high,mid,low;
  var sig = m.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/4,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/0.5,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.1);
};
~abc.play;
);" ],
[ 238.165281841, 'me', "(
~multipass.quant=2;
~multipass.fadeTime=2;
~multipass={
  var high,mid,low;
  var sig = m.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.1);
};
~multipass.play;
);" ],
[ 245.850944161, 'me', "(
~multipass.quant=2;
~multipass.fadeTime=2;
~multipass={
  var high,mid,low;
  var sig = m.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.5);
};
~multipass.play;
);" ],
[ 257.699614563, 'me', "(
~multipass.quant=2;
~multipass.fadeTime=2;
~multipass={
  var high,mid,low;
  var sig = m.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,LFSaw.ar(1/4).exprange(0.001,1));
};
~multipass.play;
);" ],
[ 263.988160531, 'me', "(
~multipass.quant=2;
~multipass.fadeTime=2;
~multipass={
  var high,mid,low;
  var sig = m.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,LFSaw.ar(1/4).exprange(0.001,0.5));
};
~multipass.play;
);" ],
[ 278.197168765, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=2;
  ~one={
    var sig = LFSaw.ar([50,5000,15000]);
    sig = LPF.ar(sig * LFSaw.ar(2/[4,1,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,32,CoinGate.ar(0.15,Impulse.ar(8)))).softclip,400,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 407.398502855, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=2;
  ~one={
    var sig = LFSaw.ar([50,5000,12000]);
    sig = LPF.ar(sig * LFSaw.ar(2/[4,1,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,32,CoinGate.ar(0.15,Impulse.ar(8)))).softclip,400,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 412.161235306, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=2;
  ~one={
    var sig = LFSaw.ar([50,5000,10000]);
    sig = LPF.ar(sig * LFSaw.ar(2/[4,1,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,32,CoinGate.ar(0.15,Impulse.ar(8)))).softclip,400,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 416.178992882, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=2;
  ~one={
    var sig = LFSaw.ar([50,500,10000]);
    sig = LPF.ar(sig * LFSaw.ar(2/[4,1,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,32,CoinGate.ar(0.15,Impulse.ar(8)))).softclip,400,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 438.671932478, 'me', "(
~multipass.quant=2;
~multipass.fadeTime=2;
~multipass={
  var high,mid,low;
  var sig = m.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
    Splay.ar(sig,0.25,LFSaw.ar(1/4/fib(8)).exprange(0.001,0.25));
};
~multipass.play;
);" ],
[ 465.209892293, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=2;
  ~one={
    var sig = LFSaw.ar([50,500,10000]);
    sig = LPF.ar(sig * LFSaw.ar(2/[4,1,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,32,CoinGate.ar(0.15,Impulse.ar(8!8)))).softclip,400,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 473.137518319, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=2;
  ~one={
    var sig = LFSaw.ar([50,500,10000]);
    sig = LPF.ar(sig * LFSaw.ar(2/[4,1,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,32,CoinGate.ar(0.05,Impulse.ar(8!8)))).softclip,400,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 488.316153903, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=2;
  ~one={
    var sig = LFSaw.ar([50,500,10000]);
    sig = LPF.ar(sig * LFSaw.ar(2/[4,1,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.05,Impulse.ar(8!8)))).softclip,400,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 621.769099669, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=2;
  ~one={
    var sig = LFSaw.ar([50,500,10000]*1.5);
    sig = LPF.ar(sig * LFSaw.ar(2/[4,1,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.05,Impulse.ar(8!8)))).softclip,400,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 628.38501342, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = LFSaw.ar([50,500,10000]*1.5);
    sig = LPF.ar(sig * LFSaw.ar(2/[4,1,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.05,Impulse.ar(8!8)))).softclip,400,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 632.227210214, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = LFSaw.ar([50,500,10000]*1.25);
    sig = LPF.ar(sig * LFSaw.ar(2/[4,1,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.05,Impulse.ar(8!8)))).softclip,400,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 639.105364714, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=16;
  ~one={
    var sig = LFSaw.ar([50,500,10000]*1.75);
    sig = LPF.ar(sig * LFSaw.ar(2/[4,1,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.05,Impulse.ar(8!8)))).softclip,400,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 648.808575341, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=16;
  ~one={
    var sig = LFSaw.ar([50,500,10000]*1.25);
    sig = LPF.ar(sig * LFSaw.ar(2/[4,1,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.05,Impulse.ar(8!8)))).softclip,400,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 659.587365012, 'me', "(
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
    Splay.ar(sig,0.15,LFSaw.ar(1/4/fib(8)).exprange(0.001,0.25));
};
~multipass.play;
);" ],
[ 675.968721825, 'me', "(
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
    Splay.ar(sig,0.15,0.1);
};
~multipass.play;
);" ],
[ 682.293128029, 'me', "(
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
    Splay.ar(sig,0.15,0.2);
};
~multipass.play;
);" ],
[ 686.158620653, 'me', "(
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
);" ],
[ 691.843676916, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=16;
  ~one={
    var sig = LFSaw.ar([50,500,10000]*1.5);
    sig = LPF.ar(sig * LFSaw.ar(2/[4,1,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.05,Impulse.ar(8!8)))).softclip,400,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 699.334084937, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=16;
  ~one={
    var sig = LFSaw.ar([100,500,10000]*0.5);
    sig = LPF.ar(sig * LFSaw.ar(2/[4,1,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.05,Impulse.ar(8!8)))).softclip,400,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 708.193649233, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=16;
  ~one={
    var sig = LFSaw.ar([100,500,10000]*0.5);
    sig = LPF.ar(sig * LFSaw.ar(2/[4,1,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(8!8)))).softclip,400,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 710.142949379, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=16;
  ~one={
    var sig = LFSaw.ar([100,500,10000]*0.5);
    sig = LPF.ar(sig * LFSaw.ar(2/[4,1,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!8)))).softclip,400,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 722.376397147, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=16;
  ~one={
    var sig = LFSaw.ar([100,500,10000]*0.5);
    sig = LPF.ar(sig * LFSaw.ar(2/[4,1,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,400,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 729.33244055, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=16;
  ~one={
    var sig = LFSaw.ar([100,500,10000,7500]*0.5);
    sig = LPF.ar(sig * LFSaw.ar(2/[4,1,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,400,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 734.621643308, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=16;
  ~one={
    var sig = LFSaw.ar([100,500,10000,7500]*1.25);
    sig = LPF.ar(sig * LFSaw.ar(2/[4,1,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,400,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 747.865125574, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=16;
  ~one={
    var sig = LFSaw.ar([100,500,1000,7500]*1.25);
    sig = LPF.ar(sig * LFSaw.ar(2/[4,1,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,400,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 753.292349305, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=16;
  ~one={
    var sig = LFSaw.ar([100,500,1000,1500]*1.25);
    sig = LPF.ar(sig * LFSaw.ar(2/[4,1,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,400,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 768.145934372, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=16;
  ~one={
    var sig = LFSaw.ar([100,500,1000,1500]*1.5);
    sig = LPF.ar(sig * LFSaw.ar(4/[4,1,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,400,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 775.842971774, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=16;
  ~one={
    var sig = LFSaw.ar([100,500,1000,1500]*1.25);
    sig = LPF.ar(sig * LFSaw.ar(4/[4,1,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,400,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 781.68678202, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=16;
  ~one={
    var sig = LFSaw.ar([1000,500,1000,1500]*0.25);
    sig = LPF.ar(sig * LFSaw.ar(4/[4,1,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,400,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 788.669424895, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=16;
  ~one={
    var sig = SinOsc.ar([1000,500,1000,1500]*0.25);
    sig = LPF.ar(sig * LFSaw.ar(4/[4,1,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,400,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 810.267150388, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=16;
  ~one={
    var sig = SinOsc.ar([1000,500,1000,1500]*0.25);
    sig = LPF.ar(sig * LFSaw.ar(4/[4,1,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.5,Impulse.ar(1!4)))).softclip,400,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 819.530779585, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=16;
  ~one={
    var sig = SinOsc.ar([1000,500,1000,1500]*0.25);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 831.483154327, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=16;
  ~one={
    var sig = SinOsc.ar([1000,500,1000,1500]*0.25);
    sig = LPF.ar(sig * LFSaw.ar(4/[4,1,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,4000,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 835.99541623, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=16;
  ~one={
    var sig = SinOsc.ar([1000,500,1000,1500]*0.25);
    sig = LPF.ar(sig * LFSaw.ar(4/[4,1,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,400,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 845.702753087, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=16;
  ~one={
    var sig = SinOsc.ar([1000,500,1000,1500]*0.25);
    sig = LPF.ar(sig * LFSaw.ar(8/[4,2,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,400,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 856.365227342, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=16;
  ~one={
    var sig = SinOsc.ar([1000,500,1000,1500]*0.25);
    sig = LPF.ar(sig * LFSaw.ar(8/[4,2,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,800,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 951.670160992, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=16;
  ~one={
    var sig = SinOsc.ar([1000,500,1000,1500]*0.25);
    sig = LPF.ar(sig * LFSaw.ar(8/[4,2,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,1800,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 956.618473449, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([1000,500,1000,1500]*0.25);
    sig = LPF.ar(sig * LFSaw.ar(8/[4,2,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,1800,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 959.951056091, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([1000,500,1000,1500]*0.5);
    sig = LPF.ar(sig * LFSaw.ar(8/[4,2,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,1800,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 969.304711849, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([1000,500,1000,1500]*0.75);
    sig = LPF.ar(sig * LFSaw.ar(8/[4,2,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,1800,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 977.164554338, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([1000,500,1000,1500]*0.85);
    sig = LPF.ar(sig * LFSaw.ar(8/[4,2,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,1800,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 979.892438613, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([1000,500,1000,1500]*0.75);
    sig = LPF.ar(sig * LFSaw.ar(8/[4,2,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,1800,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 983.073854149, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([1000,500,1000,1500]*1.5);
    sig = LPF.ar(sig * LFSaw.ar(8/[4,2,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,1800,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 988.540982996, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([1000,500,1000,150]*1.5);
    sig = LPF.ar(sig * LFSaw.ar(8/[4,2,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,1800,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 990.399591706, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100,500,1000,150]*1.5);
    sig = LPF.ar(sig * LFSaw.ar(8/[4,2,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,1800,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 994.69534485, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100,500,10000,150]*1.5);
    sig = LPF.ar(sig * LFSaw.ar(8/[4,2,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,1800,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 1006.715551439, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100,1500,10000,150]*1.5);
    sig = LPF.ar(sig * LFSaw.ar(8/[4,2,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,1800,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 1011.578056013, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100,1500*1.5,10000,150]*1.5);
    sig = LPF.ar(sig * LFSaw.ar(8/[4,2,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,1800,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 1014.900708467, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100,1500*1.25,10000,150]*1.5);
    sig = LPF.ar(sig * LFSaw.ar(8/[4,2,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,1800,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 1018.672822077, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100,1500*1.25,10000,150]*1.25);
    sig = LPF.ar(sig * LFSaw.ar(8/[4,2,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,1800,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 1033.841152189, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100,1500*1.25,10000,150]*1.25);
    sig = LPF.ar(sig * LFSaw.ar(8/[4,2,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,800,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 1052.770160202, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100,1500*1.25,10000,150]*1.5);
    sig = LPF.ar(sig * LFSaw.ar(8/[4,2,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,800,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 1064.146284265, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100,1500*1.25,10000,150]*1.125);
    sig = LPF.ar(sig * LFSaw.ar(8/[4,2,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,800,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 1069.817681376, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100,1500*1.25,10000,150]*1);
    sig = LPF.ar(sig * LFSaw.ar(8/[4,2,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,800,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 1076.806198456, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100,1500*1.5,10000,150]*1);
    sig = LPF.ar(sig * LFSaw.ar(8/[4,2,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,800,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 1088.458346493, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100,1500,10000,150*1.5]*1);
    sig = LPF.ar(sig * LFSaw.ar(8/[4,2,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,800,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 1093.331427102, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100*1.25,1500,10000,150*1.5]*1);
    sig = LPF.ar(sig * LFSaw.ar(8/[4,2,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,800,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 1095.747970399, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100*1.25,1500,10000*1.5,150*1.5]*1);
    sig = LPF.ar(sig * LFSaw.ar(8/[4,2,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,800,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 1099.689395034, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100*1.25,1500/1.25,10000*1.5,150*1.5]*1);
    sig = LPF.ar(sig * LFSaw.ar(8/[4,2,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,800,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 1102.834126747, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100*1.25,1500/1.25,10000/1.5,150*1.5]*1);
    sig = LPF.ar(sig * LFSaw.ar(8/[4,2,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,800,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 1109.753105763, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100*1.25,1500/1.25,10000/1.5,150/1.5]*1);
    sig = LPF.ar(sig * LFSaw.ar(8/[4,2,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,800,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 1112.94943976, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.25,1500/1.25,10000/1.5,150/1.5]*1);
    sig = LPF.ar(sig * LFSaw.ar(8/[4,2,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,800,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 1122.91405765, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.25,432/1.25,10000/1.5,150/1.5]*1);
    sig = LPF.ar(sig * LFSaw.ar(8/[4,2,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,800,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 1127.971917965, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.25,432/1.25,432/1.5,150/1.5]*1);
    sig = LPF.ar(sig * LFSaw.ar(8/[4,2,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,800,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 1130.372118832, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.25,432/1.25,432/1.5,15000/1.5]*1);
    sig = LPF.ar(sig * LFSaw.ar(8/[4,2,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,800,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 1134.174038867, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([50/1.25,432/1.25,432/1.5,15000/1.5]*1);
    sig = LPF.ar(sig * LFSaw.ar(8/[4,2,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,800,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 1136.892200971, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.25,432/1.25,432/1.5,15000/1.5]*1);
    sig = LPF.ar(sig * LFSaw.ar(8/[4,2,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,800,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 1146.657872331, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.25,432/1.25,432/1.5,15000/1.5]*1);
    sig = LPF.ar(sig * LFSaw.ar(8/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,800,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 1151.542014982, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.25,432/1.25,432/1.5,15000/1.5]*1);
    sig = LPF.ar(sig * LFSaw.ar(8/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 1158.211590189, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.25,432/1.25,432/1.5,15000/1.5]*1);
    sig = LPF.ar(sig * LFSaw.ar(8/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,64,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 1165.816614229, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.25,432/1.25,432/1.5,15000/1.5]*1);
    sig = LPF.ar(sig * LFSaw.ar(8/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,640,CoinGate.ar(0.25,Impulse.ar(1!4)))).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 1204.023809328, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.25,432/1.25,432/1.5,15000/1.5]*1);
      sig = LPF.ar(sig * LFSaw.ar(8/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/4) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 1212.88028088, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.25,432/1.25,432/1.5,15000/1.5]*1);
      sig = LPF.ar(sig * LFSaw.ar(8/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,8,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 1220.23226704, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.25,432/1.25,432/1.5,15000/1.5]*1);
      sig = LPF.ar(sig * LFSaw.ar(8/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,16,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 1227.315822255, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.25,432/1.25,432/1.5,15000/1.5]*1);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,16,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 1231.937474163, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.5,432/1.25,432/1.5,15000/1.5]*1);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,16,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 1235.793054156, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.5,432/1.25,4320/1.25,15000/1.5]*1);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,16,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 1241.789959639, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.5,432/1.25,4320/1.25,432/1.5]*1);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,16,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 1247.64542315, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.5,432/1.25,4320/1.25,432/1.5]*1.5);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,16,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 1254.406582061, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.5,432/1.25,4320/1.25,432/1.5]*1.25);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,16,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 1263.220150512, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.5,432/1.25,4320/1.25,432/1.5]*2);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,16,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 1276.361478548, 'me', "(
  ~one.quant=2;
  ~one.fadeTime=8;
  ~one={
    var sig = SinOsc.ar([100/1.5,432/1.25,4320/1.25,432/1.5]*0.5);
      sig = LPF.ar(sig * LFSaw.ar(4/[4,2,1]).exprange(0.001,1),200,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/32,16,CoinGate.ar(0.25,Impulse.ar(1!4)) ).round(1/8) ).softclip,200,mul:0.15);
    //sig = GVerb.ar(sig,10,mul:0.1) + sig;
    //sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.01,0.5);
  };
  m.addMix(~one,postVol:true);
  ~one.play;
);" ],
[ 1282.966910799, 'me', "(
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
[ 1288.385026906, 'me', "~one.stop(15);" ],
[ 1292.481550928, 'me', "~multipass.stop(15);" ],
];