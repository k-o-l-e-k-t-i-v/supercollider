




// pulsar synth ///////////////////////////////////////

(
~pulsar.ar(2);
~pulsar.quant=2;
~pulsar.fadeTime=4;
~pulsar={
  var mod2 = Duty.kr([8,1]*8,0,Dseq([1,2,1.5,4],inf));
  var mod = Duty.kr([4,2]*4,0,Dseq([1,2,1.5,1.3333],inf)).lag(1/40);
  var sig = LFSaw.ar(1/4/[1,2,3,4]) ** 5 * LFSaw.ar(50/[1,2]/8/mod,mul:0.2);
  
  sig = CombN.ar(sig,1/50/[1,2,4,2]*mod/mod2,1/250/[1,2,4,1]/mod/mod2,LFSaw.ar(1/13/[1,2,3,4])**2*1);
  sig = CompanderD.ar(sig,LFSaw.ar(1/16/[1,2,3,4]).range(0.1,0.9),LFSaw.ar(1/4/[1,2,3,4]).range(1,1/90),1/3);
  sig = Normalizer.ar(sig);
  
  sig = sig * LFTri.ar(1/4/[1,2,3,4]) ;

  sig = LPF.ar(sig,2000);
  sig = CompanderD.ar(sig,3/4,1,1/5);
  

  Splay.ar(sig,0.85,0.15);
};
~pulsar.play;
);
~pulsar.stop(4);
~pulsar.clear;
~pulsar.pause;
~pulsar.resume;

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
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/15!2).range(100,1800)),3/4,1,1/4);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/16!2).range(700,10000),2),3/4,1,1/3);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/15!2).range(1000,12000)),3/4,1,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1,1/2,0.002,0.3);
  sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),[4000,5000]),2000);
  Splay.ar(sig,0.95,0.65);
};
~ff.play;
);
~ff.stop(7);
~ff.clear;
