




b = Buffer.read(s,Platform.resourceDir ++ "/sounds/mono/beat.wav");

// player synth ///////////////////////////////////////

(
  ~violin.ar(2);
  ~violin.quant=2;
  ~violin.fadeTime=9.02;
  ~violin={
    var mod = 4/3/[1/2,1,2,4/3]/[1,1.3333,1.5,2]/TChoose.kr(Impulse.ar(1/16/(1..8)),[1.5,1.33335,1,0.75])/1.5;
    var trate, dur, clk, pos, pan,sig;
    trate = 120;
    20.do{
    mod = mod / TChoose.kr(Impulse.ar(1/16/(1..8)),[1.5,1.33335,1,0.5,1/(4/3)]);
  };
    dur = BufDur.kr(b) / trate;
    clk = Impulse.kr(trate);
    pos = LFSaw.ar(1/800/(1..8)).range(0,BufDur.kr(b)) + TRand.kr(0, 0.001, clk);
    pan = WhiteNoise.kr(0.6);
    sig = TGrains.ar(2, clk, b.bufnum, mod, pos, dur, pan, 0.3);
    sig = sig * (LFTri.ar(1/16/(1..8))**10.1);
    //sig = sig * Pulse.ar(4/[1,2,3,4]);
    //sig = Resonz.ar(sig,[468,1168]/TChoose.kr(Impulse.kr(8!4),[1,2,1.5,1.3333]),0.02);
    sig = CompanderD.ar(sig,3/4,1/2,1/2) ;//** LFNoise2.kr(1/4!3).range(0.5,1.99);
    Splay.ar(sig.flat,0.5,0.15);
  };
  ~violin.play;
);
~violin.stop(50);
~violin.clear;

b = Buffer.read(s,Platform.resourceDir ++ "/sounds/mono/violin.wav");

// player synth ///////////////////////////////////////

(
  ~violin2.ar(2);
  ~violin2.quant=2;
  ~violin2.fadeTime=9.02;
  ~violin2={
    var mod = 4/3/[1/2,1,2,4/3]/[1,1.3333,1.5,2]/TChoose.kr(Impulse.ar(1/16/(1..8)),[1.5,1.33335,1,0.75])/1.5;
    var trate, dur, clk, pos, pan,sig;
    trate = 120;
    20.do{
    mod = mod / TChoose.kr(Impulse.ar(1/16/(1..8)),[1.5,1.33335,1,0.5,1/(4/3)]);
  };
    dur = BufDur.kr(b) / trate;
    clk = Impulse.kr(trate);
    pos = LFSaw.ar(1/800/(1..8)).range(0,BufDur.kr(b)) + TRand.kr(0, 0.001, clk);
    pan = WhiteNoise.kr(0.6);
    sig = TGrains.ar(2, clk, b.bufnum, mod, pos, dur, pan, 0.3);
    sig = sig * (LFTri.ar(1/16/(1..8))**10.1);
    //sig = sig * Pulse.ar(4/[1,2,3,4]);
    //sig = Resonz.ar(sig,[468,1168]/TChoose.kr(Impulse.kr(8!4),[1,2,1.5,1.3333]),0.02);
    sig = CompanderD.ar(sig,3/4,1/2,1/2) ;//** LFNoise2.kr(1/4!3).range(0.5,1.99);
    Splay.ar(sig.flat,0.5,0.15);
  };
  ~violin2.play;
);
~violin2.stop(50);
~violin2.clear;



// ff filter ///////////////////////////////////////

(
  ~ff.quant=1;
  ~ff.fadeTime=9;
  ~ff={
    var synths = p.playingProxies;
    var high,mid,low;
    var sig = [];
    synths.collect{|n| if(n!=\ff){sig=sig++p.[n.asSymbol];}};

    //sig = Resonz.ar(sig,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
    //sig = CombN.ar(sig,4,[4,8,16],32)+sig;
    sig = GVerb.ar(LPF.ar(sig,10000)+HPF.ar(sig,300),[100,96],[3,4],spread:[95,96])/16 + sig;
    low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/16!2).range(100,800)),3/4,1/2.5,1/2);
    mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/8!2).range(700,3500),0.4),3/4,1/2.25,1/2);
    high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/4!2).range(1000,16000)),3/4,1/2,1/2);
    sig = CompanderD.ar((high+mid+low).flat,3/4,1/2,1/2,0.002,0.3);
    sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),[4000,4112]),4000);
    Splay.ar(sig,0.75,0.1,LFCub.kr([2,3,4,5],mul:0.15));
  };
  ~ff.play;
);
~ff.stop(7);
~ff.clear;
