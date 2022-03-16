
p.push();


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=4;
~one={
    var mod = Duty.kr([4,3,2,1]*~tempo,0,Dseq([1,2,4/3,5/4,15/8,1/2]*.x[1,2,5/4,1/2]/.x[4/3,1,2,1/2],inf));
    var sig = SinOsc.ar([60*mod[0],50*mod[1],300/mod[2],300*mod[3]]) * Decay.ar(Impulse.ar(~tempo*4/[1,2,3,4]),1/[1,2,3,4]);
  Splay.ar(sig,0.995,0.125);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
