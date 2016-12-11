

(
    p=ProxySpace.push(s.boot);
    p.makeTempoClock;
);



(
    p.clock.tempo_(120/60);

    ~offset = (0..7)/8;

    ~tick.quant = 1;
    ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

    ~counter = {PulseCount.kr(~tick.kr)};
);


b = Buffer.read(s,"/home/kof/marimba.wav");

// player synth ///////////////////////////////////////

(
    ~five.ar(2);
    ~five.quant=2;
    ~five.fadeTime=2.02;
    ~five={
        var mod = 1;
        var spread = 0.0;
        var pos = (1..4)/16 + LFSaw.ar(1/1600);
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);

        sig = sig * env;
        Splay.ar(sig.flat,0.5,~n5);
    };
    ~five.play;
);
~five.stop(7);
~five.clear;


b = Buffer.read(s,"/home/kof/vendula.wav");

// player synth ///////////////////////////////////////

(
    ~six.ar(2);
    ~six.quant=2;
    ~six.fadeTime=2.02;
    ~six={
        var mod = 1*((1..16).reciprocal);
        var spread = 0.0;
        var pos = (1..4)/80+LFSaw.ar(1/100);
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[1.202,1.25],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);

        sig = sig * env;
        //sig = CompanderD.ar(sig,3/4,1/2,1/2);
        Splay.ar(sig[0]!2,0.05,~n6);
    };
    ~six.play;
);
~six.stop(7);
~six.clear;


// two synth ///////////////////////////////////////

(
    ~two.ar(2);
    ~two.quant=2;
    ~two.fadeTime=0.2;
    ~two={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[4,4,8,16],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,5.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(50+(env**10*100));
        sig = sig * env;
        Splay.ar(sig,0.75,~n2);
    };
    ~two.play;
);
~two.pause;
~two.resume;
~two.stop;

// ff filter ///////////////////////////////////////

(
    ~ff.quant=1;
    ~ff.fadeTime=1;
    ~ff={
        var high,mid,low;
        var sig = ~smp.ar + ~marimba.ar;

        sig = GVerb.ar(LPF.ar(sig,5000)+HPF.ar(sig,500),40,[3,4,5,6],spread:[40,90])/8 + sig;
        low = CompanderD.ar(LPF.ar(sig,400),3/4,1/2,1/2);
        mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
        high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
        sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
        Splay.ar(sig,0.75,0.25);
    };
    ~ff.play;
);
~ff.stop(7);
~ff.clear;

// three synth ///////////////////////////////////////

(
    ~three.ar(2);
    ~three.quant=2;
    ~three.fadeTime=0.2;
    ~three={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = LFNoise2.ar(15000);
        sig = sig * env;
        Splay.ar(sig,0.75,~n3);
    };
    ~three.play;
);
~three.stop(7);
~three.pause;
~three.resume;

// four synth ///////////////////////////////////////

(
    ~four.ar(2);
    ~four.quant=2;
    ~four.fadeTime=4.2;
    ~four={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
        var sig = AudioIn.ar([0,1])*1;
        //sig = Normalizer.ar(sig);
        sig = CompanderD.ar(sig,3/4,1/3,1/2);
        sig = PitchShift.ar(sig,0.025,[1,1,1.25,0.5,4],0.001,0.1);
        sig = Limiter.ar(sig);
        sig = CombN.ar(sig,1,1/[1,2,4,8,16],64)+sig;
        sig = LPF.ar(sig,[5000,2500,1500,10000]);
        // sig = Greyhole.ar(sig)/4+sig;
        sig = sig * env;
        Splay.ar(sig,0.25,0.2);
    };
    ~four.play;
);
~four.stop(4);
~four.clean;
~four.pause;
~four.resume;


(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
)

(
    p=ProxySpace.push(s.reboot);
    p.makeTempoClock;
);
