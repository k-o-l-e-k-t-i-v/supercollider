


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=1;
~one={
  var sig = SinOsc.ar([50,60,50],Pulse.ar([4,3]++1),mul:[1,0.1,1]) * Pulse.ar([4,3]++1);
  Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

(
  p.clock.tempo_(120/60);
  
  ~offset = {(0..7)/8};
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);


// lalal synth ///////////////////////////////////////

(
~lalal.ar(2);
~lalal.quant=2;
~lalal.fadeTime=4;
~lalal={
  var sig = Piu;
  Splay.ar(sig,0.5,0.25);
};
~lalal.play;
);
~lalal.stop(4);
~lalal.clear;
~lalal.pause;
~lalal.resume;

// ttt synth ///////////////////////////////////////

(
~ttt.ar(2);
~ttt.quant=2;
~ttt.fadeTime=8.2;
~ttt={
  //         |       |       |       |       |  
  var pat = [
    1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,0,
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
    1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,0,
  ].rotate(3);
  var lar = Duty.kr(4,0,Dseq([1,2,1.5,1.333],inf));
  var imp = PulseDivider.kr(~tick.kr,[2,4,16,24],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.015],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar([15000,570]) + WhiteNoise.ar(0.01);
  sig = sig * env;
  
  sig = LocalIn.ar(2) + sig;
  sig = DelayN.ar(sig,1/50*lar,1/50*lar);
  sig = LPF.ar(sig,18000);
  LocalOut.ar(sig/1.001);


  Splay.ar(sig,0.75,0.75);
};
~ttt.play;
);
~ttt.stop(4);
~ttt.clear;
~ttt.pause;
~ttt.resume;





// one2 filter ///////////////////////////////////////

(
~one2.quant=1;
~one2.fadeTime=8;
~one2={
  var synths = p.playingProxies;
  var high,mid,low;
  var sig = [];
  var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.3333],inf));
  synths.collect{|n| if(n!=\one2){sig=sig++p.[n.asSymbol];}};

  //sig = Resonz.ar(sig,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
  sig = CombN.ar(sig,1/50*mod,1/50*mod,1.5) +sig;
  //sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,1800)),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,15000)),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/2,1/2,0.002,0.3);
  sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),[4000,4010]),2000);
  Splay.ar(sig,0.75,0.015);
};
~one2.play;
);
~one2.stop(7);
~one2.clear;
