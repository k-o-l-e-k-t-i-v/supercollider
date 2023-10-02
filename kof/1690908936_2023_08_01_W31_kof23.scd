


p.push();

~tempo={110/120}


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=5;
~one={
    var freq = [2200,220,44]*(2**(([1,12,24,36]/12)+1));
    var mel1 = Duty.kr(4/~tempo,0,Dseq([8,9,7].scramble,inf));
    var mel2 = Duty.kr(8/~tempo,0,Dseq([3,5,1,3,6,1].scramble,inf));
    var har = 2**([1,mel2,mel1]/12+1);
    var sig = In.ar(2) * Pulse.ar(~tempo*4/[1,2,3]);
    sig = CombL.ar(sig*(-1),har/freq,har/freq,LFNoise1.kr(~tempo/4!3).exprange(0.001,4))/5+sig;
    sig = GVerb.ar(sig,90,3)/9+sig;
    sig = LPF.ar(sig,15000) + HPF.ar(sig,30);
    Splay.ar(sig,0.25,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
