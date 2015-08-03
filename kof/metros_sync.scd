

(
    p=ProxySpace.push(s.reboot);
    e=ProxySubmix.new(\filter);
);

(
    var tempo = 2/3;
    var offset = (0..7)++[0.25,0.5,0.75]/8;
    (
        t = TempoClock.new(tempo);
        ~metro.quant = 1;
        ~metro = {Mix(Impulse.kr( tempo / 2 , offset ))};

        offset = (0..7)+0.498++0.5/8;
        ~metro2.quant = 1;
        ~metro2 = {Mix(Impulse.kr( tempo / 2 , offset ))};
    );


    // ss synth ///////////////////////////////////////

    (
        ~ss.quant=1;
        ~ss.fadeTime=0.02;
        ~ss={
            var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1],[3,-5]),~metro.kr);
            var env2 = EnvGen.ar(Env([0.001,1,0.001],[0.502,0.15],[3,-6]),~metro2.kr);
            var sig = SinOsc.ar([57,60]+(env**TExpRand.ar(20.001,100,~metro.kr)*800));
            sig = sig + (RHPF.ar(WhiteNoise.ar(env2**2/2),LFNoise2.kr(4!2).range(400,12000)) * LFSaw.ar(3/[1,2]));
            sig = sig + (SinOsc.ar(432/([1,2,1.5,1.25]*0.25pi) + SinOsc.kr(1/fib(4)).range(-4,4) + (env**0.1*20),mul:0.4) * LFSaw.ar(2/3/4/fib(4)).exprange(0.001,1) );
            sig = sig * env;
            Splay.ar(sig.flat,0.85,0.5);
        };
        e.addMix(~ss,postVol:true);
        ~ss.play;
    );


    // fil filter ///////////////////////////////////////

    (
        ~fil.quant=1;
        ~fil.fadeTime=1;
        ~fil={
            var high,mid,low;
            var sig = e.ar;
            sig = GVerb.ar(HPF.ar(sig,800),30)/4 + LPF.ar(sig,800);
            low = CompanderD.ar(LPF.ar(sig,800),3/4,1/3,1/2);
            mid = CompanderD.ar(BPF.ar(sig,1000,2),3/4,1/2,1/2);
            high = CompanderD.ar(HPF.ar(sig,1500),3/4,1/2,1/2);
            sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
            Splay.ar(sig,0.75,0.5);
        };
        ~fil.play;
    );
)
