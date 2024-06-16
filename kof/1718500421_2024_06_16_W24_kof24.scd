



p.push();

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
    var harm = Duty.kr([32,24,2,36],0,Dseq(2**0.5*[1,2,3,4]/.x[1,2,1.5,4/3,5/4],inf)).lag(1/4);
    var sig = SinOsc.ar(110*harm,mul:LFNoise2.kr(1/(1..4)));
    sig = sig * Decay2.ar(Impulse.ar(2**0.5*4/(1..4),0.02,1.0/[1,2,3,4] ));
    sig = GVerb.ar(sig,90,3)/24+sig;
    Splay.ar(sig,0.95,0.5);
};
~one.play;
);
~one.stop(15);
~one.clear;
~one.pause;
~one.resume;
