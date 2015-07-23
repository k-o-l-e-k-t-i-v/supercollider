(
    p=ProxySpace.push(s.reboot);
);




// formant synth ///////////////////////////////////////

(
    ~formant.quant=1;
    ~formant.fadeTime=4.02;
    ~formant={
        var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.25],inf));
        var sig = Mix.fill(200,{|i| Formant.ar(43.20+(i*mod*43.2),43.20/(i*11),43.2/(i+1),mul:0.1)});
        sig = Normalizer.ar(sig);
        sig = LeakDC.ar(sig);
        sig = sig.softclip;


        sig = Resonz.ar(sig,2000*mod/8*(1..8),mul:LFSaw.ar(4/fib(8)).exprange(0.001,1));
        sig = LPF.ar(sig,12000*LFSaw.ar(1/4/fib(8)).exprange(0.001,1)+100);
        sig = GVerb.ar(sig,40)/2+sig;
        sig = CompanderD.ar(sig,4/3,1/2,1/2);
        sig = Limiter.ar(sig);
        Splay.ar(sig.flat,0.75,0.5);
    };
    ~formant.play;
);
~formant.stop(7);
~formant.clear;



