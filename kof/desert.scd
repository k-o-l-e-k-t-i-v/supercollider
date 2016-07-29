// four synth ///////////////////////////////////////


// five synth ///////////////////////////////////////

(
~five.ar(2);
~five.quant=2;
~five.fadeTime=32;
~five={
  var sig = SinOsc.ar(5000/[1,2,3,8],Pulse.ar(4/[1,3,5,7]),mul:0.1);
  sig = sig * LFPulse.ar([1,2,3,4]) * LFPulse.ar([4,5,6,7]);
  Splay.ar(sig,0.5,0.05);
};
~five.play;
);
~five.stop(100);
~five.clear;
~five.pause;
~five.resume;

// four synth ///////////////////////////////////////

(
~four.ar(2);
~four.quant=2;
~four.fadeTime=32;
~four={
  var sig = SinOsc.ar(100!2,Pulse.ar(4/[1,2,3,4]));
  Splay.ar(sig,0.05,0.15);
};
~four.play;
);
~four.stop(40);
~four.clear;
~four.pause;
~four.resume;

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(70,Pulse.ar(1));
  Splay.ar(sig,0.5,0.15);
};
~one.play;
);
~one.stop(40);
~one.clear;
~one.pause;
~one.resume;

// two synth ///////////////////////////////////////

(
~two.ar(2);
~two.quant=2;
~two.fadeTime=32;
~two={
  var sig = SinOsc.ar(60,Pulse.ar(4));
  Splay.ar(sig,0.5,0.25);
};
~two.play;
);
~two.stop(40);
~two.clear;
~two.pause;
~two.resume;


// three synth ///////////////////////////////////////

(
~three.ar(2);
~three.quant=2;
~three.fadeTime=4;
~three={
  var sig = SinOsc.ar(50,Pulse.ar(1/4));
  Splay.ar(sig,0.5,0.25);
};
~three.play;
);
~three.stop(40);
~three.clear;
~three.pause;
~three.resume;

// ff filter ///////////////////////////////////////

(
~ff.quant=1;
~ff.fadeTime=8;
~ff={
  var synths = p.playingProxies;
  var high,mid,low;
  var sig = [];
  synths.collect{|n| if(n!=\ff){sig=sig++p.[n.asSymbol];}};

  //sig = Resonz.ar(sig,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
  sig = CombN.ar(sig,1/50,1/[50,60,70,100].choose,32)+sig;
  //sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/2,1/2,0.002,0.3);
  sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),4000),2000);
  Splay.ar(sig,0.75,0.15);
};
~ff.play;
);
~ff.stop(3);
~ff.clear;
p.arProxyNames.collect{|n| var snth = (p[n.asSymbol]);if(true){snth.stop(10)}};
p.arProxyNames.collect{|n| var snth = (p[n.asSymbol]);snth.clear};

Tdef(\a).stop;
Tdef(\a,{loop{~ff.rebuild;16.wait;}}).play;
