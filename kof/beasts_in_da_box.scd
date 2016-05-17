p.arProxyNames.collect{|n| var snth = (p[n.asSymbol]);if(true){snth.stop(30)}};
p.arProxyNames.collect{|n| var snth = (p[n.asSymbol]);snth.clear};


// perlin synth ///////////////////////////////////////

(
~perlin.ar(2);
~perlin.quant=2;
~perlin.fadeTime=2;
~perlin={
  var mmod = Duty.kr(1/4,0,Dseq([1,2,1.5,1.333],inf));
  var notes = Duty.kr(16,0,Dseq([1,2,3,4,5,6].octcps,inf));
  var mod3 = Duty.kr(16,0,Dseq([1,2,1.5,4],inf));
  var mod2 = Duty.kr(4,0,Dseq([1,2,1.5,1.3333]*mod3,inf));
  var mod = Duty.kr(8,0,Dseq([1,2,1.5,4]/mod2,inf));
  var f = notes/[60,57,36,24,12,64,65].midicps/[1/100,1/100,1/150,1/200]/mod + SinOsc.kr(1/4/[1,2,3,4],mul:0.15) ;
  var time = LFSaw.ar(f/40,mul:LFSaw.ar(1/4/(1..16))**20*20);
  var sig = Perlin3.ar(time[0],time[1],time[2]) + Perlin3.ar(time[3],time[4],time[5]) + SinOsc.ar([36,24,12].midicps/mod);
  //sig = SinOsc.ar(f/8) * sig;
  sig = LeakDC.ar(sig).softclip;
  sig = (SinOsc.ar(f*[2,1/2,8,8/1.5],sig*2pi)*LFSaw.ar(1/32/(1..16)).exprange(0.001,0.7) * LFSaw.ar(1/4/(1..16))).exprange(0.001,1);
  sig = CombN.ar(sig,1,1,8);
  sig = sig + LFNoise2.ar(1600/16*(1..16),mul:0.00001);
  sig = Resonz.ar(sig,(16*60.midicps)/16*(1..16),LFNoise2.ar(1/4!4).range(0.02,0.2),mul:LFNoise2.kr(4!16).exprange(0.001,1/(1..16)) );
  sig = CompanderD.ar(sig,1/2,1/4,1/200);
  Splay.ar(sig,0.15,0.95);
};
~perlin.play;
~ff.rebuild;
);
~perlin.stop(4);
~perlin.clear;
~perlin.pause;
~perlin.resume;

// ff filter ///////////////////////////////////////

(
~ff.quant=1;
~ff.fadeTime=8;
~ff={
  var synths = p.playingProxies;
  var high,mid,low;
  var sig = [];
  synths.collect{|n| if(n!=\ff){sig=sig++p.[n.asSymbol];}};

  sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
  sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),4000),4000)+sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/2.5,1/2);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/1.5,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/2,1/2,0.002,0.3);
  Splay.ar(sig,0.75,0.15);
};
~ff.play;
);
~ff.stop(7);
~ff.clear;

