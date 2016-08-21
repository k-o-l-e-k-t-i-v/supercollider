

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=4;
~one={
    var t = LFSaw.ar([8,1/32,1/16]);
    var n = Perlin3.ar([t[0],t[1],t[2]]);
  var sig = LFPulse.ar(1/4/[4,3,2,1]) + LocalIn.ar(2);
  var f = NumChannels.ar(n.range(50.01,16025),2);
  sig = DFM1.ar(sig,f,LFSaw.ar(4/[1,2,3,4]).exprange(0.12,0.99));
  sig = MoogFF.ar(sig,f*2,0.06+LFSaw.ar(1/8/[1,2,3,4]).exprange(0.001,2.5));
  //sig = LPF.ar(sig,f*2);
  sig = LeakDC.ar(sig);
  LocalOut.ar(DelayN.ar(NumChannels.ar(Normalizer.ar(sig)/4,2),1/f,1/f));
  //sig = LPF.ar(sig,4600);
  Splay.ar(sig,0.95,0.25);
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
  //sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/2,1/2,0.002,0.3);
  sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),[4000,4010]),4000);
  Splay.ar(sig,SinOsc.ar(1/5).range(0.1,0.99),0.15);
};
~ff.play;
);
~ff.stop(7);
~ff.clear;


DFM1.help
