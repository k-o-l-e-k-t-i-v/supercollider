(
    p.clock.tempo_(120/60);

    ~offset = (0..7)/8;

    ~tick.quant = 1;
    ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

    ~counter = {PulseCount.kr(~tick.kr)};
);

m=ProxyMixer(p,16);

// three synth ///////////////////////////////////////

(
    ~three.ar(2);
    ~three.quant=2;
    ~three.fadeTime=0.2;
    ~three={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0,1,0,0,0,1,0,0,0,1,1,0,0,1,0,1,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[2,2,1,1],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
        var env = EnvGen.ar(Env([0.01,1,0.0001],[0.005,0.25],[6,-3],curve:'exp'),imp * hit);
        var sig = LFNoise1.ar(16000/[1,4,8,16]) * Crackle.ar([0.1,0.7,0.4,0.6]+env);
        sig = sig * env;
        Splay.ar(sig,0.75,~n3);
    };
    ~three.play;
);
~three.stop(4);
~three.clear;
~three.pause;
~three.resume;



// one synth ///////////////////////////////////////

(
    ~one.quant=4;
    ~one.fadeTime=1.2;
    ~one={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
        var mld = Duty.kr(4,0,Dseq([1,2,1.5,1.25],inf)) ;
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
        var mod = Select.kr(PulseCount.kr(hit)/4%4,[1,4,2,8]);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.005,0.5],[3,-3],curve:'exp'),imp * hit);


        var t = PulseCount.ar(Impulse.ar(22050/[1,1.5,1.25,4/3]));

        var sig = LPF.ar(
            (  
                ((t<<1)**((t<<1)+(t>>7)&t>>[12,13,25,2]))|t>>(4-(1**7&(t>>[19,16,43,2])))|t>>[5,6,7,8]
                - 3 % 256
            ) / 127-1 * 3
            , 12000
        ).distort * 0.6; 

        //sig = CombN.ar(sig,1/40,1/41,4)+sig;
        //sig = LeakDC.ar(sig);
        sig = CompanderD.ar(sig,3/4,1/3,1/2);
        sig = Normalizer.ar(sig);
        sig = PitchShift.ar(sig,0.25,2/[1,1.5,1.25,1.33333]);
        sig = sig * env;
        Splay.ar(sig,0.75,~n1);
    };
    ~one.play;
);
~one.stop(7);
~one.clear;


// four synth ///////////////////////////////////////

(
    ~four.ar(2);
    ~four.quant=2;
    ~four.fadeTime=0.2;
    ~four={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.00001,1,0.6,0.00001],[0.25,0.25*1.628,0.25]*LFNoise2.ar(4!16),[3,1,-3],curve:'exp'),imp * hit);
        var base = 60.midicps*2pi;
        var sig = 
        SinOsc.ar(base/(2*[1,2,3,4].reciprocal**2),mul:0.2) ++
        LFSaw.ar(base/(4*[1,2,3,4].reciprocal**1.5),mul:0.2) ++
        VarSaw.ar(base/(8*[1,2,3,4].reciprocal**1.25),mul:0.2) ++
        LFNoise2.ar(base*(1..16),mul:0.2);

        env = env * LFNoise2.kr(1/4!16) * LFNoise2.ar(200!16);
        sig = Resonz.ar(sig,LFNoise2.kr(4!16).range(base/4,base*4))*8;
        sig = Select.ar(PulseCount.kr(imp*hit)%sig.pyramid.size,sig.pyramid.scramble);
        sig = sig * env;
        Splay.ar(sig.flat,0.15,~n4);
    };
    ~four.play;
);
~four.stop(4);
~four.clear;
~four.pause;
~four.resume;



// five synth ///////////////////////////////////////

(
    ~five.quant=2;
    ~five.fadeTime=0.2;
    ~five={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[4,4,3,1],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.25],[3,-3],curve:'exp'),imp * hit);
        var sig = Crackle.ar([0.2,0.3,0.4,0.5]+env);
        sig = sig * env;
        Splay.ar(sig,0.75,~n5);
    };
    ~five.play;
);

// two synth ///////////////////////////////////////

(
    ~two.ar(2);
    ~two.quant=2;
    ~two.fadeTime=0.2;
    ~two={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0,1,0,0,0,1,0,0,0,1,1,0,0,1,0,1,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[4,4,2,1],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
        var env = EnvGen.ar(Env([0.00001,0.99,0.00001],[0.002,1.75],[10,-4],curve:'exp'),imp * hit);
        var sig = SinOsc.ar([44,45,46,47]+(env**20*1000),-pi,mul:env**0.95) + PinkNoise.ar((env**4)!2);
        sig = LPF.ar(sig,LFNoise2.kr(1/4!4).range(1,10000)*(env**2)+200);
        sig = sig * env;
        sig = CompanderD.ar(sig,3/4,1/2,1/2,0.01,0.1);
        Splay.ar(sig,0.15,~n2);
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
    ~four.ar(2);
    ~four.quant=2;
    ~four.fadeTime=2.02;
    ~four={
        var mod = [1,0.5,-2,-0.75]/4;//[1,1.5,1.25,4/3];//[-1,0.25,-0.25,1/8,1/16];
        var spread = 0.0;
        var pos = [0,0.25,0.25,0.33];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[2,1,2,1],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)/[1,3,1,4]%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.75],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);

        sig = sig * env;
        Splay.ar(sig.flat,0.5,~n4);
    };
    ~four.play;
);
~four.stop(7);
~four.clear;


// six synth ///////////////////////////////////////

(
    ~six.ar(2);
    ~six.quant=2;
    ~six.fadeTime=4;
    ~six={
        var f = 432.0/([1,2,4,1.5,4/3,1.25].scramble*[0.5,0.25]*pi)/([1,2,1.5,4/3,4].choose);
        var sig = SinOsc.ar(f,[0,pi]) + LFSaw.ar(f,[0,1]) + Pulse.ar(f) + BrownNoise.ar(0.6);
        sig = sig * LFTri.ar(1/fib(16)).exprange(0.001,1);
        sig = Resonz.ar(sig,gg=Gf+SinOsc.kr(f/10.001/fib(16).scramble).range(f/1.025,f*1.025),0.005+LFNoise2.kr(1/4!16).exprange(0.001,0.5))*4;
        sig = CombN.ar(sig,1,1.001,4)/4+sig;
        sig = AllpassN.ar(sig,1.1,[2,2.01],4)/4 + sig;
        sig = CompanderD.ar(sig,3/4,1/2,1/2);
        Splay.ar(sig,0.5,~n6);
    };
    ~six.play;
    ~reb={loop{~six.rebuild;16.wait;}}.fork;
);
~six.stop(4);
~six.clear;
~six.pause;
~six.resume;





