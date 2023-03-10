

p.push()
~tempo={110/60}

// large synth ///////////////////////////////////////

(
~large.ar(2);
~large.quant=24;
~large.fadeTime=4;
~large={
    var mel = Duty.kr([[3,6,9],[8,16,24],[1,2,4],[1/2,1/4]]/~tempo,0,Dseq([1,2,1.5,1,1/2,1,4/3,5/4,1],inf));
    var sig = SinOsc.ar([80,40*[2,4,8]/mel,40,80*4]*mel) + (LFSaw.ar([40,80])*Pulse.ar(~tempo*4/(1..10)));
    Splay.ar(sig,0.05,0.0025);
};
~large.play;
);
~large.stop(4);
~large.clear;
~large.pause;
~large.resume;
