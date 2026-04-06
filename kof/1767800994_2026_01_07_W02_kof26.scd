p.push();

p.bpm(79);
// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
    var chord = Duty.kr(4*[1,2,3]/~tempo,0,Dseq([[1,5,8],[1,6,8],[1,5,8],[0,12,5]],inf));
    var harm = 2**(chord/12+1);
    var freq = 48.midicps * Vibrato.kr(harm!2,0.005);
    var sig = LFSaw.ar(freq/[1,4,8],mul:2pi);
    sig = Perlin3.ar(sig.cos,sig[1].sin,LFSaw.ar(~tempo/36/[1,2,3],mul:4pi).sin)/4 + SinOsc.ar(freq,phase:1.823pi*[1,2,3],mul:0.5);
    sig = sig * Pulse.ar(~tempo/[1,2,3,4]);
    sig = GVerb.ar(sig,90,3)/8+sig;
    Splay.ar(sig,0.25,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
