// prln synth ///////////////////////////////////////
p.arProxyNames.collect{|n| var snth = (p[n.asSymbol]);if(true){snth.stop(60)}};
p.arProxyNames.collect{|n| var snth = (p[n.asSymbol]);snth.clear};

(
~prln.ar(2);
~prln.quant=2;
~prln.fadeTime=4;
~prln={
    var duty = Duty.kr(8,0,Dseq([1,2,1.5,1.3333],inf)).lag(1);
  var t = SinOsc.ar([1/1000,150/duty,50*duty]) + LFTri.ar(1/400/[1,2,1.333],mul:[1,50,1/4]);
  var sig = Perlin3.ar(t[0]*(1..8).reciprocal,t[1]*(1..8).reciprocal,t[2]*(1..8).reciprocal);
  sig = sig * (LFTri.ar(1/4/(1..8))**2) + (DelayN.ar(PitchShift.ar(sig,0.1,[1,2,8/1.333,1/1.5]),[1,2,3,4],[1,2,3,4]));
  Splay.ar(sig,0.75,0.5);
};
~prln.play;
);
~prln.stop(4);
~prln.clear;
~prln.pause;
~prln.resume;

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
  sig = CombN.ar(sig,4,[4,8,16],32)+sig;
  sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
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
