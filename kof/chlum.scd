


(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=6;
~one={
  var mod = [1,2,1/2];//Duty.kr([4,3,2,1],0,Dseq([1,2,1.5,1.3333],inf));
  var t = LFSaw.ar([1,4/[1,2,3,4],17500/[1,1.5,1.333,4,8,16]*mod]) ** 1.14 * LFSaw.ar(1/1600/[1,2,3,4]).range(1,[16,160,1,16000]);
  var sig = Perlin3.ar(t[0],t[1],t[2]) * Pulse.ar(4/[1,2,3,4,5,6,7]) ;//* Pulse.ar(2/[1,2,3,4]);
  Splay.ar(sig,0.5,0.15);
};
~one.play;
~ff.rebuild;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


b = Buffer.read(s,Platform.resourceDir ++ "/sounds/mono/beat.wav");

// player synth ///////////////////////////////////////

(
    ~gr.ar(2);
    ~gr.quant=2;
    ~gr.fadeTime=2.02;
    ~gr={
        var mod = [0.75,1.5]/2;//[1,1.3333,1.5,2];
    var trate, dur, clk, pos, pan,sig;
    trate = 120;
    dur = BufDur.kr(b) / trate;
    clk = Impulse.kr(trate);
    pos = LFSaw.ar(1/400/[1,2,4,8]).range(0,BufDur.kr(b)) + TRand.kr(0, 0.01, clk);
    pan = WhiteNoise.kr(0.6);
    sig = TGrains.ar(2, clk, b.bufnum, mod, pos, dur, pan, 0.3);
    //sig = sig * (LFTri.ar(1/16/[1,2,3,4])**4);
    sig = CompanderD.ar(sig,3/4,1/2,1/2) * Pulse.ar([2]/[1,2,3,4]);
    Splay.ar(sig.flat,0.5,0.015);
    };
    ~gr.play;
    ~ff.rebuild;
);
~gr.stop(7);
~gr.clear;

// one synth ///////////////////////////////////////

(
~one2.ar(2);
~one2.quant=2;
~one2.fadeTime=4;
~one2={
  var sig = Pulse.ar([4]/[1,2,3,4]) + (Pulse.ar([1]) * WhiteNoise.ar(0.02));
  Splay.ar(sig,0.5,0.15);
};
~one2.play;
);
~one2.stop(4);
~one2.clear;
~one.pause;
~one.resume;


// white synth ///////////////////////////////////////

(
~white.ar(2);
~white.quant=2;
~white.fadeTime=4;
~white={
  var sig = SinOsc.ar(50!2);
  Splay.ar(sig,0.5,0.25);
};
~white.play;
);
~white.stop(4);
~white.clear;
~white.pause;
~white.resume;


// po filter ///////////////////////////////////////

(
~po.quant=1;
~po.fadeTime=8;
~po={
  var synths = p.playingProxies;
  var high,mid,low;
  var sig = [];
  var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.333335,2,1.5,4,8,16],inf));
  synths.collect{|n| if(n!=\po){sig=sig++p.[n.asSymbol];}};

  //sig = Resonz.ar(sig,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
  sig = CombN.ar(sig,1/75,1/75/[1,1.33335,4]*mod,32);
  //sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/2,1/2,0.002,0.3);
  sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),4000),2000);
  Splay.ar(sig,0.75,0.35);
};
~po.play;
);
~po.stop(7);
~po.clear;
