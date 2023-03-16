

p.push();


~tempo = {1};

// overtones synth ///////////////////////////////////////

(
~overtones.ar(2);
~overtones.quant=4;
~overtones.fadeTime=0;
~overtones={
    var mel = Duty.kr(16/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
    var overtones = 1/(1..32)+1 + LFNoise1.kr(1/32/(1..32),mul:0.04);
    var base = [65,67,60].midicps*2/[1,1,mel];
    var sig = SinOsc.ar(base);
    overtones.collect{|i|
                      sig = sig + SinOsc.ar(i*base,Pulse.ar(1/4/i%4),mul:1/i);
                     };
    //sig = sig * Pulse.ar(~tempo*2/[1,2,3,4]).softclip;
    sig = CombC.ar(sig/4,1/4,1/4,1);
    sig = LPF.ar(sig,LFSaw.kr(~tempo/24)*base+base) * (LFTri.ar(~tempo/4/[1,2,3,4])**2);
    sig = LeakDC.ar(sig);
    sig = HPF.ar(sig,30);
    sig = GVerb.ar(sig,90,3,0.5)/8+sig;
    sig = CompanderD.ar(sig,1/2,1/2,1);
    Splay.ar(sig,0.95,0.15);
};
~overtones.play;
);
~overtones.stop(4);
~overtones.clear;
~overtones.pause;
~overtones.resume;
