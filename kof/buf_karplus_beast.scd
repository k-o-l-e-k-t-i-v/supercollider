RecordBuf.help
i

(
    p=ProxySpace.push(s.reboot);
    p.makeTempoClock;
);

b = Buffer.alloc(s, 44100 * 16.0, 2);


// karplus_beast synth ///////////////////////////////////////

(
    ~karplus_beast.ar(2);
    ~karplus_beast.quant=2;
    ~karplus_beast.fadeTime=4.1;
    ~karplus_beast={
        var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.33333],inf));
        var t = LFTri.ar([1/16,1/320,50*mod]) * 1/4 + LFTri.ar(1/400,mul:4);
        var sig = RLPF.ar(Perlin3.ar(t[0],t[1],t[2]),LFNoise1.ar(1/16!2).range(50,15000)) + LocalIn.ar(2);
        sig = Normalizer.ar(sig);
        DelayN.ar(sig,1/50,1/50);
        sig = LPF.ar(sig,LFNoise2.kr(1/4!2).range(500,15000));
        LocalOut.ar(sig/1.001);
        RecordBuf.ar(sig,b.bufnum,1,0.33,loop:1);
        sig = PlayBuf.ar(2,b.bufnum,LFTri.ar(4/[1,2,3,4]).exprange(1.00001,1.021),loop:1);
        
        sig = sig * (LFTri.ar(1/4/[1,2,3,4])**5);
        sig = CompanderD.ar(sig,3/4,1/2,1/2);
        sig = LeakDC.ar(sig);
        Splay.ar(sig,0.5,0.95,SinOsc.kr(3)/4);
    };
    ~karplus_beast.play;
    ~karplus_beast[10] = \filter -> {|sig| DWGReverb.ar(LPF.ar(HPF.ar(sig,LFNoise2.kr(1/16!2).range(50,1300)),LFNoise2.kr(1/16!2).range(3500,7500)),[4000,4100],1/[30,31])+sig};
);
~karplus_beast.stop(4);
~karplus_beast.clear;
~karplus_beast.pause;
~karplus_beast.resume;

DWGReverb.help

PlayBuf.help


// sinsin synth ///////////////////////////////////////

(
~sinsin.ar(2);
~sinsin.quant=2;
~sinsin.fadeTime=4;
~sinsin={
  var sig = SinOsc.ar(50!2) * SinOsc.ar(1/4) + (CombN.ar(BrownNoise.ar(1/40)*Pulse.ar(1/4),1/5,1/49,4));
  Splay.ar(sig,0.5,0.25);
};
~sinsin.play;
    ~sinsin[10] = \filter -> {|sig| DWGReverb.ar(LPF.ar(HPF.ar(sig,300),5500),[4000,4100],1/30)+sig};
);
~sinsin.stop(4);
~sinsin.clear;
~sinsin.pause;
~sinsin.resume;
