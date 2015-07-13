


(
    p=ProxySpace.push(s.reboot);
    e=ProxySubmix.new(\filter);
);



// complex synth ///////////////////////////////////////

(
    ~complex.quant=1;
    ~complex.fadeTime=0.02;
    ~complex={
        var sig = LFSaw.ar(SinOsc.ar([1,2,3,4]/fib(21)).exprange(0.001,1).round(1/128pi)*16000+10*(1.00001**(1..21)),mul:0.12);
        sig = Resonz.ar(sig,SinOsc.ar(1/4/fib(21)).range(40,8000));
        sig = AllpassC.ar(sig,SinOsc.ar(1/16/fib(21)).exprange(0.001,1),1/8,4);
        sig = BPF.ar(sig,22000/(1..21)+10,0.3) * SinOsc.ar(8/fib(21)).exprange(0.001,1);
        sig = sig * EnvGen.ar(Env([0,1,0],[1.002,2.75],[3,-3]),Impulse.ar(1/16,(0..23)/24));

        12.do{|i|
              sig = sig + BPF.ar(sig,18000/(i+1)+400,LFSaw.ar(1/4/i).exprange(0.001,1));
              sig = sig + CompanderD.ar(sig,1/2,1/SinOsc.ar(1/8/(i)).exprange(2.001,4),1/2)/2;
              sig = sig + Normalizer.ar(sig) / 3;
             };

        sig = RLPF.ar(sig,LFTri.ar(1/4/fib(21)).exprange(0.001,1)*8000+100) + (sig/2);


        sig = GVerb.ar(sig,10)/2+sig;

        Splay.ar(sig.flat,0.25,0.5);
    };
    e.addMix(~complex,postVol:true);
    ~complex.play;
);
~complex.stop(7);
~complex.clear;
