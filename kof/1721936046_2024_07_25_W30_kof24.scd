
p.push();


~tempo={86.4/60}

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
    var harm = Duty.kr(5/[1,2,3,4]/~tempo,0,Dseq((([1,5,8,17,20]/12)+1)**2,inf));
    var sig = SinOsc.ar(75*harm) * Pulse.ar(5/[1,2,3,4]);
    Splay.ar(sig,0.5,0.015);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
