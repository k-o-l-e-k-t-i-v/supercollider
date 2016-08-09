
(
    p=ProxySpace.push(s.boot);
    p.makeTempoClock;
);


// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.quant=2;
    ~one.fadeTime=4;
    ~one={
        var octmod = Duty.kr(8,0,Dseq([1,0,1,0,2,0,4],inf));
        var origin = ([3,4,5,2]+octmod).octcps/TChoose.kr(Impulse.ar(1/2!4),[1,2,4,1,0.25,0.5]);
        var base = [origin,origin*1.5,origin*2,origin*1.3333] / TChoose.kr(Impulse.kr(1/4/[1,2,3,4]),[1,1,1.5,2,1.3333]);
        var mod = Duty.kr(Dseq([1,1,1,3,2]*4,inf)*(1..4),0,Dseq([1,2,1,1/2,1/4,1/8],inf));
        var sig = SinOsc.ar(base!2) * SinOsc.ar(base/3,Pulse.kr(4/(1..8))*8pi ) * SinOsc.ar(base/(1..8));
        sig = CombN.ar(sig,1/base,1/base*mod,1);
        sig = (Perlin3.ar(sig[0],sig[1],LFSaw.ar(1/60)*500)) ** LFDNoise1.kr(1/16!2).range(0.1,4) * 20;
        sig = SinOsc.ar(sig.range(base/2,base*4)+SinOsc.kr(1/4/[1,2,3,4],mul:3.1),Pulse.ar(4/[1,2,3,4]));
        sig = MoogFF.ar(sig,base/[1,2,0.5]/mod*4,2.5)*(LFTri.kr(1/4/[1,2,3,4])**3)+sig;
        sig = BPF.ar(sig,LFNoise2.kr(1/4).exprange(90.01,4900),0.15) * (LFTri.ar(sig,1/8/[1,2,3,4])**2) + LPF.ar(sig,800+LFDNoise1.kr(1/4!4).range(0,1000));
        sig = CombN.ar(sig,1/base,1/base*mod,4);
        sig = Normalizer.ar(sig);
        sig = Vibrato.ar(sig,[4,5,6,7],0.12);
        sig = GVerb.ar(sig,70,3)/8+sig;
	//u can have multichannels for various room sizes and also rev times. makes it more spacey. can't listen to this because old version..dammit
	//GVerb.ar(sig,[70,80,120],[3,4,5])
        sig = sig *  LFTri.ar(1/4.1/[1,2,3,4]).exprange(0.01,1);
        sig = AllpassN.ar(PitchShift.ar(sig,0.1,0.5),1,1,4) + sig;
        sig = CompanderD.ar(sig,3/4,1/2,1/2);
        Splay.ar(sig,0.75,0.15);
    };
    ~one.play;
);
~one.stop(30);
~one.clear;
~one.pause;
~one.resume;


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
        sig = CombN.ar(PitchShift.ar(sig,0.1,[1,0.75,1.5,4]),1,[1,2,4],4)+sig;
        //sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
        low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/2,1/2);
        mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/2,1/2);
        high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/2,1/2);
        sig = CompanderD.ar((high+mid+low).flat,3/4,1/2,1/2,0.002,0.3);
        sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),4000),2000);
        Splay.ar(sig,0.75,0.35);
    };
    ~ff.play;
);
~ff.stop(40);
~ff.clear;
