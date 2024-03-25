p.push();


~tempo= {110/120};

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
    var detune = SinOsc.kr(~tempo*4/[1,2,3]);
    var mod = 2**((Duty.kr([24,32,4]/.x~tempo,0,Dseq([1,5,8],inf))/12)+1) + (detune/100.1);
    var freq = [432,440] / [10,5,2.5] * mod /.x [4,2,1.25] *.x (2**(([1,5,8] / 12)+1));

    var sig = [] ++ (SinOsc.ar(freq) ++ VarSaw.ar(freq) ++ LFSaw.ar(freq)).scramble;
    var side;
    sig = SelectX.ar(LFSaw.ar(~tempo/4/(1..12))*(sig.size+1),sig);
    side = Pulse.ar(~tempo*4/[1,2,3,4]);
    sig = Compander.ar(sig,side,3/4,1/2,1)/4+(sig*side);
    sig = SelectX.ar(LFSaw.ar(~tempo/[1,2,3])*(sig.size+1),[]++CompanderD.ar(sig,3/4,1/2,1)/4++sig);
    sig = LeakDC.ar(sig);
    sig = GVerb.ar(sig*side,90,3)/4+sig;
    sig = LPF.ar(sig,16500) + LPF.ar(HPF.ar(sig,20),90);
    Splay.ar(sig,0.95,0.006);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
