p.push();
p.bpm(72);

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=0;
~one.fadeTime=2;
~one={
    var sig = SinOsc.ar([5000,50] * (2**([4,7,11]+LFNoise1.kr(0.1!3)/12+1) )) * Pulse.ar(~tempo/3*[5,4,3]);
    Splay.ar(sig,0.95,0.15);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


// one synth ///////////////////////////////////////

(
~one1.ar(2);
~one1.quant=0;
~one1.fadeTime=2;
~one1={
    var sig = SinOsc.ar(432 * (1+[4,7,11]/12**2),mul:LFNoise1.kr(~tempo/16!3)) * LFSaw.ar(~tempo/24/[1,2,3]);
    Splay.ar(sig,0.5,0.25);
};
~one1.play;
);
~one1.stop(30);
~one1.clear;
~one.pause;
~one.resume;
