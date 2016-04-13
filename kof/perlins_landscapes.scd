

// ssss synth ///////////////////////////////////////

(
~ssss.ar(2);
~ssss.quant=2;
~ssss.fadeTime=1;
~ssss={
  var sig = VarSaw.ar(MouseX.kr(514,520)*[1.5,1.333,4,8]);
  Splay.ar(sig,0.95,0.5);
};
~ssss.play;
);
~ssss.stop(4);
~ssss.clear;
~ssss.pause;
~ssss.resume;

Tdef(\reb,{loop{~one.rebuild;32.wait;}}).play;
Tdef(\reb).stop;

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=5.2;
~one={
  var mod = [1,1.5,1.3333,4].choose/[1,2,4,1];
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr % pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = Perlin3.ar(LFTri.ar(1/150.133/mod/[1,2,1.5,1.3333])+LFSaw.kr(1/140,mul:500),LFTri.ar(150.1/mod/[1,2,1.5,4])+LFSaw.kr(1/160,mul:500),LFTri.ar(44100/150/[1,2,1.5,4]*LFNoise2.kr(1/4!4).exprange(0.995,1.005))+LFSaw.kr(1/300,mul:300));
  
  sig = LeakDC.ar(sig);
  sig = Resonz.ar(sig,1500/8*fib(8)+SinOsc.ar(1/[2,3,4,5],mul:[4,5,6,7]),LFNoise2.kr(1/4/(1..8)).range(0.01,0.9)) * LFTri.kr(1/8/(1..8)).exprange(0.01,1);
  sig = CompanderD.ar(sig,3/4,1/2,1/2,0.002);
  sig = NumChannels.ar(sig,2);
  sig = Limiter.ar(sig.softclip,0.9);
  Splay.ar(sig,0.75,0.5,SinOsc.ar(1/4,mul:0.2));
};
~one.play;
);
~one.stop(40);
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

  sig = Resonz.ar(sig,LFNoise2.kr(1/12!4).range(50,5000),LFNoise2.kr((1..4)/16).range(0.01,1))/4;
  //sig = CombN.ar(sig,4,[4,8,16],32)+sig;
  //sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
  sig = AllpassN.ar(sig,1/2,4)+sig;
  //sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),2000),4000)+sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,4500),2),3/4,1/3,1/2);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1400,10000)),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/2,1/2,0.002,0.3);
  Splay.ar(sig,0.75,0.45);
};
~ff.play;
);
~ff.stop(50);
~ff.clear;


