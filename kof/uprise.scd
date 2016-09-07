




// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=120;
~one={
  var sig = SinOsc.ar(835) * Pulse.ar(4/[1,2,3,4]);
  sig = sig + (LFSaw.ar([83.65,83.6]/[1.33333333,1,2,1],mul:0.18) * LFSaw.ar(1/4/[1,2,3,4]));
  sig = CompanderD.ar(sig,3/4,1,1/2,0.002,0.3);
  Splay.ar(sig,0.95,0.45);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

(~one.stop(120);~ff.stop(120););

// ff filter ///////////////////////////////////////

(
~ff.quant=1;
~ff.fadeTime=120;
~ff={
  var synths = p.playingProxies;
  var high,mid,low;
  var sig = [];
  synths.collect{|n| if(n!=\ff){sig=sig++p.[n.asSymbol];}};

  //sig = Resonz.ar(sig,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
  sig = CombN.ar(sig,1/83.5002,1/83.5001,16)+sig;
  //sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1,1/2);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,2000)),3/4,1,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1,1/2,0.002,0.3);
  sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),[4000,4010]),2000);
  Splay.ar(sig,0.95,0.35);
};
~ff.play;
);
~ff.stop(7);
~ff.clear;
