
p.push();


// prl synth ///////////////////////////////////////

(
~prl.ar(2);
~prl.quant=4;
~prl.fadeTime=2;
~prl={
    var f = [36,60,65].midicps + LFNoise1.kr(1!3,mul:0.1);
    var shift = LFSaw.ar((1..12)**2+1/2600)*100;
    var sig = SinOsc.ar(f+[-0.005,0,0.002],mul:LFTri.ar([1,2,3]/26));
    sig = CombC.ar(sig,1,1/f,1)/4+sig;
    sig = Perlin3.ar(sig[0]+1+shift*pi,sig[1]+1+shift*pi,sig[2]+1+shift*pi);
    sig = LeakDC.ar(sig);
    sig = GVerb.ar(sig,90,3)/16+sig;
    sig = CompanderD.ar(sig,3/4,1/2,1);
    Splay.ar(sig,0.25,0.25);
};
~prl.play;
);
~prl.stop(4);
~prl.clear;
~prl.pause;
~prl.resume;
