
s.boot();

p=ProxySpace.push();



(
    ~one={
        var mod = Duty.kr(4,0,Dseq([0,-4,1],inf));
        var mel = mod + Duty.kr(4,0,Dseq([8,7,8,9,20,19,20,21],inf));
        var f = 220 * (2**([1,5,mel]/12));
        var sig = SinOsc.ar(f,mul:0.1*LFTri.kr(1/[1,2,3,4]))*8pi + LFTri.ar(1/[1,2,4],mul:0.1)*8pi;
        sig = Perlin3.ar(sig[0].cos,sig[1].sin,sig[2].sin)/4 + SinOsc.ar(f,mul:0.2);
        //sig = sig * Pulse.ar(4/[1,2,3,4])/2;
        //sig = sig.softclip;
        sig = CombL.ar(sig,8/f,1/f,1);
        sig = LPF.ar(sig,4000);
        Splay.ar(sig,1,0.05);
    };
    ~one.play;
)
~one.stop(8)


(
~two={
    var base = Duty.kr(24,0,Dseq([60,48,24,72],inf)).midicps;
    var mod = Duty.kr(16,0,Dseq([1,12,24,-12],inf));
    var mod2 = Duty.kr(4,0,Dseq([1,5,8,10],inf));
    var f = base * (2**([mod,mod2,LFTri.kr(48).range(1.001,12)]/12));
    var sig = SinOsc.ar(f,mul:0.2) + LFSaw.ar(f/2,mul:0.2) * Pulse.ar(4/[1,2,3,4]);
    sig = CombL.ar(BPF.ar(sig,f,0.2),2/f,1/f,2)+sig;
    sig = CompanderD.ar(sig,LFNoise1.kr(1/4!4).range(1/10,9/10),LFNoise1.kr(1/4!4).range(1/10,9/10),1);
    Splay.ar(sig,0.75,0.05);

};
~two.play;
)
