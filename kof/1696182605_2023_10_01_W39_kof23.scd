
p.push();
~tempo = {110/120}; 




// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=24;
~one.fadeTime=2;
~one={
    var last = Duty.kr(24/~tempo,0,Dseq([7,9,5,12],inf));
    var base = [36,48,24,60,67].midicps;
    var mel = 2**(([1,5,8,last].scramble/12)+1);
    var sig = LFSaw.ar([base*mel,base*1.5*mel,~tempo/24/[4,3,2] ])*2pi;
    sig = Perlin3.ar(sig[0].cos,sig[1].sin,sig[2].tan) * LFTri.ar(~tempo/4/[1,2,3]);
    sig = LeakDC.ar(sig) * Pulse.ar(~tempo*4/[1,2,3]);
    sig = CombL.ar(sig,4,1/base,4)/32+sig;
    sig = GVerb.ar(sig,60,3)/32+sig;
    sig = sig/2+(LPF.ar(sig,5000)/4)+(HPF.ar(sig,150)/4);
    sig = CompanderD.ar(sig,3/4,1/2,1);
    Splay.ar(sig,0.95,0.15);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
