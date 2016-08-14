




// pls synth ///////////////////////////////////////

(
~pls.ar(2);
~pls.quant=2;
~pls.fadeTime=4;
~pls={
  var sig = LFPulse.ar(50) * Pulse.ar(4);
  Splay.ar(sig,0.5,0.05);
};
~pls.play;
);
~pls.stop(4);
~pls.clear;
~pls.pause;
~pls.resume;



(
  p.clock.tempo_(120/60);
  
  ~offset = {(0..7)/8};
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);

// sw synth ///////////////////////////////////////

(
~sw.ar(2);
~sw.quant=2;
~sw.fadeTime=0.2;
~sw={
  //         |       |       |       |       |  
  var pat = [
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0,
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
    1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2],~counter.kr % pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,[1.5,4]],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(50!2),
  LFPulse.ar(50*[1]),
  LFSaw.ar(50*[1]),
  WhiteNoise.ar(0.2),
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  //sig = sig * env;
  //sig = sig * Pulse.ar(TChoose.kr(Impulse.kr(1/4!2),[2,2,4,8,16]));
  Splay.ar(sig,0.75,0.15);
};
~sw.play;
);
~sw.stop(4);
~sw.clear;
~sw.pause;
~sw.resume;


// lll synth ///////////////////////////////////////

(
~lll.ar(2);
~lll.quant=2;
~lll.fadeTime=4;
~lll={
  var sig = LFPulse.ar(15000/(1/(1..8).reciprocal+1),mul:0.2) * Pulse.ar(TChoose.kr(Impulse.kr(1/4!8),[1,2,4,8,16,32,64,320]));
  //sig = CombN.ar(sig,1/50,1/50,4);
  Splay.ar(sig,0.5,0.15);
};
~lll.play;
);
~lll.stop(4);
~lll.clear;
~lll.pause;
~lll.resume;



// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0,
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
    1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(110!2,env**[400,40]*8pi);
  sig = sig * env;
  Splay.ar(sig,0.05,0.95);
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

  //sig = Resonz.ar(sig,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
  //sig = CombN.ar(sig,1/50,1/50*[1,2,4,8],4)+sig;
  sig = GVerb.ar(LPF.ar(sig,17000)+HPF.ar(sig,300),[100,99],[3,4],spread:[95,96])/2 + sig;
  low = CompanderD.ar(RLPF.ar(sig,LFSaw.kr(1/8!2).range(100,800),0.2),3/4,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFSaw.kr(1/32!2).range(700,1500),2),3/4,1/2,1/2);
  high = CompanderD.ar(RHPF.ar(sig,LFSaw.kr(1/16!2).range(1000,16000),0.2),3/4,1/3,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/2,1/2,0.002,0.3);
  sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),4000),2000);
  Splay.ar(sig,0.75,LFSaw.ar(1/[1,2,3,4])**4);
};
~ff.play;
);
~ff.stop(7);
~ff.clear;

// rr filter ///////////////////////////////////////

(
~rr.quant=1;
~rr.fadeTime=1;
~rr={
  var synths = p.playingProxies;
  var high,mid,low;
  var sig = [];
  synths.collect{|n| if(n!=\rr){sig=sig++p.[n.asSymbol];}};
  sig = CombN.ar(sig,1/50,1/50/[1,2,1.5,1.3333],4);
  //sig = Resonz.ar(sig,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
  //sig = CombN.ar(sig,4,[4,8,16],32)+sig;
  //sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1000),2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,16000)),3/4,1/3,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/2,1/2,0.002,0.3);
  sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),4000),2000);
  Splay.ar(sig,0.75,LFSaw.ar(1/4/[1,2,3,4]));
};
~rr.play;
);
~rr.stop(7);
~rr.clear;
