b.boot;
p.push();
p.pbm(30);
// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
    var base = 299.95/4 * Duty.kr([4,3,12]/~tempo,0,Dseq([1,2,1.5,1.33333,1/2,1/1.5,1/1.333333],inf)).lag(1/2);
    var harm = (2**([1,5,8]/12+1));
    var mod = [1,36]/Duty.kr([4,7]/~tempo,0,Dseq([1,2,1,4,1/2],inf)).lag([1/3,1]);
    var sig = SinOsc.ar(base*harm) * SinOsc.ar(~tempo/4/[1,2,3]) * Decay.ar(Impulse.ar(~tempo*4/[1,2,3]),0.5);
    var noi = Perlin3.ar(sig.cos+1*2pi,sig.sin+1*2pi,LFSaw.ar(~tempo/12).sin+1*2pi+LFSaw.ar(~tempo/36/[1,2,3],mul:10));
    noi = LeakDC.ar(noi);
    sig = CombN.ar(sig+noi,1/~tempo,mod/harm,~tempo)/2+sig;
    sig = CombL.ar(sig+noi,1/~tempo,mod/base,~tempo*2)/4+sig;

    sig = CompanderD.ar(sig,3/4,1/2,1);
    sig = GVerb.ar(sig,90,3)/8+sig;
    Splay.ar(sig,0.25,0.15);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
