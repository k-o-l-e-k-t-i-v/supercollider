


// ooo synth ///////////////////////////////////////

(
~ooo.ar(2);
~ooo.quant=2;
~ooo.fadeTime=4;
~ooo={
  var sig,mod,t;
  mod = Duty.kr(8,0,Dseq([1,2,1.5,1.3333,0.5,0.75],inf));
  t = LFTri.ar([2/[1,2,3],50/mod,1/4/[4,3,2]]) ** LFNoise2.kr(1/16!3);
  t = CombC.ar(t,1/5000,1/2,4);
  sig = Perlin3.ar(t[0],t[1],t[2]);
  sig = RLPF.ar(sig,[251,50,1010,750]/mod,LFNoise2.kr(1/16!4).range(0.01,0.2)) * 1.5 + (Resonz.ar(sig,LFNoise2.kr(1/16!3).range(50,15000)/mod,0.12)**LFNoise2.kr(1/4!4).range(0.2,0.9));
  sig = CompanderD.ar(sig,3/4,1/3,1);
  sig = AllpassN.ar(sig,1/50,1/4,1);
  Splay.ar(sig,0.5,0.15);
};
~ooo.play;
);
~ooo.stop(4);
~ooo.clear;
~ooo.pause;
~ooo.resume;

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
  low = CompanderD.ar(RLPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/2,1/2);
  high = CompanderD.ar(RHPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/2,1/2,0.002,0.3);
  sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),4000),2000);
  Splay.ar(sig,0.75,0.25);
};
~ff.play;
);
~ff.stop(7);
~ff.clear;
