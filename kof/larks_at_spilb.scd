
(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);

// lark synth ///////////////////////////////////////

(
~lark.ar(2);
~lark.quant=2;
~lark.fadeTime=4;
~lark={
    var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.333333],inf));
    var a = LFTri.ar(1/4/[1,2,3,4]) + LFTri.ar(1/4000,mul:10);
    var t = Perlin3.ar(a,a,a);
    var f = t.exprange(450.1,5230).round(1.octcps)/mod*[1,2,1.3333,1.5];
  var sig = PinkNoise.ar(0.12!4) + LocalIn.ar(4);
  sig = DelayN.ar(sig,1/f,1/f);
  sig = SelectX.ar( LFTri.ar(1/16/[1,2,3,4]) ** 2 * 2, [LPF.ar(sig,f),BPF.ar(sig,f),DFM1.ar(sig,f,0.2)]);
  sig = CompanderD.ar(sig,3/4,1/1.52,1/1.02,0.0002,0.1);
  //sig = PitchShift.ar(sig,1/f,2.0195);
  LocalOut.ar(Normalizer.ar(sig));
  sig = CompanderD.ar(sig,3/4,1/2,1/2);
  Splay.ar(sig * LFTri.ar(1/4/[1,2,3,4]),0.95,0.25);
};
~lark.play;
~lark[10] = \filter -> {|in| NumChannels.ar(GVerb.ar(Resonz.ar(in,1500/[1,2,4,1.5]) * LFSaw.ar(1/2/[1,2,3,4]),[10,20,90,89])+in,2);};
);

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
  sig = CombN.ar(sig,1,2,5)+sig;
  //sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/2,1/2,0.002,0.3);
  sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),[4000,3000]),2000);
  Splay.ar(sig,0.75,0.15);
};
~ff.play;
);
~ff.stop(7);
~ff.clear;

~lark.stop(4);
~lark.clear;
~lark.pause;
~lark.resume;



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
      1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0,
      1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
      1,0,1,0,1,0,0,0,1,0,0,0,1,0,1,0,
      1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
  ].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.85],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2,env**40*8pi);
  sig = sig * env;
  Splay.ar(sig,0.25,0.5);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;
