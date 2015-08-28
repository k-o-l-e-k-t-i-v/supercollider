



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


    ~src_noise={
        var sig = WhiteNoise.ar(LFNoise2.kr(~tempo/4!2));
        Splay.ar(sig);
    };

    (
        ~one.play;
        ~one.quant=4;
        ~one.fadeTime=4;
        ~one = {
            var sig = ~src_noise.ar;
            sig = CombN.ar(sig,1,0.5+~kick.kr.range(0.001,1),4);
            sig = RLPF.ar(sig,LFSaw.ar(~tempo*16/fib(12)).exprange(100.01,1600))*0.42;
            sig = Resonz.ar(sig,[60,64,67].midicps,0.02+LFSaw.kr(~tempo*8/fib(8)).range(0.001,0.55));
            sig = GVerb.ar(sig,60,[2,3,4],spread:[60,90]);
            sig = Normalizer.ar(sig)/16;
            sig = HPF.ar(sig,200+~kick.ar.lag(0.01).range(0,10000));
            sig = CompanderD.ar(sig,3/4,1/2,1/2);
            Splay.ar(sig,0.5,0.5);

        };
    );
)

//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
(
    // hh synth ///////////////////////////////////////

    (
        ~hh.quant=4;
        ~hh.fadeTime=12.2;
        ~hh={
            //         |       |       |       |       |  
            var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
            var imp = PulseDivider.kr(~tick.kr,1*[2,32,64],~counter.kr);
            var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
            var env = EnvGen.ar(Env([0.001,1,0.001],[0.002+[0,0,4],0.05+[0.01,0.1,4]],[3,-3],curve:'exp'),imp * hit);
            var sig = WhiteNoise.ar(1);
            sig = HPF.ar(sig,[1800,8000,15000]);
            sig = sig * env;
            Splay.ar(sig,0.75,0.5);
        };
        ~hh.play;
    );

    // tone synth ///////////////////////////////////////

    (
        ~tone.quant=4;
        ~tone.fadeTime=12.2;
        ~tone={
            //         |       |       |       |       |  
            var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
            var imp = PulseDivider.kr(~tick.kr,32*fib(4),~counter.kr);
            var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
            var ff = Select.kr(PulseCount.kr(imp)/4%4,[60,67,64,60]);
            var env = EnvGen.ar(Env([0.001,1,0.001],[4.002,4.5],[3,-3],curve:'exp'),imp * hit);
            var sig = SinOsc.ar(ff.midicps+SinOsc.ar(90*env).range(-10*env,10*env),0.2);
            sig = sig * env;
            Splay.ar(sig,0.75,0.5);
        };
        ~tone.play;
    );

    // kick synth ///////////////////////////////////////

)


//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

(
    (
        ~kick.quant=4;
        ~kick.fadeTime=4.2;
        ~kick={
            //         |       |       |       |       |  
            var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
            var imp = PulseDivider.kr(~tick.kr,[2,32,64],~counter.kr);
            var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
            var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5*[1,2,3]],[3,-3],curve:'exp'),imp * hit);
            var sig = SinOsc.ar(60.midicps/[4,8,16]+(env**20*250));
            sig = sig * env;
            Splay.ar(sig,0.75,0.75);
        };
        ~kick.play;
    );


    // ff filter ///////////////////////////////////////

    (
        ~ff.quant=1;
        ~ff.fadeTime=1;
        ~ff={
            var high,mid,low;
            var sig = ~kick+(~one/2)+~tone + ~hh;

            sig = GVerb.ar(LPF.ar(sig,5000)+HPF.ar(sig,500),60,[3,4,5,6],spread:[40,90])/8 + sig;
            low = CompanderD.ar(LPF.ar(sig,400),3/4,1/3,1/2);
            mid = CompanderD.ar(BPF.ar(sig,800,2),3/4,1/2,1/2);
            high = CompanderD.ar(HPF.ar(sig,900),3/4,1/1,1/2);
            sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
            Splay.ar(sig,0.75,0.25);
        };
        ~ff.play;
    );

)
