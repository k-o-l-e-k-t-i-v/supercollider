

(
    p=ProxySpace.push(s.boot);
    p.makeTempoClock;
);


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
    ~one.fadeTime=0.2;
    ~one={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.25],[3,-3],curve:'exp'),imp * hit);
        var sig = [
            SinOsc.ar(50!2),
            LFNoise2.ar(5000),
            SinOsc.ar(4320),
            LFNoise2.ar(500)
        ];
        sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
        sig = sig * env;
        Splay.ar(sig,0.15,~n1);
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
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,3.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(50+(env**10*100));
        sig = sig * env;
        Splay.ar(sig,0.15,~n2);
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
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = WhiteNoise.ar(0.5!2);
        sig = sig * env;
        Splay.ar(sig,0.75,~n3);
    };
    ~three.play;
);
~three.stop(4);
~three.clear;
~three.pause;
~three.resume;



// four synth ///////////////////////////////////////

(
    ~four.ar(2);
    ~four.quant=2;
    ~four.fadeTime=0.2;
    ~four={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.502,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(432/[1,1.5,2,1.25]*((~n7*8).round(0.25))) + SinOsc.ar(1/[1,2,3,4]).range(-pi,pi);
        sig = sig * env;
        Splay.ar(sig,0.75,~n4);
    };
    ~four.play;
);
~four.stop(4);
~four.clear;
~four.pause;
~four.resume;


// five synth ///////////////////////////////////////

(
    ~five.ar(2);
    ~five.quant=2;
    ~five.fadeTime=0.2;
    ~five={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = [
            SinOsc.ar(15000),
            SinOsc.ar(15000/2),
            SinOsc.ar(15000/1.5),
            SinOsc.ar(15000/1.25),
        ];
        sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
        sig = sig * env;
        Splay.ar(sig,0.75,~n5);
    };
    ~five.play;
);
~five.stop(4);
~five.clear;
~five.pause;
~five.resume;



// six synth ///////////////////////////////////////

(
    ~six.ar(2);
    ~six.quant=2;
    ~six.fadeTime=0.2;
    ~six={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = Crackle.ar([0.1,0.3,0.4,0.7]+env);
        sig = sig * env;
        Splay.ar(sig,0.75,~n6);
    };
    ~six.play;
);
~six.stop(4);
~six.clear;
~six.pause;
~six.resume;

// ff filter ///////////////////////////////////////

(
    ~ff.quant=1;
    ~ff.fadeTime=1;
    ~ff={
        var high,mid,low;
        var sig = ~one.ar + ~two.ar + ~three.ar + ~four.ar + ~five.ar + ~six.ar;

        sig = GVerb.ar(LPF.ar(sig,5000)+HPF.ar(sig,500),40,[3,4,5,6],spread:[40,90])/8 + sig;
        low = CompanderD.ar(LPF.ar(sig,400),3/4,1/2,1/2);
        mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
        high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
        sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
        Splay.ar(sig,0.75,~n8);
    };
    ~ff.play;
);
~ff.stop(7);
~ff.clear;



