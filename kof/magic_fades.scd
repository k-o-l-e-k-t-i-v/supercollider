

z = Morse("test")

Morse.help


Gate.help

(
z=Tdef(\rebuild,{loop{~one.rebuild; ~ff.rebuild; 30.wait;}});
z.play();
)
z.stop;

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=60;
~one={
  var sig = SinOsc.ar(10000/{[1,1.5,2,1.33333,4,8,16].choose}!16/((1+(1..16).reciprocal)*2)) * LFTri.ar(LFSaw.ar(1/4/(1..16)).exprange(1/160,0.5));
  //sig = Normalizer.ar(sig);
  sig = sig * Pulse.ar(2/[1,2,3,4]);
  sig = DFM1.ar(sig,LFNoise2.kr(1/16!4).range(50,1000),LFNoise2.kr(1/16!4).range(0.1,0.8));
  //sig = CombN.ar(sig,1/50/[1,2,1.5,1.33333],1/5/[1,2,1.5,1.33333],8);
  sig = CompanderD.ar(sig,3/4,1,1/3);
  Splay.ar(sig,0.85,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

DFM1.help


// ff filter ///////////////////////////////////////

(
~ff.quant=1;
~ff.fadeTime=15;
~ff={
  var synths = p.playingProxies;
  var high,mid,low;
  var sig = [];
  var f = {[50,100,75,60].choose}!4;
  synths.collect{|n| if(n!=\ff){sig=sig++p.[n.asSymbol];}};

  //sig = Resonz.ar(sig,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
  sig = CombN.ar(sig,1/f,1/f,1)+sig;
  sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1,1/2);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1,1/2,0.002,0.3);
  sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),[4000,4010]),2000);
  Splay.ar(sig,0.95,0.15);
};
~ff.play;
);
~ff.stop(7);
~ff.clear;


StreamKrDur(Morse("test").flat).postln
