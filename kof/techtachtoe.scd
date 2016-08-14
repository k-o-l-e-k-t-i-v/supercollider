
(
  p.clock.tempo_(240/60);
  
  ~offset = {(0..7)/8};
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);
// lame synth ///////////////////////////////////////


b = Buffer.read(s,Platform.resourceDir ++ "/sounds/mono/piano.wav");

// player synth ///////////////////////////////////////

(
    ~a.ar(2);
    ~a.quant=2;
    ~a.fadeTime=16.02;
    ~a={
        var mod = 1/2/[1,1.3333,1.5,2];
    var trate, dur, clk, pos, pan,sig;
    trate = 120;
    dur = BufDur.kr(b) / trate;
    clk = Impulse.kr(trate);
    pos = LFSaw.ar(1/4000/[1,2,4,8]).range(0,BufDur.kr(b)) + TRand.kr(0, 0.01, clk);
    pan = WhiteNoise.kr(0.6);
    sig = TGrains.ar(2, clk, b.bufnum, mod, pos, dur, pan, 0.3);
    sig = sig * (LFTri.ar(1/32/[1,2,3,4])**4);
    sig = CompanderD.ar(sig,3/4,1/2,1/2);
    Splay.ar(sig.flat,0.5,0.15);
    };
    ~a.play;
);
~a.stop(30);
~a.clear;

(
~lame.ar(2);
~lame.quant=2;
~lame.fadeTime=8.2;
~lame={
  var t = LFTri.ar([1,2,3,4]/4/[1,40,800]) ** LFSaw.ar(1/400*[1,2,3,4]).range(0.1,40) * [1,2,3,4];
  //         |       |       |       |       |  
  var pat = [0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr % pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.25],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  LFSaw.ar(60),
  SinOsc.ar(60),
  LFPulse.ar(60),
  LFNoise2.ar(16000),
  SinOsc.ar(16000/[1,2,4,1.5],mul:0.1),
  LFPulse.ar(65),
  Pulse.ar(4),
  LFPulse.ar(60),
  SinOsc.ar(65),
  LFNoise1.ar(10000),
  WhiteNoise.ar(0.2)
  ];
  sig = SelectX.ar(Perlin3.ar(t[0],t[1],t[2]).range(0,sig.size).lag([0,0.001]),sig);
  sig = CombN.ar(PitchShift.ar(sig,[0.01,0.0201],1/[1,2,1.5,1.33335]),1/8/(1..4),1/(1..4),1);
  sig = sig * (LFTri.ar(1/4/[1,2,3,4])**2);
  sig = LeakDC.ar(sig);
  Splay.ar(sig,0.82,0.19,LFPulse.ar(4/[1,2,3,4])-0.5*2);
};
~lame.play;
);
~lame.stop(40);
~lame.clear;
~lame.pause;
~lame.resume;

// crak synth ///////////////////////////////////////
(
(
~crak.ar(2);
~crak.quant=2;
~crak.fadeTime=0.2;
~crak={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[4,3,2,1]*[2,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([0.1,0.72,0.3,0.84]+(env**10));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~crak.play;
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
    1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1,
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0,
  ].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]*[4,2],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,[2.5,8]],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2,env**[40,200]*8pi);
  sig = sig * env;
  Splay.ar(sig,0.15,0.45);
};
~kick.play;
);
);
~kick.stop(10);
~kick.clean;
// ff filter ///////////////////////////////////////

(
~ff.quant=1;
~ff.fadeTime=8;
~ff={
  var synths = p.playingProxies;
  var high,mid,low;
  var sig = [];
  synths.collect{|n| if(n!=\ff){sig=sig++p.[n.asSymbol];}};

  //sig = Resonz.ar(sig,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
  //sig = CombN.ar(sig,4,[4,8,16],32)+sig;
  //sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/2,1/2,0.002,0.3);
  //sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),4000),2000);
  Splay.ar(sig,0.75,0.15);
};
~ff.play;
);
~ff.stop(70);
~ff.clear;

(
n = ProxyMixer(p,32);
n.parent.alwaysOnTop_(true);
)
