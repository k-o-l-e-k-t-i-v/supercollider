


(
  ~a.quant=2;
  ~a.play;
  ~a={
    var x,y;
    var pis = Duty.kr(16,0,Dseq([1,2,4,1.5,2,1.25,4,1.33333]*4,inf));
    var mod3 = Duty.kr(4,0,Dseq([1,2,1.5,4],inf));
    var mod2 = Duty.kr(1/3,0,Dseq([1,2,1.5,1.333]/mod3,inf));
    var mod = Duty.kr(1/4,0,Dseq([1,2,1.5,1.25]/mod2,inf));
    var sig = Perlin3.ar(LFSaw.ar([50,500.1,100,1500]*[pis*pi]/mod/[1,2,1.5,1.3333],mul:[0.75,0.25])**LFNoise2.kr(1/4!2).range(1,4),LFTri.ar(1/4/[3.33,4.33]),PulseCount.ar(Impulse.ar([22050,22051]))/25.0*(mod*4*pis)/LFNoise0.kr(4!4).range(10000,20000).round(1000));
    sig = sig * Pulse.ar(2/[1,2,3,4])/2;// + (sig*LFSaw.ar(1/3/[1,2,3,4]))/2;
    sig = AllpassN.ar(sig,1/5,1/51,4);
    sig = HPF.ar(RLPF.ar(sig,LFNoise2.kr(1/4!4).exprange(100.1,4600)),40) + LFNoise2.ar(300*[1,20,3,10],mul:0.005);
    #x,y = Rotate2.ar(sig[0],sig[1],LFSaw.ar(LFDNoise1.kr(1!4).exprange(1.01,10)))/4;
    sig = LPF.ar(FreeVerb2.ar(x,y,0.25),3500)+(([]++x++y)/4).softclip/2;
    sig = CompanderD.ar(sig,3/4,1/2,1/2);
    Splay.ar(sig,1,0.9);
  };
)

(
  p.clock.tempo_(120/60);
  
  ~offset = (0..7)/8;
  
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
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2 + (env**50*500));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;

// hh synth ///////////////////////////////////////

(
~hh.ar(2);
~hh.quant=2;
~hh.fadeTime=0.2;
~hh={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = LFNoise1.ar(1400*[1,3,7,12]);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~hh.play;
);
~hh.stop(4);
~hh.clear;
~hh.pause;
~hh.resume;

// ff filter ///////////////////////////////////////

(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var synths = p.playingProxies;
  var high,mid,low;
  var sig = [];
  synths.collect{|n| if(n!=\ff){sig=sig++p.[n.asSymbol];}};

  sig = Resonz.ar(sig,LFNoise2.kr(1/4!8).range(100,10000).lag(1/(1..8)),LFNoise2.kr(1/4!8).range(0.1,1).lag((1..4))/16)/4;
  //sig = CombN.ar(sig,4,[4,8,16],32)+sig;
  //sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
  sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),4000),4000)+sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,1800)),3/4,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/1.5,1/2);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/1,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/2,1/2,0.002,0.3);
  Splay.ar(sig,0.95,0.125);
};
~ff.play;
);
~ff.stop(7);
~ff.clear;
