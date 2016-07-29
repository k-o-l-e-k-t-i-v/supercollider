







// one synth ///////////////////////////////////////

(
  ~one.ar(2);
  ~one.quant=2;
  ~one.fadeTime=1;
  ~one={
    var t = LFTri.ar(1/4/[1,2,3]) ;
    var perl = Perlin3.ar(t[0],t[1],t[2]) * 16000;
    var puls = Pulse.ar(LFNoise0.ar(4).round(1/8)*[4,2,1]);
    var sig = perl * puls;
    Splay.ar(sig,0.5,0.005);
  };
  ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


b = Buffer.read(s,Platform.resourceDir ++ "/sounds/mono/violin.wav");

// player synth ///////////////////////////////////////

(
  ~violin.ar(2);
  ~violin.quant=2;
  ~violin.fadeTime=19.02;
  ~violin={
    var mod = 1/[2,1]/[1,1.3333,1.5,2]/TChoose.kr(Impulse.ar(1/16/[1,2,3,4]),[1.5,1.33335,1,0.75])/1.5;
    var trate, dur, clk, pos, pan,sig;
    trate = 120;
    2.do{
    mod = mod / TChoose.kr(Impulse.ar(1/16/[1,2,3,4]),[1.5,1.33335,1,0.5]);
  };
    dur = BufDur.kr(b) / trate;
    clk = Impulse.kr(trate);
    pos = LFSaw.ar(1/200/[1,2,4,8]).range(0,BufDur.kr(b)) + TRand.kr(0, 0.001, clk);
    pan = WhiteNoise.kr(0.6);
    sig = TGrains.ar(2, clk, b.bufnum, mod, pos, dur, pan, 0.3);
    sig = sig * (LFTri.ar(1/16/[1,2,3,4])**4);
    //sig = sig * Pulse.ar(1/4/[1,2,3,4]);
    //sig = Resonz.ar(sig,[468,1168]/TChoose.kr(Impulse.kr(8!4),[1,2,1.5,1.3333]),0.02);
    sig = CompanderD.ar(sig,3/4,1/2,1/2) ;//** LFNoise2.kr(1/4!3).range(0.5,1.99);
    Splay.ar(sig.flat,0.5,0.15);
  };
  ~violin.play;
);
~violin.stop(50);
~violin.clear;



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
    low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/2,1/2);
    mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/2,1/2);
    high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/2,1/2);
    sig = CompanderD.ar((high+mid+low).flat,3/4,1/2,1/2,0.002,0.3);
    sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),4000),2000);
    Splay.ar(sig,0.75,0.15);
  };
  ~ff.play;
);
~ff.stop(7);
~ff.clear;
