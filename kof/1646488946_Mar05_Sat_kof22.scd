



p.push();
~tempo={LFNoise1.kr(~tempo*4).range(120,121.35)};

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=8;
~one.fadeTime=10.2;
~one={
    var sig = LFSaw.ar([~tempo*4/[1,2,3,4],~tempo/24*[1,2,3,4],[50,60]+Pulse.ar(~tempo*4/[1,2,3,4]) ]).range(0,2pi).sin + 1;
    sig = sig /.x LFSaw.ar(~tempo/[4,2,1]).exprange(24.00001,1/24);
    sig = Perlin3.ar(sig[0],sig[1],sig[2]) * Pulse.ar(~tempo*4/[1,2,4,3]) + (HPF.ar(sig,18000)*CombL.ar(Pulse.ar(~tempo*4/[1,2,3,4]),24/~tempo,48/~tempo,~tempo));
    sig = CombL.ar(sig,4/~tempo,2/~tempo,~tempo*4);
    sig = HPF.ar(GVerb.ar(sig,[10,10],[3,6]),14000)/4 + HPF.ar(sig,1500) - LPF.ar(sig,250);
    sig = Pulse.ar(~tempo) / sig + sig;
    Splay.ar(sig,0.95,0.00125);
};
~one.play;
);
~one.stop(40);
~one.clear;
~one.pause;
~one.resume;
