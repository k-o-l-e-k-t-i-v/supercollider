

p.push();

~tempo={110/120/2}

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=0;
~one.fadeTime=0.02;
~one={
    var pat = Select.kr(LFSaw.kr(~tempo/[1,2,3]),[[1,2,3],[3,2,1],[2,4,7]]).lag(0.02);
    var mel = 2**(Duty.kr([1,2,3]/~tempo,0,Dseq([1,5,8,12],inf))/12).lag(0.01);
    var len = LFTri.ar(~tempo*1*LFNoise2.kr(~tempo/pat).range(0.25,0.75)/30).exprange(0.9,0.098);
    var sig = SinOsc.ar([40*pat,40.02*mel,40.0023*mel]) * Pulse.ar(~tempo*4/pat);
  var side = SinOsc.ar(80*mel,Pulse.ar(~tempo*4/pat)*2pi);
    //side = LeakDC.ar(side);
    sig = LeakDC.ar(sig);
    sig = Perlin3.ar(sig*len,(sig*2pi).sin,(sig*2pi).cos)/8 + side;
    sig = CombL.ar(sig,~tempo/8*len,~tempo/len,0.2);
    sig = LeakDC.ar(sig);
    sig = GVerb.ar(sig,90,13)/8+sig;
    sig = HPF.ar(sig.softclip,80) + BPF.ar(sig,400*mel,0.1) + LPF.ar(sig,120);
    sig = LeakDC.ar(sig);
    sig = CompanderD.ar(sig,3/4,1/2,1)/4+sig;
    sig = LeakDC.ar(sig);
    Splay.ar(sig,0.05,0.12,LFPulse.ar(~tempo*2*len/pat)-0.5*2);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
