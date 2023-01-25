

~tempo = {SinOsc.kr(37.5).range(109,111)/60}
~tempo.mold(1)
p.push();


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=0;
~one={
    var mel = Duty.kr(1/[4,3,2,1]/~tempo,0,Dseq([1/4,2/1,3/2,4/3,5/4],inf));
    var env = Decay.ar(Impulse.ar(~tempo*4/[1,2,3,4]),[0.01]);
    var sig = SinOsc.ar([40,400]*mel,Pulse.ar(~tempo*4/[1,2,3,4]));
    sig=  sig * env;
    Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
