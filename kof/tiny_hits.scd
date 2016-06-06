

~mm.quant=2;
~mm = {var t = LFTri.ar([1/2,1/4,8]) + LFSaw.ar(1/5000/[1,2,3]); Perlin3.ar(t[0],t[1],t[2])};

(
  p.clock.tempo_(240/60*8);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);

// got synth ///////////////////////////////////////

(
  ~got.ar(2);
  ~got.quant=2;
  ~got.fadeTime=4.2;
  ~got={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr % pat.size);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.05*[1,2,3,4]],[3,-3],curve:'exp'),imp * hit);
    var sig = [
      DC.ar(0),
      SinOsc.ar(1500),
      Pulse.ar(4),
      Formant.ar(150/1.5,150,1500),
      LFNoise2.ar(1500),
      SinOsc.ar(1500),
      LFNoise1.ar(15000/2)
    ];
    sig = SelectX.ar((~mm/[1,2,3,4]*sig.size)%sig.size,sig);
    sig = sig * env;
    Splay.ar(sig,0.05,0.25);
  };
  ~got.play;
);
~got.stop(4);
~got.clear;
~got.pause;
~got.resume;

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
  sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),2000),2000)+sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/2,1/2,0.002,0.3);
  Splay.ar(sig,0.75,0.0125);
};
~ff.play;
);
~ff.stop(7);
~ff.clear;
