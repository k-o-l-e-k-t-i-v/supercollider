


s.boot


p=ProxySpace.push()



(
~prga={
    var base = 110*[1,2,1/2];
    var mod = Duty.kr(4,0,Dseq([0,1,0,-1],inf));
    var freq = base * ([1+mod,5,8-mod]).lag(1/4);
    var sig = SinOsc.ar(freq) * (LFTri.kr(1/16/[1,2,3])**0.75);
    sig = sig * LFSaw.ar(4/[1,2,3]);
    sig = GVerb.ar(sig,90,3)/3+sig;
    sig = CompanderD.ar(sig,1/2,3/4,1);
    Splay.ar(sig,1,0.5);

};
~prga.play;
)

~prga.stop(18)
