



//sometime it is good to be silent ;)
//sometimes it is not

(
~simple = {
    var sig = LFSaw.ar(500+(1..8),mul:0.1),
    0.2,mul:0.3) * LFSaw.kr(1/4)};
    Splay.ar(sig,0.2,0.2);
)
    ~simple.quant=2;
~simple.play;


~simple.stop(6)
