


p.push();
p.pbm(90)

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=8;
~one.fadeTime=0.4;
~one={
    var base = [48,60,67].midicps / Duty.kr(24/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
    var pulse = Pulse.ar(~tempo*24/[4,3,2,1],LFSaw.kr(~tempo/240/[1,2,3,4]));
    var sig = SinOsc.ar(base!2 + ((pulse).tanh * base * 100),pulse * 2pi);
    sig = CompanderD.ar(GVerb.ar(sig,10,3,LFSaw.kr(~tempo/[1,2,3,4]).range(0.1,0.9))/8,sig,3/4,1,1).dist+sig;
    sig = CombL.ar(sig,~tempo,~tempo/base/100,~tempo);
    sig = LPF.ar(sig,440)/8 + BPF.ar(sig,0.1,LFSaw.ar(~tempo/4).range(22,12200)) + (sig / 8);
    sig = LeakDC.ar(sig) * Pulse.ar(~tempo);
    sig = CompanderD.ar(GVerb.ar(sig,90,2,LFSaw.kr(~tempo/[4,3,2,1]).range(0.3,1.9))/4,sig,3/4,1,1).dist+sig;
Splay.ar(sig,0.15,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
