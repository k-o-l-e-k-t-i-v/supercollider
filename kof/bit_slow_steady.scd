

(
    p.clock.tempo_(120/60);

    ~offset = (0..7)/8;

    ~tick.quant = 1;
    ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

    ~counter = {PulseCount.kr(~tick.kr)};
);



// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.quant=2;
    ~one.fadeTime=0.2;
    ~one={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]*2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.005,2.5],[3,-3],curve:'exp'),imp * hit);
        var sig = Dust.ar(4+LFSaw.ar(1/8).range(0,14000),mul:0.1) * ToggleFF.ar(hit*imp) + SinOsc.ar(50+(env**10*100));
        sig = Resonz.ar(sig,100/[1,2,1.25,1.33333],0.02) + sig;
        sig = Normalizer.ar(sig);
        sig = sig = sig + SinOsc.ar(50*[1,2,4,1.3333], SinOsc.ar(1/[1,2,3,4],mul:pi));// + (SinOsc.ar(50+(env**20*500)));
        sig = sig * env;
        Splay.ar(sig,0.75,0.25);
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


// sss synth ///////////////////////////////////////

(
    ~sss.ar(2);
    ~sss.quant=2;
    ~sss.fadeTime=0.2;
    ~sss={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
        var sig = [
            SinOsc.ar(100!2,SinOsc.kr(4)),
            LFSaw.ar(50!2),
            LFNoise2.ar(LFNoise2.kr(1/4).range(4000,16000)),
            Pulse.ar(4!2),
            SinOsc.ar(100!2,SinOsc.kr(4)),
            LFSaw.ar(100!2),
            LFNoise2.ar(LFNoise2.kr(1/4).range(400,16000)),
            Pulse.ar(2!2)
        ];
        sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
        sig = sig * env;
        sig = CombN.ar(sig,1/4,1/4,4);
        Splay.ar(sig,0.75,0.25,SinOsc.kr(~tempo/4)*2pi);
    };
    ~sss.play;
);
~sss.stop(4);
~sss.clear;
~sss.pause;
~sss.resume;

// ff filter ///////////////////////////////////////

(
    ~ff.quant=1;
    ~ff.fadeTime=1;
    ~ff={
        var synths = p.playingProxies;
        var high,mid,low;
        var sig = [];
        synths.collect{|n| if(n!=\ff){sig=sig++p.[n.asSymbol];}};

        sig = Resonz.ar(sig,LFNoise2.kr(1/16!2).range(100,10000),LFNoise2.kr(1/32!2).range(0.1,1) )/4;
        sig = CombN.ar(sig,1/4,[4,8,16],32)+sig;
        //sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
        sig = DWGReverb.ar(LPF.ar(Mix.ar(sig),8000),3000)/4+sig;
        sig = CompanderD.ar(sig,3/4,1/2,1/2);
        low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/2,1/2);
        mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/2,1/2);
        high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/2,1/2);
        sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
        Splay.ar(sig,0.75,0.25);
    };
    ~ff.play;
);
~ff.stop(7);
~ff.clear;
