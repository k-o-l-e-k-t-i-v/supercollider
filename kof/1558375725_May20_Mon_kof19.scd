

p.push;
p.bpm(120.5)

(
    
    ~a.mold(2);
    ~a.quant=16;
~a.fadeTime=4;
~a={
    var sig = SinOsc.ar(SinOsc.ar(1+(~tempo/15/(0..8))).exprange(20.01,70),Pulse.ar(~tempo*2/[1,2,3,4]),mul:0.75) * Pulse.ar(~tempo*2);
    Splay.ar(sig);
};
~a.play;
)


