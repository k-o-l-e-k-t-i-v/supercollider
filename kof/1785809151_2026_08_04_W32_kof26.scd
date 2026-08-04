s.boot;
p=ProxySpace.push();

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=20;
~one.fadeTime=2;
~one={
  var sig = SinOsc.ar([50,60],Pulse.ar(0.432*4));
  Splay.ar(sig,0.5,0.25);
};
~one.play;
);


// all filter ///////////////////////////////////////

(
~all.quant=4;
~all.fadeTime=1;
~all={
  var synths = p.playingProxies;
  var high,mid,low;
  var sig = [];
  synths.collect{|n| if(n!=\all){sig=sig++p.[n.asSymbol];}};

  sig = Resonz.ar(sig,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
  sig = CombN.ar(sig,4,[4,8,16],32)+sig;
  //sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/2,1);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/2,1);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/2,1);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1,1/2,0.002,0.3);
  sig = LPF.ar(GVerb.ar(NumChannels.ar(sig,2),90,3),2000)/2+sig;
  Splay.ar(sig,0.0,0.25);
};
~all.play;
);
~all.stop(7);
~all.clear;

~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

// two synth ///////////////////////////////////////

(
~two.ar(2);
~two.quant=20;
~two.fadeTime=2;
~two={
  var sig = VarSaw.ar(300/(2**([1,5,8]/12+1))) * LFSaw.ar(0.432/[4,2,1]);
  Splay.ar(sig,0.5,0.25);
};
~two.play;
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;
