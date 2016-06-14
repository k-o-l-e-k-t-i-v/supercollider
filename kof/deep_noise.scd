// prln synth ///////////////////////////////////////
p.arProxyNames.collect{|n| var snth = (p[n.asSymbol]);if(true){snth.stop(60)}};
p.arProxyNames.collect{|n| var snth = (p[n.asSymbol]);snth.clear};

(
~prln.ar(2);
~prln.quant=2;
~prln.fadeTime=4;
~prln={
    var duty = Duty.kr(8,0,Dseq([1,2,1.5,1.3333],inf)).lag(1);
  var t = LFTri.ar([1/1000,1/150,200/duty]) + LFTri.ar(1/4000/[1,2,1.333],mul:[1,50,1/4]);
  var sig = Perlin3.ar(t[0]*(1..8).reciprocal,t[1]*(1..8).reciprocal,t[2]*(1..8).reciprocal);
  sig = sig * (LFTri.ar(1/16/(1..8))**2) + (DelayN.ar(PitchShift.ar(sig,0.1,1/[1,2,1/1.333,1/1.5]),[1,2,3,4],[1,2,3,4]));
  sig = HPF.ar(sig,50);
  Splay.ar(sig,0.75,0.95);
};
~prln.play;
~ff.rebuild;
);
~prln.stop(4);
~prln.clear;
~prln.pause;
~prln.resume;

(
  p.clock.tempo_(120/60);
  
  ~offset = {(0..7)/8};
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);

// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,3.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2,env**20*8pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;

// ff filter ///////////////////////////////////////

(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var synths = p.playingProxies;
  var high,mid,low;
  var sig = [];
  synths.collect{|n| if(n!=\ff){sig=sig++p.[n.asSymbol];}};

  sig = Resonz.ar(sig,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/8;
  sig = CombN.ar(sig,4,[4,8,16],32)+sig;
  sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
  low = CompanderD.ar(RLPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/2,1/2);
  high = CompanderD.ar(RHPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/2,1/2,0.002,0.3);
  sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),4000),2000);
  Splay.ar(sig,0.75,0.15);
};
~ff.play;
);
~ff.stop(7);
~ff.clear;
