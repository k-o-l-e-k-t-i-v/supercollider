p.push();

~tempo={55/120}


// 8**4

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=0;
~one.fadeTime=0;
~one={
    var shift = Duty.kr([4,16,32,64,92,128]/~tempo,0,Dseq([1,5,8,7,8,6,2,4],inf)).lag([1,32,128]/16);
    var bf = [40,40.432,39.9543].reverse * [1,2,4,16,1.5,4] * (2**(shift/12)+1);
    var freq = 2**([shift,5+shift,8-shift]/LFSaw.ar(~tempo*4/[2,3,4]).exprange(0.98,4096).round(shift)) * bf;
    var sig = SinOsc.ar(freq,mul:0.2) * (1-(LFSaw.ar(~tempo*4/[1,2,3])**1.25)) + Pulse.ar(~tempo*4/[1,2,3]);
    sig = LPF.ar(HPF.ar(sig,20),6000);
    sig = CombC.ar(sig,16/freq,4/bf,2)/8+sig;
    sig = LeakDC.ar(sig);
    sig = GVerb.ar(sig,60,4)/16+sig;
    sig = CompanderD.ar(sig,3/4,1/2,1);
    Splay.ar(sig,0.75,0.0094);
};
~one.play;
);
~one.stop(30);
~one.clear;
~one.pause;
~one.resume;
