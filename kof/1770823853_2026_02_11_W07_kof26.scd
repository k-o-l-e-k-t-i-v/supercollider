p.push();

p.bpm(83/1.5)

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
    var beats = Duty.kr([1,2,3,4]/~tempo,0,Dseq([1,2,3,4],inf));
    var base = [500,600,50,60];
    var mel = Duty.kr(4/~tempo,0,Dseq([1,2,1.5,1.3333],inf)).lag(1/8); 
    var sig = LFSaw.ar(mel/([1,5,8]/12**2+1)*base, SinOsc.ar([1,1.5,2]));
    sig = sig * Pulse.ar(~tempo*beats/[1,2,3,4]).softclip;
    sig = CombL.ar(sig,beats/~tempo,beats/mel/base/~tempo,4);
    sig = CompanderD.ar(sig,3/4,1/2,1)/4+sig;
    sig = GVerb.ar(sig,90,3)/16+sig;
    Splay.ar(sig,0.95,0.75);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
