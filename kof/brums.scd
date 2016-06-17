
(
Tdef(\recharger,{
  loop{
    ~blipp.rebuild;
    16.wait;
};
}).play;
)
Tdef(\recharger).stop;


(
~p={
  var t = LFSaw.ar([1,2,4]) ** 80;
  var out = Perlin3.ar(t[0],t[1],t[2]).exprange(1/5000,1/2).round(1/43.2/40);
  out;
};
)

(
n = ProxyMixer(p,32);
n.parent.alwaysOnTop_(true);
)

// blipp synth ///////////////////////////////////////

(
~blipp.ar(2);
~blipp.quant=2;
~blipp.fadeTime=16;
~blipp={
  var a = 1+(1..10).reciprocal.choose;//TChoose.kr(Impulse.kr(1/4),[1,2,1.5,1.3333]);
  var b = 1+(1..10).reciprocal.choose;//TChoose.kr(Impulse.kr(4),[1,2,1.5,1.3333,4,8]);
  var env = LFTri.ar(1/4/[1,2,3,4])**8;
  var sig = Blip.ar([43.2,432/4/a,432/2/b,432*8/(a*b)],LFNoise2.kr(1/16!4).range(3,54));
  //sig = Formlet.ar(sig,432/b,LFNoise2.kr(1/16!4).range(0.001,0.03),0.03);
  sig = MoogFF.ar(sig,432/a,LFNoise2.kr(1/16!4).range(1.1,2.7));
  sig = sig+MoogFF.ar(sig,4320/b,LFNoise2.kr(1/16!4).range(1.1,2.7));
  sig = Limiter.ar(sig);
  //sig = sig * Pulse.ar(4/[1,2,3,4])
  sig = (sig*env);
  //sig = sig * env;
  //sig = sig+(CombN.ar(sig,~p.ar*a,~p.ar*b,8)/64);
  sig = CompanderD.ar(sig,3/4,1/2,1/2);
  Splay.ar(sig,0.75,0.5);
};
~blipp.play;
);
~blipp.stop(60);
~blipp.clear;
~blipp.pause;
~blipp.resume;

// ff filter ///////////////////////////////////////

(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var synths = p.playingProxies;
  var high,mid,low;
  var sig = [];
  synths.collect{|n| if(n!=\ff){sig=sig++p.[n.asSymbol];}};

  sig = Resonz.ar(sig,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
  //sig = CombN.ar(sig,4,[4,8,16],32)+sig;
  sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
  low = CompanderD.ar(RLPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/2,1/2);
  high = CompanderD.ar(RHPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/2,1/2,0.002,0.3);
  sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),4000),2000);
  Splay.ar(sig,0.75,0.25);
};
~ff.play;
);
~ff.stop(60);
~ff.clear;
