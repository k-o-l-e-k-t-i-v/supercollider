
p.push();

~tempo = {110/60}

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=8;
~one.fadeTime=0;
~one={
    var env = Decay.ar(Impulse.ar(~tempo*2/[1,2,3,4]),LFSaw.kr(~tempo/4/[1,2,3,4])+0.5);
    var sig = SinOsc.ar([60,50]+(env**20*600),env**8*8pi ) * env;
    Splay.ar(sig,0.05,0.95);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
