
p.push();


~tempo = {110/120*2};

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=24;
~one.fadeTime=0.5;
~one={
    var base = Duty.kr(24/~tempo,0,Dseq([1,2,1.5,1.33333],inf)) * [40,80,160*4]; 
    var sig = LFSaw.ar(base * (2**((LFSaw.kr(~tempo/2/[1,2,3,4]/12).range(1,7)/12)+1)),Pulse.ar(~tempo*4/[1,2,3,4]));
   var side = SinOsc.ar(base);
    sig = LPF.ar(sig,16) + HPF.ar(sig,1500) * Pulse.ar(~tempo*4*[3,2]/[1,2,3,4]);
    sig = CombL.ar(sig,~tempo/20,~tempo/4,10)/2+sig;
    sig = GVerb.ar(sig,90,3)/6+sig;
    sig = HPF.ar(sig,180) + LPF.ar(sig,1500) * Pulse.ar(~tempo*4);
    side = Compander.ar(side,sig,3/4,1/2,1/2);
    sig = side + sig;
    Splay.ar(sig,0.05,0.015);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
