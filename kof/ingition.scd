(
  p=ProxySpace.push(s.reboot);
  p.makeTempoClock;
)

(
  p.clock.tempo_(120/60);
  ~offset = {(0..7)/8};
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);


// oo synth ///////////////////////////////////////

(
~oo.ar(2);
~oo.quant=2;
~oo.fadeTime=4;
~oo={
  var mod = Duty.kr(8,0,Dseq([1,2,1.5,1.33333],inf));
  var sig = SinOsc.ar(50!2,Pulse.ar(4/[1,2,3,4]));
  sig = sig + (SinOsc.ar(15000,mul:0.02) * Pulse.ar(2/[2,3,4,5]));
  sig = sig + Formant.ar([50,60,75,1000]*mod,[50,60,75,1000],15000) * Pulse.ar(4/[1,2,3,4]);
  sig = MoogFF.ar(sig,TChoose.kr(Impulse.kr(1/8/[1,2,3,4]),[50,500,250,150,75,60,1500,1500/1.5,1500/1.3333,750,3000,6000]),3.5);
  //sig = sig + (ToggleFF.ar(Impulse.ar(4)*Impulse.ar(1)) * WhiteNoise.ar(0.01));
  sig = CompanderD.ar(sig,3/4,1/3,1/2);
  Splay.ar(sig,0.95,0.15);
};
~oo.play;
);
~oo.stop(4);
~oo.clear;
~oo.pause;
~oo.resume;

// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
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

// hiss synth ///////////////////////////////////////

(
~hiss.ar(2);
~hiss.quant=2;
~hiss.fadeTime=0.2;
~hiss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([1.1,1.2,1.3,1.4]+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;

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
  //sig = DelayN.ar(sig,[1,2,3,4],[1,2,3,4]) * LFTri.ar(1/4/[1,2,3,4]);
  //sig = CombN.ar(sig,1,1*[1,1.5,1.3333,2],4)/32+sig;
  //sig = GVerb.ar(LPF.ar(sig,17000)+HPF.ar(sig,300),[90,100],[3,4],spread:[95,96])/4 + sig;
  low = CompanderD.ar(RLPF.ar(sig,LFSaw.kr(1/44!2).range(100,1800),0.2),3/4,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFSaw.kr(1/66!2).range(700,10000),2),3/4,1/2,1/2);
  high = CompanderD.ar(RHPF.ar(sig,LFSaw.kr(1/400/[1,2,3,4]!2).range(100,13000),0.2),3/4,1/3,1/2);
  sig = (high+mid+low).flat;//,3/4,1/2,1/2,0.002,0.3);
  sig = DWGReverb.ar(NumChannels.ar(sig,2),[4000,4100])/8+sig;
  Splay.ar(sig,0.95,0.13,SinOsc.ar(1/4));
};
~ff.play;
);
~ff.stop(7);
~ff.clear;
