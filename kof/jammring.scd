(
  p=ProxySpace.push(s.reboot);
  e=ProxySubmix.new(\filter);
);



// www synth ///////////////////////////////////////

(
~www.quant=2;
~www.fadeTime=5;
~www={
  var sig = HPF.ar(WhiteNoise.ar(0.2!2),[12000,8000]);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.2);
  sig = sig + (SinOsc.ar(70,mul:0.12)*Pulse.ar(2));
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.35);
};
e.addMix(~www,postVol:true);
~www.play;
);
~www.stop(7);

// lalala synth ///////////////////////////////////////

(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var tempo = 1/8;
  var sig = SinOsc.ar(70!2,mul:0.9) ;
  sig = sig * LFSaw.ar(tempo).exprange(0.001,1);
  sig = sig + (SinOsc.ar(1000*TRand.ar(1,10,Impulse.ar(1/4)).round(2)+(1..10),mul:0.4)*Decay.ar(TDelay.ar(Impulse.ar(tempo,-0.5),1/(1..10)),0.1));
  sig = sig + ([]++PinkNoise.ar(0.1)++HPF.ar(WhiteNoise.ar(0.1),15000)*Decay.ar(Impulse.ar(tempo,[-0.5,0]),1/2));
  sig = sig + (VarSaw.ar(50,SinOsc.kr(1/4).range(-pi,8pi),mul:0.05)*LFSaw.ar(tempo).exprange(0.001,1));
  Splay.ar(sig.flat.distort,0.25,0.175);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);
~lalala.stop(7);



// hiss synth ///////////////////////////////////////

(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = SinOsc.ar(([72,63,60-7,65]).midicps*2/([1,1.25,1.5,0.25]*pi));
  sig = sig * LFSaw.ar(1/4/[1,2,4,8]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.35);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);
~hiss.stop(7);

// fil filter ///////////////////////////////////////

(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = sig + (CombN.ar(sig,0.5,LFDNoise1.ar(1!2).exprange(0.0001,0.1),0.5) * LFDNoise0.ar(1/4!2).exprange(0.001,0.5) );
 // sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,120),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,2000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/3,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.125);
};
~fil.play;
);
~fil.stop(7);
