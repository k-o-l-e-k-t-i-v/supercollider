p.clean;
p.arProxyNames.collect{|n| var snth = (p[n.asSymbol]);snth.clear};
p.arProxyNames.collect{|n| var snth = (p[n.asSymbol]);snth.play};
p.arProxyNames.collect{|n| var snth = (p[n.asSymbol]);if(n.asSymbol!=\ff){snth.stop(15)}};
p.arProxyNames.collect{|n| var snth = (p[n.asSymbol]);if(true){snth.stop(15)}};



(
    p.clock.tempo_(2);

    ~offset = (0..7)/8;

    ~tick.quant = 1;
    ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

    ~counter = {PulseCount.kr(~tick.kr)};
);


// ff filter ///////////////////////////////////////

(
    ~ff.quant=1;
    ~ff.fadeTime=1;
    ~ff={
        var high,mid,low;
        var sig = ~one.ar + ~two.ar + ~three.ar + ~four.ar + ~five.ar + ~six.ar + ~seven.ar;
        //sig = Resonz.ar( ~ssmp.ar + ~hh.ar + ~kick.ar + ~ss.ar + ~one.ar,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
        sig = Resonz.ar(sig,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
        sig = CompanderD.ar(sig,3/4,1/2,1/2);
        //sig = Limiter.ar(sig.tanh,0.51);
        sig = CombN.ar(sig,4,[4,8,16],32)+sig;
        //sig = CombN.ar(sig,1/4,1/LFNoise0.kr(4!16).range(1,800).round(2pi),8)/16+sig;
        sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
        low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/2,1/2);
        mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/2,1/2);
        high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/2,1/2);
        sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
        Splay.ar(sig,0.25,~n8);
    };
    ~ff.play;
);
~ff.stop(7);
~ff.clear;

// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.quant=2;
    ~one.fadeTime=2.2;
    ~one={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,fib(16,4,8),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.00001],[0.02,0.175],[4,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(50+(env**50+Pulse.ar(500*(1..16).reciprocal*(env**50+1))*5000));
        sig = CombN.ar(sig,1/4,1/4/fib(16),8);
        sig = Normalizer.ar(sig,1,0.04);
        sig = sig * env;
        Splay.ar(sig,0.75,~n1);
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

// two synth ///////////////////////////////////////

(
    ~two.ar(2);
    ~two.quant=2;
    ~two.fadeTime=0.2;
    ~two={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[4,4,2,1],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.00001],[0.002,3.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(50+(env**50*500));
        sig = sig * env;
        Splay.ar(sig,0.25,~n2);
    };
    ~two.play;
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;



b = Buffer.read(s,Platform.resourceDir ++ "/sounds/beat2.wav");

// player synth ///////////////////////////////////////

(
    ~three.ar(2);
    ~three.quant=2;
    ~three.fadeTime=2.02;
    ~three={
        var mod = [1,-1];//[-1,0.25,-0.25,1/8,1/16];
        var spread = 0.0;
        var pos = 1/(1..16)/MouseX.kr(1,16);
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,(16..1),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.00001],[0.002,1.5/(1..16)],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);

        sig = sig * env;
        Splay.ar(sig.flat,0.5,~n3);
    };
    ~three.play;
);
~three.stop(7);
~three.clear;
// four synth ///////////////////////////////////////

(
    ~four.ar(2);
    ~four.quant=2;
    ~four.fadeTime=0.2;
    ~four={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,(1..16),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.00001],[0.002,0.15*(1..16)],[3,-3],curve:'exp'),imp * hit);
        var sig = LFNoise2.ar(16000/fib(16));

        sig = sig * env;
        sig = CombN.ar(sig,1/4,1/fib(16),8);
        sig = Normalizer.ar(sig,1,0.04);
        sig = sig * env;
        Splay.ar(sig,0.75,~n4);
    };
    ~four.play;
);
~four.stop(4);
~four.clear;
~four.pause;
~hh.resume;

(
    ~five.ar(2);
    ~five.quant=2;
    ~five.fadeTime=4;
    ~five={
        var f = 432.0/([1,2,4,1.5,4/3,1.25].scramble*[0.5,0.25]*pi)/([1,2,1.5,4/3,4].choose);
        var sig = SinOsc.ar(f,[0,pi]) + LFSaw.ar(f,[0,1]) + Pulse.ar(f) + BrownNoise.ar(0.6);
        sig = sig * LFTri.ar(1/fib(16)).exprange(0.001,1);
        sig = Resonz.ar(sig,f+SinOsc.kr(f/10.001/fib(16).scramble).range(f/1.025,f*1.025),0.005+LFNoise2.kr(1/4!16).exprange(0.001,0.5))*4;
        sig = CombN.ar(sig,1,1.001,4)/4+sig;
        sig = AllpassN.ar(sig,1.1,[2,2.01],4)/4 + sig;
        sig = CompanderD.ar(sig,3/4,1/2,1/2);
        Splay.ar(sig,0.5,~n5);
    };
    ~five.play;
);
~five.stop(4);
~five.clear;
~five.pause;
~five.resume;


m={loop{~five.rebuild;4.wait;}}.fork;
m.stop;


