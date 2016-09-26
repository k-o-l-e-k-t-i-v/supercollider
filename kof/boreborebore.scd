



// postal synth ///////////////////////////////////////

(
~postal.ar(2);
~postal.quant=2;
~postal.fadeTime=4;
~postal={
  var sig = LFSaw.ar([50,100]/[1,1,1.5,1.333]+((1..8)/10000),mul:0.1) * Pulse.ar(4/[1,2,3,4]);
  //sig = sig + (LFSaw.ar(5000/[1,2,1.5,1.33333],mul:0.001) * DelayN.ar(Pulse.ar(4/[1,2,3,4]),1/4,1/4) * LFSaw.ar(1/4/[1,2,3,4]));
  sig = CompanderD.ar(sig,3/4,1/4,1/3).softclip.distort;
  Splay.ar(sig,0.85,0.5);
};
~postal.play;
);
~postal.stop(4);
~postal.clear;
~postal.pause;
~postal.resume;

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
  var pat = [
      1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
      1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
      1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
      1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2,env**12pi*8pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
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
  var mod2 = Duty.kr(16,0,Dseq([1,2,1.5,1.33333],inf));
  var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.33333],inf));
  synths.collect{|n| if(n!=\ff){sig=sig++p.[n.asSymbol];}};

  //sig = Resonz.ar(sig,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
  sig = CombN.ar(sig,1/100*mod/mod2,1/100*mod/mod2,4)+sig;
  //sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1,1/2);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1,1/2,0.002,0.3);
  sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),[4000,4010]),2000);
  Splay.ar(sig,0.95,0.75);
};
~ff.play;
);
~ff.stop(7);
~ff.clear;
