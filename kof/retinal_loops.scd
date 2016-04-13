


// perl synth ///////////////////////////////////////

(
~perl.ar(2);
~perl.quant=2;
~perl.fadeTime=7;
~perl={
  //var mmod = Duty.kr(16,0,Dseq([1,2,4,1.5],inf));
  //var mod= Duty.kr(4,0,Dseq([1,2,1.25,1.33333]*mmod,inf));
  var fundamental = [60,48,36].midicps/[4,2,1];
  var mod =1;
  var sig = Perlin3.ar(LFTri.ar(1/(1000+(1..8)))*100+SinOsc.ar(1/50/(1..8),add:1,mul:5),LFTri.ar(1/(103+(1..8)))*100,LFTri.ar(fundamental*[1.01,1.5,2,4,1.3333]/[1,1.5,1.5,0.5,1.25,1.3333].scramble/mod));
  //sig =  SinOsc.ar(50,sig*2pi,mul:0.25);
 sig = sig * LFTri.ar(1/~tempo.kr/(1..8)).exprange(0.001,1);
  sig = NumChannels.ar(sig,2);
  sig = AllpassN.ar(sig,1/50,1/50,4);
  //sig = DWGReverb.ar(sig,[4000,3000]);
  Splay.ar(sig,0.5,0.75);
};
~perl.play;
);
~perl.stop(4);
~perl.clear;
~perl.pause;
~perl.resume;


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
  var pat = [
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0,
  ].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,3.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2+(env**20*200));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;


// snare synth ///////////////////////////////////////

(
~snare.ar(2);
~snare.quant=2;
~snare.fadeTime=0.2;
~snare={
  //         |       |       |       |       |  
  var pat = [
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0,
    1,0,0,0,1,0,0,0,1,0,0,0,1,1,0,1,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = WhiteNoise.ar(1!2);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~snare.play;
);
~snare.stop(4);
~snare.clear;
~snare.pause;
~snare.resume;

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
  //sig = CombN.ar(sig,4,[4,8,16],32)+sig;
  //sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
  sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),4000),4000)+sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,3500),2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(2000,10000)),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/2,1/2,0.002,0.3);
  Splay.ar(sig,0.75,0.15);
};
~ff.play;
);
~ff.stop(7);
~ff.clear;
