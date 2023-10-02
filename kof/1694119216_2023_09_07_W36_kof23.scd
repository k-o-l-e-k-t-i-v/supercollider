

p.push();
~tempo={110/120};

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=8;
~one.fadeTime=0.2;
~one={
    var third = Duty.kr(16/~tempo,0,Dseq([8,5,1,12],inf));
    var f = 39.75 * [1,1,2];
    var harm = 2**(([1,third,5]/12)+1);
    var sig = SinOsc.ar(f*harm,LFSaw.ar(~tempo/4/[1,2,3,4])*1pi*CombN.ar(Pulse.ar(~tempo*4/[1,2,3,4]),4/f/harm,LFNoise0.kr(~tempo*4/[1,2,3,4]).exprange(0.0001*f*harm,0.01*f*harm),2));
    sig = CombL.ar(sig,harm/f,harm/f/100,LFSaw.ar(~tempo/4/[1,2,3,4])*[4,3,2,1]/4)/4+sig/2;
    sig = LeakDC.ar(sig);
    sig = LPF.ar(HPF.ar(sig,20),1800) * Pulse.ar(~tempo*4/[1,2,3,4]);
    sig = CompanderD.ar(sig,3/4,1/2,1);
    sig = GVerb.ar(sig,60,3)/24+sig;
    Splay.ar(sig,0.25,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
