


(
    p=ProxySpace.push(s.reboot);
    e=ProxySubmix.new(\filter);
);



// complex synth ///////////////////////////////////////

(
    ~complex.quant=1;
    ~complex.fadeTime=0.02;
    ~complex={
        var sig = LFSaw.ar(SinOsc.ar([1,2,3,4]/fib(21)).exprange(0.001,1).round(1/16pi)*20000+100*(1.001**(1..21)),mul:0.12);
        sig = Resonz.ar(sig,SinOsc.ar(1/4/fib(21)).range(40,12000));
        sig = AllpassC.ar(sig,SinOsc.ar(1/16/fib(21)).exprange(0.001,1),1/8,4);
        sig = BPF.ar(sig,12000/(1..21)+10,0.3) * SinOsc.ar(8/fib(21)).exprange(0.001,1);
        sig = sig * EnvGen.ar(Env([0,1,0],[1.002,2.75],[3,-3]),Impulse.ar(1/16,(0..23)/24));
        sig = CompanderD.ar(sig,4/3,1/3,1/2);

        sig = GVerb.ar(sig,10)/4+sig;
        Splay.ar(sig.flat,0.25,0.5);
    };
    e.addMix(~complex,postVol:true);
    ~complex.play;
);
~complex.stop(7);
~complex.clear;
