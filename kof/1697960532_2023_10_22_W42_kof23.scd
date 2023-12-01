

p.push();
~tempo={92/120};


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
    var mod = Duty.kr([3,4,12]/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
    var mid = Duty.kr(4/~tempo,0,Dseq([3,5,3,6,5,7],inf));
    var last = Duty.kr(12/~tempo,0,Dseq([8,7,5,8,5,3],inf));
    var base = [220,110,55]/mod;
    var har = 2**([1,mid,last]/12+1);
    var det = SinOsc.kr(~tempo/[3,4,5]);
    var sig = SinOsc.ar(base * har + det,LFTri.kr(~tempo/[6,7,8]));
    sig = Perlin3.ar(LFSaw.ar(~tempo/4/[3,4,5],mul:2pi).cos+1,LFSaw.ar(~tempo/4/[3,4,5],mul:2pi).sin+1,LFSaw.ar(base/16*har,det,mul:2pi).sin/16+(sig*2) ) ;
    sig = LPF.ar(sig,2500+LFSaw.kr(~tempo/4/[4,3,2],mul:2500));
    sig = CompanderD.ar(sig,3/4,1/2,1);
    sig = LeakDC.ar(sig);
    sig = GVerb.ar(sig,90,3)/32+sig;
    Splay.ar(sig,0.75,0.15);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
