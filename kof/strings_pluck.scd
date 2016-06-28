



// diusss synth ///////////////////////////////////////

(
~diusss.ar(2);
~diusss.quant=2;
~diusss.fadeTime=10;
~diusss={
  var mod = TChoose.kr(Impulse.kr(1/64/[1,2,3]),[1,0.5,0.25,1.5]);
  var sig = Impulse.ar(4 / (1..60).nthPrime);
  var o = TChoose.kr(Impulse.kr(1/8/[1,2,3]),(2..6).octcps*mod);
  var f = 1/TChoose.kr(Impulse.kr(1/16/[1,2,3]),o/[1,1.5,1.33333,2,0.5]);
  var t = LFTri.ar([1/1600,1/2,1/f]) ** 2 * 4 + LFSaw.ar(1/44/[1,2,3],mul:10);
  var ns = Perlin3.ar(t[0],t[1],t[2]);
  sig = Pluck.ar(ns,sig,f*1.01,f,4/[1,2,3,4],LFSaw.kr(1/16/[1,2,3,4]).range(0.03,0.9));
  sig = sig * (LFNoise2.kr(1/(1..60).nthPrime));
  sig = LeakDC.ar(sig);
  Splay.ar(sig,0.05,0.85);
};
~diusss.play;
);
~diusss.stop(4);
~diusss.clear;
~diusss.pause;
~diusss.resume;

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
  //sig = CombN.ar(sig,1,1,4)+sig;
  sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
  low = CompanderD.ar(RLPF.ar(sig,LFNoise2.kr(1/12!2).range(100,1800),0.2),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/12!2).range(700,1500),2),3/4,1/2,1/2);
  high = CompanderD.ar(RHPF.ar(sig,LFNoise2.kr(1/12!2).range(1000,12000),0.2),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/2,1/2,0.002,0.3);
  sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),4000),2000);
  Splay.ar(sig,0.15,0.15);
};
~ff.play;
);
~ff.stop(7);
~ff.clear;


