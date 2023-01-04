

p.push();

~tempo = {110/60}

// vim:set et sw=4 ts=4: synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=0.02;
~one={
    var sw = Duty.kr(4/~tempo,0,Dseq([4,16],inf));
    var high = Duty.ar([12,36]/~tempo,0,Dseq([61,60,60,65,60,67,60,72],inf)).lag(1/4);
    var mid = Duty.ar([24,48]/~tempo,0,Dseq([61,60,60,65,60,67,60,72],inf)).lag(1/400);
    var slope = LFTri.kr(~tempo/37.5).range(1.001,0.0099);
    var peak = [high,mid].midicps / [1,4,1,1/4];
    var frac = Duty.ar([4,8,2]/~tempo,0,Dseq([1,2,1.5,1.33333],inf)).lag(1/48) * 1/peak;
    var env = Pulse.ar(~tempo*2/[4,3,4/3,2]);
    var sig = SinOsc.ar(peak + (env ** slope * peak),env*2pi) + (LFTri.ar(peak*2,1-env)/4) * env;
    var side = sig;
    sig = LPF.ar(sig.softclip,SinOsc.kr(~tempo/[1,2,3]).exprange(peak,peak*1.5),0.5pi) ;
    sig = CombL.ar(sig * env,frac/~tempo,frac/~tempo,4/~tempo) * Pulse.ar(~tempo*sw/[1,2,4]);
    sig = Compander.ar(side,sig,0.001,0.001,1) + side;
    sig = CompanderD.ar(sig,5/4,1,1/2) + side;
    Splay.ar(sig,SinOsc.kr(4/~tempo).range(0,1),0.0125);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
