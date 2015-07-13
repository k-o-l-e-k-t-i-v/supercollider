



(
  p=ProxySpace.push(s.reboot);
  e=ProxySubmix.new(\filter);
);


// aaa synth ///////////////////////////////////////

(
~aaa.quant=1;
~aaa.fadeTime=0.02;
~aaa={
  var sig = Impulse.ar(8/(1..4));
  sig = RLPF.ar(sig,[77,88,99,100],0.25) * Decay.ar(sig,0.2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~aaa,postVol:true);
~aaa.play;
);
~aaa.stop(7);
~aaa.clear;



// aaaa filter ///////////////////////////////////////

(
~aaaa.quant=1;
~aaaa.fadeTime=0.02;
~aaaa={
  var high,mid,low;
  var sig = e.ar;
  //sig = GVerb.ar(sig,100)/4+sig;
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/(2+(LFPulse.ar(1/4)*2).lag(2)),1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/(2+(LFPulse.ar(1/16)*2).lag(2)) ,1/2);
  sig = CompanderD.ar((high+mid+low).flat.clip,4/3,1/2,1/2);
  Splay.ar(sig,0.25,0.2);
};
~aaaa.play;
);
~aaaa.stop(7);
