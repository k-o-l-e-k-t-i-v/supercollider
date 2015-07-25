

(
    p=ProxySpace.push(s.reboot);
    e=ProxySubmix.new(\filter);
);


// brown synth ///////////////////////////////////////

(
~brown.quant=1;
~brown.fadeTime=16.02;
~brown={
    var sig = Dust.ar(4320!2);
    sig = [] ++ LPF.ar(sig,120) ++ HPF.ar(sig,18000) ++ BPF.ar(sig,1800,0.2);
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1) * LFPulse.ar(LFDNoise1.ar(1!4)*111);
    sig = GVerb.ar(sig,[20,21,42,44])/4+sig;
    sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Mix.ar(sig) * 0.000025;
};
e.addMix(~brown,postVol:true);
~brown.play;
);
~brown.stop(7);
~brown.clear;


// click synth ///////////////////////////////////////

(
~click.quant=1;
~click.fadeTime=4.02;
~click={
    var sig = Decay.ar(Impulse.ar(1/8/[2,4,3],(0..3)/4),[0.1,0.5,1,8]);
    sig = SinOsc.ar(2000*[1,1.5,2,4]+((1..8)/10)+SinOsc.kr(11).range(-4,40),mul:0.2) * sig * LFPulse.ar(16/(1..8));
    sig = CombN.ar(sig,1/4,1/8,1/4);
  Mix.ar(sig) * 0.5;
};
e.addMix(~click,postVol:true);
~click.play;
);
~click.stop(7);
~click.clear;

// pulser synth ///////////////////////////////////////

(
    ~pulser.quant=1;
    ~pulser.fadeTime=8.02;
    ~pulser={
        var sig = WhiteNoise.ar(1!4);
        sig = Resonz.ar(sig,60.midicps*2/([1,2,4,8]*pi),0.2) * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
        Mix.ar(sig) * 0.000545;
    };
    e.addMix(~pulser,postVol:true);
    ~pulser.play;
);
~pulser.stop(2);
~pulser.clear;


// flt filter ///////////////////////////////////////

(
    ~flt.quant=1;
    ~flt.fadeTime=1;
    ~flt={
        var high,mid,low;
        var sig = e.ar;
        sig = GVerb.ar(sig,40)/16 + sig;
        low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
        mid = CompanderD.ar(BPF.ar(sig,2000,2),4/3,1/2,1/2);
        high = CompanderD.ar(HPF.ar(sig,4200),4/3,1/2,1/2);
        sig = CompanderD.ar((high+mid+low).flat,4/3,1/1.1,1/1.1);
        Splay.ar(sig,0.05,0.25);
    };
    ~flt.play;
);
~flt.stop(7);
~flt.clear;
