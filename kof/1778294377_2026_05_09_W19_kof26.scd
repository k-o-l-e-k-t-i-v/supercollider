p.push();
p.bpm(40);
// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
    var sig = SinOsc.ar(40 * (2**([1,2,3,4]/12+1))) * LFPulse.ar(~tempo*4/[1,2,3,4]);
    Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
