

(
    p.clock.tempo_(240/60);

    ~offset = (0..7)/8;

    ~tick.quant = 1;
    ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

    ~counter = {PulseCount.kr(~tick.kr)};
);
// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.quant=2;
    ~one.fadeTime=4;
    ~one={
        var sig = LFNoise2.ar(16000);
        Splay.ar(sig,0.5,0.1);
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.quant=2;
    ~one.fadeTime=0.2;
    ~one={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = [
            LFNoise2.ar(1600) * Pulse.ar(8),
            LFNoise2.ar(16000) * Pulse.ar(4),
            LFNoise2.ar(600) * Pulse.ar(4),
            SinOsc.ar(15000/[1,2,1.5,4],mul:0.25),
            SinOsc.ar(500*1.125) * Pulse.ar(16),
            SinOsc.ar(50*4) * LFPulse.ar(2),
            SinOsc.ar(50*1.5/2),
            SinOsc.ar(50),
            SinOsc.ar(50*2),
        ];
        sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
        //sig = sig * env;
        Splay.ar(sig,0.75,0.1);
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

// saw synth ///////////////////////////////////////

(
    ~two.ar(2);
    ~two.quant=2;
    ~two.fadeTime=4;
    ~two={
        var sig = LFSaw.ar(43.2) * LFSaw.ar(4/[1,2,3,4]).exprange(0.001,1);
        Splay.ar(sig,0.5,0.4);
    };
    ~two.play;
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;

// three synth ///////////////////////////////////////

(
    ~three.ar(2);
    ~three.quant=2;
    ~three.fadeTime=0.2;
    ~three={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[2],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,5.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(50+(env**10*100));
        sig = sig * env;
        Splay.ar(sig,0.75,0.2);
    };
    ~three.play;
);
~three.stop(4);
~three.clear;
~three.pause;
~three.resume;

// ff filter ///////////////////////////////////////

(
    ~ff.quant=1;
    ~ff.fadeTime=1;
    ~ff={
        var high,mid,low;
        var sig = ~one.ar+~two.ar+~three.ar+~four.ar+~six.ar+~seven.ar;

        sig = Resonz.ar(sig,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
        sig = CompanderD.ar(sig,3/4,1/2,1/2);
        sig = CombN.ar(sig,4,[4,8,16],32)+sig;
        sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
        low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/2,1/2);
        mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/2,1/2);
        high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/2,1/2);
        sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
        Splay.ar(sig,0.75,0.1);
    };
    ~ff.play;
);
~ff.stop(7);
~ff.clear;
