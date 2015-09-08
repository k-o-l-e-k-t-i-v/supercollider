


(
    p=ProxySpace.push(s.boot);
);

s.scope;

(
    ~bb.quant=2;
    ~bb.fadeTime=2;
    ~bb.play;
    ~bb = {
        var t = PulseCount.ar(Impulse.ar(22050/(1..16)))+1 % 441000;
        var sig = (((t * t) & (t + t)) / (1..4) | (t & t * (1..4))).lag(0.1) % 256 / 127;
        sig = LeakDC.ar(sig) * SinOsc.ar(44/(1..16));
        sig = Normalizer.ar(sig);// * LFTri.ar(11/fib(8)).exprange(0.0001,1);
        sig = Resonz.ar(sig,4000/16*(1..16));
        CompanderD.ar(sig,3/4,1/2,1/2);    
        Splay.ar(sig,0.25,0.5);
    };
)
