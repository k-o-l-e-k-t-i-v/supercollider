


p.push();

p.bpm(110)


// lala synth ///////////////////////////////////////

(
~lala.ar(2);
~lala.quant=4;
~lala.fadeTime=2;
~lala={
    var sig = SinOsc.ar([60,50,400,300],Pulse.ar(~tempo*4/[1,2,3,4])) * LFSaw.ar([60,50,40,300]);
    sig = CombN.ar(sig,1/[50,60,40],1/[50,60,40],0.2);
    Splay.ar(sig,0.95,0.25);
};
~lala.play;
);
~lala.stop(4);
~lala.clear;
~lala.pause;
~lala.resume;
