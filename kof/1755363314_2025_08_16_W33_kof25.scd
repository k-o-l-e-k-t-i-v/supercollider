p.push();

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
    var base = Duty.kr([4,16,24]/~tempo,0,Dseq([1,2,1.5,1.33333],inf)) * [36,60,48].midicps;
    var mel = Duty.kr(4/~tempo,0,Dseq(2**([1,5,10,8]/12+1),inf));
    var a = SinOsc.ar(base +0.01*mel);
    var b = LFSaw.ar(base +0.02*mel);
    var c = LFPulse.ar(base +0.03*mel);
    var sig = [[a+b+c], [a+b-c], [a-b+c], [a-b-c], [a/b+c], [a/b-c]]; //[[a+b+c],[a-b+c],[a*b-c],[a*b*c],[a-b+c],[a*b*c]];
    sig = Normalizer.ar(LeakDC.ar(sig));
    sig =  SelectX.ar(LFSaw.ar(~tempo/[4,8,16]/sig.size)*sig.size,sig) * (LFSaw.ar(~tempo*2/[1,2,3])**-4);
    sig = LPF.ar(sig,base*mel*7);
    sig = CombL.ar(sig,1/~tempo,1/2/~tempo,~tempo);
    sig = CompanderD.ar(sig,3/4,1/2,1);
    sig = GVerb.ar(HPF.ar(sig,mel*base/2),90,3)/16+sig;

    Splay.ar(sig,0.95,0.05);
};
~one.play;
);
~one.stop(45);
~one.clear;
~one.pause;
~one.resume;
