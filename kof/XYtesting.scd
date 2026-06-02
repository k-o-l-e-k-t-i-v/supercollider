s.boot;
p.push();
~tempo={1.2}
p = ProxySpace.push(s);

(
~globalScopeListener.clear;
~globalScopeListener.ar(2);
~globalScopeListener = {
    var masterOuts = In.ar(0, 2);
    XYScope.ar(masterOuts[0], masterOuts[1]);
    0.0;
};
~globalScopeListener.play(to:\\end);
)

// perlin synth ///////////////////////////////////////

(
~perlin.ar(2);
~perlin.quant=4;
~perlin.fadeTime=2;
~perlin={
    var base = 220 * ([101,499.97,1.000102]/120**2+1);
    var sig = LFSaw.ar(base, mul:2pi);
    sig = Perlin3.ar(sig.cos,sig.sin,sig.sinh) * SinOsc.ar(base*2);
    sig = LPF.ar(sig,1900);
    sig = LeakDC.ar(sig);
    sig = CombL.ar(sig,1/base,2/base,1);
    sig = FreeVerb.ar(sig,0.1)+sig;
    sig = CompanderD.ar(sig,3/4,1,1);
    Splay.ar(sig,1,0.2);
};
~perlin.play;
);
~perlin.stop(4);
~perlin.clear;
~perlin.pause;
~perlin.resume;
