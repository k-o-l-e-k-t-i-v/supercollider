


p.push();
p.bpm(110);
s.latency=0.2;

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=1;
~one={
    var dd = Duty.kr(4/~tempo,0,Dseq([0,-4,0,7],inf));
    var mel = Duty.kr(Dseq([4,1,12,1,90].normalize*4,inf)/~tempo,0,Dseq([1,5,8,11],inf))+dd;
    var harm = 2**([mel%3,mel%7,mel%12]/12) * [220,880,110];
    var sig = SinOsc.ar(harm,mul:0.2) * Pulse.ar(~tempo*2/[1,2,3,4]) ;
    sig = sig * LFTri.kr(~tempo/4/[1,2,3]);
    sig = CompanderD.ar(sig,3/4,1/2,1);
    //sig = CombL.ar(sig,8/harm,LFSaw.kr(~tempo*2/[1,2,3,4]).exprange(1.001,4)/harm,8.15)/4+sig;
    sig = LPF.ar(sig,1200);
    sig = CombC.ar(sig,1/100,1/harm,20/harm);
    sig = GVerb.ar(sig,90,3)/8+sig;
    Splay.ar(sig,0.95,0.15);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=4;
~one={
    var harm = 50 * (2**([1,5,8,12]/12));
    var sig = Pulse.ar(Duty.kr(Dseq([1,2,90,19,23,49].normalize*4,inf)/[1,2,3,4]/~tempo,0,Dseq([4,1,8,16]/~tempo,inf))*4/[1,2,3,4]);
    sig = sig * LFPulse.ar(~tempo*2/[2,4,8]);
    sig = LeakDC.ar(sig);
    sig = CombL.ar(sig,2/harm,1/harm,1.2*[1,2,4,8]);
    sig = LeakDC.ar(sig);
    Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
