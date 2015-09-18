

(
    p=ProxySpace.push(s.reboot);
);


// zeman synth ///////////////////////////////////////

(
    ~weirdo.quant=1;
    ~weirdo.fadeTime=0.02;
    ~weirdo={
        var sig = AudioIn.ar([0,1]);
        var pure = sig;
        sig = PitchShift.ar(sig,0.12,LFNoise2.kr(1/2).exprange(0.95,1.15));
        sig = GVerb.ar(HPF.ar(sig,100) + LPF.ar(sig,8000),[16,16],[5,6],spread:[50,90])/32 + sig;
        Splay.ar(sig.flat,0.25,1);
    };
    ~weirdo.play;
);
~weirdo.stop(7);
~weirdo.clear;

