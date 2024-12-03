
p.push();
s.boot;


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
    var base = 40;
    var mel = Duty.kr([4,3,2,1]/~tempo,0,Dseq([1,2,4/3,5/4],inf)).lag(0.1)*base;
    var sig = SinOsc.ar(base*mel+(puls.abs * 100),puls.cos*2pi) * puls.abs.lag(0.01);
    Splay.ar(sig,0.95,0.05);
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
~one.fadeTime=2;
~one={
    var mel = Duty.kr([4,3,12]*1.5/~tempo,0,Dseq([1,1/2,1.5,1/4],inf)) * [432,43.2,432*2,432/2];
    var puls = CombL.ar(Pulse.ar(1/[3,4,5,2] + LFNoise1.kr(1/36!4).range(0.02,0.02)),1,1/mel,4);
    var base = 2**(Duty.kr([1/36,4,3,12]/~tempo,0,Dseq([1,2,7,8,9,7,6,8,11],inf))/12+1) * 432*[1,2,1.5];
    var cad = Duty.kr([4,8,16,24,36,1/4]/~tempo,0,Dseq([1,2,1.5,1.33333],inf)).lag(0.02)*12;
    var sig = SinOsc.ar(base,SinOsc.ar(cad/[4,3,2,1/4])*2pi);
    var shape = LFNoise2.kr(~tempo/36!8).range(0.1,0.4);
    sig = sig * puls + LFSaw.ar(base*[1,2,1.5,4],mul:0.2) * puls;
    sig = HPF.ar(sig,20);
    sig= CombL.ar(sig,1/2,4/mel,1);
    sig = sig.softclip;
    sig = CompanderD.ar(BPF.ar(sig,4320*2/mel/(8..1),shape),3/4,1/4,LFNoise2.kr(~tempo/4/(8..16)).range(0.75,1) );
    sig = GVerb.ar(sig,6,60)/24 + sig;
    Splay.ar(sig,0.75,0.9);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
