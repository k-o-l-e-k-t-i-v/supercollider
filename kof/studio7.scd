

(
    p=ProxySpace.push(s.reboot);
    e=ProxySubmix.new(\filter);
);



// lalala synth ///////////////////////////////////////

(
~lalala.quant=1;
~lalala.fadeTime=0.02;
~lalala={
    var sig = Dust.ar(1);
  sig = DelayN.ar(sig,1,1) + ~lalala.ar;
  Mix.ar(sig) * 0.9995;
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);
~lalala.stop(7);
~lalala.clear;

// random synth ///////////////////////////////////////

(
    ~random.quant=1;
    ~random.fadeTime=4.02;
    ~random={
        var sig = [] ++ LFSaw.ar(4320/[1,2,4,8]+(1..8)+SinOsc.ar(11/(1..8)).range(-4,4))++WhiteNoise.ar(1)++LFSaw.ar(90)++BrownNoise.ar(1);
        sig = LPF.ar(sig.scramble,800+LFSaw.ar(1/4).exprange(0.001,8000));
        sig = Select.ar(LFSaw.ar(1/5).exprange(0.001,sig.size+2),sig);
        sig = [] ++ WhiteNoise.ar(1)++SinOsc.ar(14000) ++ LFSaw.ar(44);
        sig = sig * EnvGen.ar(Env([0,1,0],[0.002,[0.5,4,0.1]/32],[3,-3]),CoinGate.kr(0.025,Impulse.kr(1,(0..15)/16)));
        sig = BPF.ar(sig,[80,8000,500,400]);
        sig = GVerb.ar(sig,[20,21])/4 + sig;
        sig = CompanderD.ar(sig,4/3,1/2,1/2);
        Mix.ar(sig) * 0.5;
    };
    e.addMix(~random,postVol:true);
    ~random.play;
);
~random.stop(7);
~random.clear;



// lala synth ///////////////////////////////////////

(
    ~lala.quant=1;
    ~lala.fadeTime=4.02;
    ~lala={
        var sig = SinOsc.ar(4320*1.5/([1,2,4,8]*pi)) * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
        sig = CombN.ar(sig,1,LFDNoise1.ar(1!4).range(0.02,2),4);
        sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
        sig = GVerb.ar(sig,[20,21])/2 + sig;
        sig = CompanderD.ar(sig,4/3,1/2,1/2);
        Mix.ar(sig) * 0.0025;
    };
    e.addMix(~lala,postVol:true);
    ~lala.play;
);
~lala.stop(7);
~lala.clear;



// lalala synth ///////////////////////////////////////

(
    ~lalala.quant=1;
    ~lalala.fadeTime=0.02;
    ~lalala={
        var sig = LFSaw.ar(50!2);
        sig = sig;
        Mix.ar(sig) * 0.5;
    };
    e.addMix(~lalala,postVol:true);
    ~lalala.play;
);
~lalala.stop(7);
~lalala.clear;
