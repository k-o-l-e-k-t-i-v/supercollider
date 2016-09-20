



(
    b = Buffer.alloc(s,2048,1);
    ~a.ar(2);
    ~a.quant=2;
    ~a.fadeTime=8;
    ~a.mold(2);
    ~a =  { var in, chain,sig;
        var mel = [1.5,1.3333,1,2].choose;//Duty.kr(1/50,0,Dseq([1,2,1.5,1.33333],inf));
        var mod = SinOsc.ar(1/50,mul:0.05);
        var t = LFSaw.ar([1/16,1/4000,60/mel]) * 480 * (LFTri.ar(1/32)**2);
        in = Perlin3.ar(t[0],t[1],t[2]);
        in = Normalizer.ar(in) + RLPF.ar(Pulse.ar(4),8000);
        chain = FFT(b.bufnum, in) ;
        chain = PV_MagFreeze(chain, Decay.kr(Dust.kr(0.15),0.1) ); 
        chain = PV_BrickWall(chain, mod); 
        chain = PV_MagShift(chain, 0.5 ); 
        //chain = PV_MagShift(chain, MouseX.kr(0.25, 4, \exponential) ); 
        chain = IFFT(chain);

        sig = chain;
        //chain = DelayN.ar(chain,1/5000,1/5000);
        //chain = LPF.ar(chain,8000);
        //LocalOut.ar(chain/1.007);

        sig = LPF.ar(sig,18000);
        sig = HPF.ar(sig,40);
        //sig = Normalizer.ar(sig)/2;
        //sig = CombL.ar(sig,1/[4,4.1],[1,2,3,4],4);
        sig = AllpassN.ar(sig,1/[100,101],1/5,4);
        sig = CombL.ar(sig,1/60*mel,1/60*mel,4);
        sig = CompanderD.ar(sig,3/4,1/3,1/10,0.002);
        Splay.ar(sig,0.99,0.25);

    };
    //~a.play;
    z=Tdef(\reb,{loop{ ~a.rebuild; 16.wait;}});
    z.play();
)


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
    ~kick.quant=[2,-0.01];
    ~kick.fadeTime=0.02;
    ~kick={
        //         |       |       |       |       |  
        var pat = [
            1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
            1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
            1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
            1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0,
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.00002,2.5],[3,-3],curve:'exp'),imp * hit);
        var sig = Mix.fill(10,{|n| SinOsc.ar(50+(n/100),env**(50+(n*2))*8pi) + WhiteNoise.ar(env**40)});
        //sig= Limiter.ar(sig,0.9);
        sig = sig * env;
        sig = sig.softclip;
        Splay.ar(sig,0.05,0.25);
    };
    ~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;

// kick synth ///////////////////////////////////////

(
    ~kicksup.ar(2);
    ~kicksup.quant=[2,-0.01];
    ~kicksup.fadeTime=0.02;
    ~kicksup={
        //         |       |       |       |       |  
        var pat = [
            0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,
            0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,
            0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,
            0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,8,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.000001,1,0.0001],[4.00002,0.005],[3,-3],curve:'exp'),imp * hit);
        var sig = Mix.fill(10,{|n| SinOsc.ar(50+(n/100),env**(10+(n*5))*8pi) + WhiteNoise.ar(env**4)});

        sig = sig * env;
        Splay.ar(sig,0.05,0.85);
    };
    ~kicksup.play;
);
~kicksup.stop(4);
~kicksup.clear;
~kicksup.pause;
~kicksup.resume;


// hat synth ///////////////////////////////////////

(
    ~hat.ar(2);
    ~hat.quant=[2,1/2];
    ~hat.fadeTime=0.2;
    ~hat={
        //         |       |       |       |       |  
        var pat = [
            1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,
            1,0,1,0,1,0,1,0,1,0,1,0,1,1,1,1,
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[1,2,4,5],~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15*[1,2,3,4]],[3,-3],curve:'exp'),imp * hit);
        var sig = WhiteNoise.ar(0.7!4) + GrayNoise.ar(0.7!2);
        sig = RHPF.ar(sig,[5000,8000,12000,15000],0.2);
        sig = sig * env;
        Splay.ar(sig,0.05,0.92);
    };
    ~hat.play;
);
~hat.stop(4);
~hat.clear;
~hat.pause;
~hat.resume;

// kick2 synth ///////////////////////////////////////

(
    ~kick2.ar(2);
    ~kick2.quant=[2,1/4];
    ~kick2.fadeTime=0.2;
    ~kick2={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[2,4],~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[[0.2502,0.99],1/40],[3,-3],curve:'exp'),imp * hit);
        //var sig = Mix.fill(10,{|n| SinOsc.ar(50!2,env**(n+10)*8pi)});
        var sig = ~a.ar;
        sig = sig * env;
        Splay.ar(sig,0.85,0.85,SinOsc.ar(1/[4,5])/2);
    };
    ~kick2.play;
);
~kick2.stop(4);
~kick2.clear;
~kick2.pause;
~kick2.resume;

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
        //sig = GVerb.ar(LPF.ar(sig,4000)+HPF.ar(sig,300),[60,99],[3,4],spread:[95,96])/4 + sig;
        low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(300,8000)),3/4,1,1/2);
        mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(300,6500),0.13),3/4,1,1/2);
        high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,7000)),3/4,1,1/2);
        sig = CompanderD.ar((high+mid+low).flat,3/4,1,1/10,0.002,0.3);
        sig = LPF.ar(DWGReverb.ar(HPF.ar(NumChannels.ar(sig,2),200),[4000,4010]),4000)/2+sig;
        Splay.ar(sig,0.95,0.25);
    };
    ~ff.play;
);
~ff.stop(7);
~ff.clear;

b.free;
