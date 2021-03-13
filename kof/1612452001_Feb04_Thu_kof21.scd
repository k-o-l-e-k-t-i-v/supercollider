
~tempo={100/60}

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
    var sig = LFSaw.ar([~tempo,~tempo/4,30]);
    sig = Perlin3.ar(sig[0].cos,sig[1],sin,sig[2].sin);
  Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
