



// olne synth ///////////////////////////////////////

(
~olne.ar(2);
~olne.quant=2;
~olne.fadeTime=4;
~olne={
  var sig = (WhiteNoise.ar(0.65!2) * Pulse.ar(4/[1,2])) + LocalIn.ar(2);
  var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.3333,1/4,1/8],inf));
  sig = LPF.ar(sig,500/mod);
  sig = DelayN.ar(sig,1/1500,1/1500*mod+SinOsc.ar(1/[3,4]).range(-0.01,0.01));
  LocalOut.ar(Normalizer.ar(sig)/1.1);
  Splay.ar(sig,0.95,0.95);
};
~olne.play;
);
~olne.stop(4);
~olne.clear;
~olne.pause;
~olne.resume;

// ff filter ///////////////////////////////////////

(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var synths = p.playingProxies;
  var high,mid,low;
  var sig = [];
  synths.collect{|n| if(n!=\ff){sig=sig++p.[n.asSymbol];}};

  //sig = Resonz.ar(sig,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
  //sig = CombN.ar(sig,4,[4,8,16],32)+sig;
  //sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/2.5,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/2,1/2,0.002,0.3);
  sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),[4000,4010]),2000);
  Splay.ar(sig,0.75,0.15);
};
~ff.play;
);
~ff.stop(7);
~ff.clear;
