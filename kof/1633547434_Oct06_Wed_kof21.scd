

p.push()

// quartz pusher

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=4;
~one={
    var sig = SinOsc.ar(16384!2,SinOsc.ar([1,1.0001]/24)*2pi);
    Splay.ar(sig,0.95,0.15);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
