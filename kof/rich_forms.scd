
// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=4;
~one={
  var f,sig;
  f = TChoose.kr(Impulse.ar(1/4/(1..16)),[60,65,67,72,36].midicps);
  10.do{
  f = f/{TChoose.kr(Impulse.kr(1/4/(1..16)),[1,2,1.333333,1/2,1/1.333333])};
};
  sig = Formant.ar(f,f,LFTri.ar(1/4/(1..16)).range(50,5000)) * (LFTri.ar(1/4/(1..16))**4);
  
  //sig = Pulse.ar(8/(1..16)) * sig;
  sig = MoogFF.ar(sig,f*2,2.85);
  sig = CompanderD.ar(sig,3/4,1/2,1/2);
  Splay.ar(sig,0.995,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


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
  sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/2,1/2,0.002,0.3);
  sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),4000),2000);
  Splay.ar(sig,0.75,0.05);
};
~ff.play;
);
~ff.stop(7);
~ff.clear;
