p.push();
p.bpm(90);

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
    var sp = Duty.kr([4,8,36]/~tempo,0,Dseq([1,2,1/2,1.5],inf)).lag(1/4);
    var last = Duty.kr(4/~tempo,0,Dseq([0,12,11,7,9],inf));
    var harm = 2 ** (Duty.kr(sp/[1,2,3,4]/~tempo,0,Dseq([1,5,8,last],inf))/12+1).lag(0.01);
    var lf = LFSaw.ar([sp/[1,2,3,4]*~tempo,~tempo/8,~tempo/360]) + LFSaw.ar([[50,49.95]*harm,[~tempo*sp/4,~tempo*sp],[1200,1200.25]*harm]) + LFSaw.ar(~tempo/360/[1,2,3,4]*sp) * 2pi/3;
    var len = LFNoise1.kr(~tempo*sp/36!4).exprange(0.02,0.5) ** 2;
    var sig = Perlin3.ar(lf[0].sin,lf[1].sin,lf[2].sin) * (Decay.ar(Impulse.ar(~tempo/[1,2,3,4]*sp,len))**2 ) * (1/sp);
    sig = LeakDC.ar(sig);
    sig = CombL.ar(sig,4/~tempo,1/1200*harm,LFNoise1.kr(sp/16!4).exprange(0.01,1.9));
    sig = LPF.ar(sig,900);
    sig = GVerb.ar(sig,90,3)/24+sig;
    sig = CompanderD.ar(sig,3/4,1/2,1)/4+sig;
    Splay.ar(sig,0.25,0.45);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
