
p.arProxyNames.collect{|n| var snth = (p[n.asSymbol]);if(true){snth.stop(60)}};
p.arProxyNames.collect{|n| var snth = (p[n.asSymbol]);snth.clear};

// player synth ///////////////////////////////////////

(
b = Buffer.read(s,Platform.resourceDir ++ "/sounds/wav/phone.wav");
    ~grain3.ar(2);
    ~grain3.quant=4;
    ~grain3.fadeTime=2.02;
    ~grain3={
      var mm = Duty.kr(4,0,Dseq([1,2,1.5,1.25],inf));
    var mod = 1;///[1,2,1.5,1.3333];
    var trate, dur, clk, pos, pan,sig;
    trate = 240;
    dur = BufDur.kr(b) / trate;
    clk = Impulse.kr(trate);
    t = LFTri.ar(1/[50,500,5000/[1,2,3,4]]) ** 16 ;
    pos = Perlin3.ar(t[0],t[1],t[2]).range(0,BufDur.kr(b)) + LFNoise2.kr(1/60!4,mul:30);
    //pos = LFSaw.ar(1/1600/[1,2,3,4]).range(0,BufDur.kr(b)) + TRand.kr(0, 0.01, clk);
    pan = WhiteNoise.kr(0.16);
    sig = TGrains.ar(2, clk, b.bufnum, mod, pos, dur, pan, 0.3);
    sig = sig * (LFTri.ar(1/16/[1,2,3,4])**4);
    sig = CombN.ar(sig,1/5,1,4);
    sig = CompanderD.ar(sig,3/4,1/2,1/2);
    Splay.ar(sig.flat,0.85,0.25);
    };
    ~grain3.play;
);
~grain.stop(30);
~grain.clear;



// player synth ///////////////////////////////////////

(
b = Buffer.read(s,Platform.resourceDir ++ "/sounds/wav/phone.wav");
    ~grain2.ar(2);
    ~grain2.quant=2;
    ~grain2.fadeTime=16.02;
    ~grain2={
      var mm = Duty.kr(4,0,Dseq([1,2,1.5,1.25],inf));
    var mod = 1/[1,2,1.5,1.3333];
    var trate, dur, clk, pos, pan,sig;
    trate = 240;
    dur = BufDur.kr(b) / trate;
    clk = Impulse.kr(trate);
    t = LFTri.ar(1/16/[50/[1,2,3,4],500,5000]) ** 8 ;
    pos = Perlin3.ar(t[0],t[1],t[2]).range(0,BufDur.kr(b)) + LFNoise2.kr(1/60!4,mul:60);
    //pos = LFSaw.ar(1/1600/[1,2,3,4]).range(0,BufDur.kr(b)) + TRand.kr(0, 0.01, clk);
    pan = WhiteNoise.kr(0.16);
    sig = TGrains.ar(2, clk, b.bufnum, mod, pos, dur, pan, 0.3);
    sig = sig * (LFTri.ar(1/16/[1,2,3,4])**4);
    sig = CombN.ar(sig,1/50,1,4);
    sig = CompanderD.ar(sig,3/4,1/2,1/2);
    Splay.ar(sig.flat,0.85,0.2);
    };
    ~grain2.play;
);
~grain2.stop(30);
~grain.clear;

p.arProxyNames.collect{|n| var snth = (p[n.asSymbol]);if(true){snth.stop(10)}};
p.arProxyNames.collect{|n| var snth = (p[n.asSymbol]);snth.clear};



// player synth ///////////////////////////////////////

(
b = Buffer.read(s,Platform.resourceDir ++ "/sounds/mono/beat2.wav");
    ~grain.ar(2);
    ~grain.quant=2;
    ~grain.fadeTime=2.02;
    ~grain={
      var mm = Duty.kr(4,0,Dseq([1,2,1.5,1.25],inf));
    var mod = 1/[1,2,1.5,1.3333];
    var trate, dur, clk, pos, pan,sig;
    trate = 240;
    dur = BufDur.kr(b) / trate;
    clk = Impulse.kr(trate);
    t = LFTri.ar(1/[50/[1,2,3,4],500,5000]) ** 8;
    pos = Perlin3.ar(t[0],t[1],t[2]).range(0,BufDur.kr(b));
    //pos = LFSaw.ar(1/1600/[1,2,3,4]).range(0,BufDur.kr(b)) + TRand.kr(0, 0.01, clk);
    pan = WhiteNoise.kr(0.16);
    sig = TGrains.ar(2, clk, b.bufnum, mod, pos, dur, pan, 0.3);
    sig = sig * (LFTri.ar(1/4/[1,2,3,4])**4);
    sig = CombN.ar(sig,1/50,1,4);
    sig = CompanderD.ar(sig,3/4,1/2,1/2);
    Splay.ar(sig.flat,0.85,0.02);
    };
    ~grain.play;
    ~grain.stop(60);
);
~grain.stop(60);
~grain.clear;

// ff filter ///////////////////////////////////////

(
~ff.quant=1;
~ff.fadeTime=4;
~ff={
  var synths = p.playingProxies;
  var high,mid,low;
  var sig = [];
  synths.collect{|n| if(n!=\ff){sig=sig++p.[n.asSymbol];}};

  //sig = Resonz.ar(sig,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
  //sig = CombN.ar(sig,4,[4,8,16],32)+sig;
  //sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
  low = CompanderD.ar(RLPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/2,1/2);
  high = CompanderD.ar(RHPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/2,1/2,0.002,0.3);
  sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),4000),2000);
  Splay.ar(sig,0.75,0.15);
};
~ff.play;
);
~ff.stop(7);
~ff.clear;

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
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2,env**20*8pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;
