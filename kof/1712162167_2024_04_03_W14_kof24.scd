
p.push();

// derivation, photon around the Earth

~tempo = {104.579/60}



// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
    var earth = 6.9719 * 64;
    var mod = Duty.kr(24/~tempo,0,Dseq(1/[1,2,1.5,1.33333]+1,inf));
    var fourth = Duty.kr(4/~tempo,0,Dseq([6,7,6,8],inf));
    var harm = 2**([1,5,8,fourth]/12)+1/mod;
    var sig = SinOsc.ar(earth*harm) + LFSaw.ar(earth*harm) * Pulse.ar(~tempo*2/[1,2,3,4]);
    sig = CombL.ar(sig,1/4/~tempo,1/[64,128,256]/~tempo,[1,2,3,4]/2);
    sig = GVerb.ar(sig,90,3)/16+sig;
    sig = LPF.ar(sig,440)/4;
    Splay.ar(sig,0.75,0.025);
};
~one.play;
);
~one.stop(30);
~one.clear;
~one.pause;
~one.resume;


s.scope
