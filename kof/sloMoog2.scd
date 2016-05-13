


(
  p.clock.tempo_(120/60*2);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);



// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=0.2;
~one={|base = #[4,5,6,7]|

  var mod = Duty.kr(16,0,Dseq([1,2,1.5,1.3333],inf));
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,(1..4)*32,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[1.05*(1..4),1.15*(1..4)],[3,-3],curve:'exp'),imp * hit);
  var sig = Formant.ar(base.octcps/[1,2,4/3,3/2]/mod,env**LFNoise2.kr(1/40/(1..4),mul:2)*100+50,env**LFNoise2.kr(1/60/(1..4),mul:2)*1000+50);
  sig = sig * Perlin3.ar(LFSaw.ar(base.octcps/[1,2,4/3,3/2]/mod/4)**2,LFSaw.ar(base.octcps/[1,2,4/3,3/2]/mod)*(env**LFNoise2.kr(1/4!4,mul:4)*2),LFSaw.ar(1/160)*50);
  sig = sig * env;
  //sig = sig * LFTri.ar(~tempo.kr/[1,2,3,4]).exprange(0.001,1);
  sig = MoogFF.ar(sig,env**LFNoise2.kr(1/16!4,mul:2)*4800+50,LFNoise2.kr(1/16!4).exprange(0.001,0.74));
  sig = CombN.ar(sig,1/base/mod,4/base/mod,4);
  sig = CompanderD.ar(sig,3/4,1/3,1/10);
  Splay.ar(sig,0.5,0.5);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
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

  sig = Resonz.ar(sig,LFTri.kr(1/16!4).range(100,10000).lag((1..8)),LFNoise2.kr(1/16!4).range(0.1,1).lag((1..4)));
  //sig = CombN.ar(sig,4,[4,8,16],32)+sig;
  //sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
  sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),2000),2000)+sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/2,1/2,0.002,0.3);
  Splay.ar(sig,0.75,0.15);
};
~ff.play;
);
~ff.stop(7);
~ff.clear;
