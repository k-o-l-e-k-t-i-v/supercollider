
// player synth ///////////////////////////////////////

(
b = Buffer.read(s,Platform.resourceDir ++ "/sounds/mono/gqrx-20151121-040551.wav");
    ~three.ar(2);
    ~three.quant=2;
    ~three.fadeTime=2.02;
    ~three={
        var mod = 1;//[1,1.3333,1.5,2];
    var trate, dur, clk, pos, pan,sig;
    trate = 12;
    dur = BufDur.kr(b) / trate;
    clk = Impulse.kr(trate);
    pos = LFSaw.ar(1/400/[1,2,3,4]).range(1,BufDur.kr(b)) + TRand.kr(0, 0.01, clk);
    pan = WhiteNoise.kr(0.6);
    sig = TGrains.ar(2, clk, b.bufnum, mod, pos, dur, pan, 0.3);
    sig = sig * (LFTri.ar(1/16/[1,2,3,4])**4);
    sig = CompanderD.ar(sig,3/4,1/1.5,1/1.5);
    Splay.ar(sig.flat,0.5,0.15);
    };
    ~three.play;
);
~three.stop(7);
~three.clear;

(
    b = Buffer.read(s,Platform.resourceDir ++ "/sounds/mono/piano.wav");
    ~a.fadeTime=16;
    ~a.quant=2;
    ~a={
        var mod = 1/[1,1.3333,1.5,4];
        var trate, dur, clk, pos, pan,sig;
        trate = 120;
        dur = BufDur.kr(b) / trate;
        clk = Impulse.kr(trate);
        pos = LFSaw.ar(1/4000/[1,2,4,8]).range(0,BufDur.kr(b)) + TRand.kr(0, 0.01, clk);
        pan = WhiteNoise.kr(0.6);
        sig = TGrains.ar(2, clk, b.bufnum, mod, pos, dur, pan, 0.3);
        sig = sig * (LFTri.ar(1/16/[1,2,3,4])**4);
        sig = CompanderD.ar(sig,3/4,1/2,1/2);
        //sig = PitchShift.ar(sig,0.1,0.25);
        Splay.ar(sig,0.5,0.5);
    };
    ~a.play;
)
~a.stop



// player synth ///////////////////////////////////////

(
b = Buffer.read(s,Platform.resourceDir ++ "/sounds/mono/piano.wav");
    ~granular.ar(2);
    ~granular.quant=1;
    ~granular.fadeTime=2.02;
    ~granular={
    var mod = 1/[1,1.5,1.3333,2]/8;
    var trate, dur, clk, pos, pan,sig;
    trate = 120;
    dur = BufDur.kr(b) / trate;
    clk = Impulse.kr(trate);
    pos = LFSaw.ar(1/600/[1,2,4,8]).range(0,BufDur.kr(b)) + TRand.kr(0, 0.001, clk);
    pan = WhiteNoise.kr(0.6);
    sig = TGrains.ar(2, clk, b.bufnum, mod, pos, dur, pan, 0.3);
    sig = sig * (LFTri.ar(1/16/[1,2,3,4])**4);
    sig = CompanderD.ar(sig,3/4,1/2,1/2);
    Splay.ar(sig.flat,0.5,0.15);
    };
    ~granular.play;
);
~granular.stop(60);
~granular.clear;



// high synth ///////////////////////////////////////

(
~high.ar(2);
~high.quant=2;
~high.fadeTime=4;
~high={
  var sig = SinOsc.ar(12000/[1,1.5,1.3333],mul:0.3) * LFPulse.ar([8,7,6]);
  Splay.ar(sig,0.5,0.05);
};
~high.play;
);
~high.stop(4);
~high.clear;
~high.pause;
~high.resume;



// ff filter ///////////////////////////////////////

(
    ~ff.quant=1;
    ~ff.fadeTime=5;
    ~ff={
        var synths = p.playingProxies;
        var high,mid,low;
        var sig = [];
        synths.collect{|n| if(n!=\ff){sig=sig++p.[n.asSymbol];}};

        //sig = Resonz.ar(sig,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
        //sig = CombN.ar(sig,4,[4,8,16],32)+sig;
        //sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
        low = CompanderD.ar(RLPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/3,1/2);
        mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/2,1/2);
        high = CompanderD.ar(RHPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/2,1/2);
        sig = CompanderD.ar((high+mid+low).flat,3/4,1/2,1/2,0.002,0.3);
        sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),4000),2000);
        Splay.ar(sig,0.75,0.05);
    };
    ~ff.play;
);
~ff.stop(7);
~ff.clear;



