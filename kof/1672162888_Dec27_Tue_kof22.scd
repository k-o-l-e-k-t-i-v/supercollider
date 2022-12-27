

~tempo = {SinOsc.kr(1/37.5).range(105,115)/60}
~tempo.mold(1)
p.push();


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=0;
~one={
    var mel = Duty.kr([1,1/4,1/8]/~tempo,0,Dseq((2**(1+(1/(1..12)))),inf));
    var env = Decay.ar(Impulse.ar(~tempo*2/[1,2,3]),1);
    var sig = SinOsc.ar([50,60,3000]/mel,Pulse.ar(~tempo*2/[1,2,3]));
    sig=  sig * env;
    Splay.ar(sig,0.0,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
