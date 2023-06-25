

p.push();
p.bpm(120);



// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=4;
~one={
    var sp = Duty.kr(Dseq([4,2],inf)/~tempo,0,Dseq([1,2,1,1/2],inf));
    var sig = Pulse.ar(~tempo/sp);
    Splay.ar(sig,0.95,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;



// two synth ///////////////////////////////////////

(
~two.ar(2);
~two.quant=4;
~two.fadeTime=4;
~two={
    var rd = Duty.kr(4/~tempo,0,Dseq((-12..12),inf));
    var base = 220 * (2**([0,-4,rd]/12));
    var sig = LFSaw.ar([1/[4,8,16],1/[4,3,2],base]) * 2pi;
    sig = Perlin3.ar(sig[0].cos,sig[1].sin,sig[2].sin);
    sig = LeakDC.ar(sig) + SinOsc.ar(base,mul:0.2);

    Splay.ar(sig,0.5,0.25);
};
~two.play;
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;
