
p.push();

~tempo = {110/60}

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=8;
~one.fadeTime=0;
~one={
    var slope = LFNoise2.kr(~tempo/[1,1/4,1/48]);
    var env = Decay.ar(Impulse.ar(~tempo*2/[1,2,3,4,1/2]),LFSaw.kr(~tempo/4/[1,1/2,1/3,4]).range(0.15,0.65));
    var sig = SinOsc.ar([60,50]/2+(env**15*300),env**slope*8pi ) * env;
    Splay.ar(sig,0.95,0.5);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
