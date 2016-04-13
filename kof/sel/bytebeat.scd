


(
    p=ProxySpace.push(s.reboot);
    p.makeTempoClock;
);


(
    p.clock.tempo_(60/60*4);

    ~offset = (0..7)/8;

    ~tick.quant = 1;
    ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

    ~counter = {PulseCount.kr(~tick.kr)};
    ~time = {LFSaw.kr(~tempo/4).range(0,1)};
)



// five synth ///////////////////////////////////////

(
    ~five.quant=4;
    ~five.fadeTime=4.2;
    ~five={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var mod = Select.kr(PulseCount.kr(hit)%4,[1,4,2,8]);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.25],[3,-3],curve:'exp'),imp * hit);


        var t = PulseCount.ar(Impulse.ar(44100/~tempo/[1,2,3,4]));

        var sig = LPF.ar(
            (  
                ((t<<1)**((t<<1)+(t>>7)&t>>12))|t>>(4-(1**7&(t>>19)))|t>>7
                - 3 % 256
            ) / 127-1 * 3
            , 8000
        ).distort * 0.2; 

        //sig = CombN.ar(sig,1/40,1/41,4)+sig;
        sig = LeakDC.ar(sig);
        sig = CompanderD.ar(sig,3/4,1/2,1/2);
        sig = Normalizer.ar(sig);
        //sig = sig * env;
        Splay.ar(sig,0.75,~n5);
    };
    ~five.play;
);
~five.stop(7);
~five.clear;


// kick synth ///////////////////////////////////////

(
    ~kick.quant=4;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(50 + (env**8*80));
        sig = sig * env;
        Splay.ar(sig,0.75,0.5);
    };
    ~kick.play;
);
~kick.stop(7);
~kick.clear;



// hh synth ///////////////////////////////////////

(
    ~hh.quant=4;
    ~hh.fadeTime=0.2;
    ~hh={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05],[3,-3],curve:'exp'),imp * hit);
        var sig = WhiteNoise.ar(1);
        sig = HPF.ar(sig,2000);
        sig = sig * env;
        Splay.ar(sig,0.75,0.25);
    };
    ~hh.play;
);
~hh.stop(7);
~hh.clear;


// filter filter ///////////////////////////////////////

(
    ~filter.quant=1;
    ~filter.fadeTime=1;
    ~filter={
        var high,mid,low;
        var sig = ~bytebeat + ~kick + ~hh;

        sig = GVerb.ar(LPF.ar(sig,3500)+HPF.ar(sig,200),40)/8 + sig;
        low = CompanderD.ar(LPF.ar(sig,400),3/4,1/2,1/2);
        mid = CompanderD.ar(BPF.ar(sig,500,2),3/4,1/2,1/2);
        high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
        sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
        Splay.ar(sig,0.75,0.05);
    };
    ~filter.play;
);
~filter.stop(7);
~filter.clear;



