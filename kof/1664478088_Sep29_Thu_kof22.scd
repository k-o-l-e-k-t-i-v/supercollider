
s.reboot;
p.push();
~tempo = {5/4*3};


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=0;
~one.fadeTime=4.2;
~one={
    var xx = ~tempo/(1..24).nthPrime;
    var wet = LFSaw.kr(~tempo/[4,3,2,1]).range(0.6,1.6);
    var dry = LFSaw.kr(~tempo/[1,2,3,4]).range(0.6,1.6);
    var ll = LFSaw.kr(~tempo/24/xx).range(0.1,1);
    var mel = Duty.kr(~tempo*xx,0,Dseq([1,2,1.5,1.33333],inf));
    var sig = SinOsc.ar([500,50,5000]*mel,Pulse.ar(xx)) * Pulse.ar(xx);
    var side;
    sig = sig + (LFSaw.ar([60,50,300]*(mel),mul:ll) * Decay.ar(Impulse.ar(xx),ll*4));
    sig = sig + LFTri.ar(300*mel)*Decay.ar(Impulse.ar(xx*2),ll/2);
    sig = CombL.ar(sig,ll,1**(1+1/mel),2)/16+sig;
    sig = CompanderD.ar(sig,3/4,wet,dry);

    side = HPF.ar(sig,50);
    side = GVerb.ar(side,[50,40],6,0.5*ll,0.2*ll,mel+1*15)/24+side;
    
    side = LPF.ar(sig,150) + side;

    side = side.softclip + side;
    sig = CompanderD.ar(sig.softclip,3/4,wet,dry)/24 + side;
    sig = sig.distort/4+side;
    Splay.ar(sig,0.95,0.05);
};
~one.play;
);
~one.stop(180);
~one.clear;
~one.pause;
~one.resume;



