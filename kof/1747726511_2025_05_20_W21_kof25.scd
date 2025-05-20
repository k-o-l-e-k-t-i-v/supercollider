

p.push();


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
    var mod = Duty.kr([1,4]/26,0,Dseq(2**([1,3,5,8,12,11,7,5]/12+1),inf));
    var tim = LFTri.ar(10/26)**2;
    var sig = SinOsc.ar([40,50,60]*mod,Pulse.ar(10/26*[1,2,3,4])) + SinOsc.ar([300,3000]/[1,1.5,2]*mod,mul:0.01) + 1 * 2pi;
    sig = Perlin3.ar(sig.cos+1+tim,sig.asin+1,sig.sin+1) * Pulse.ar([1,2,3,4]*8/13);
    sig = PitchShift.ar(sig,0.2,LFTri.kr([1,2,3,4]/26)+0.5);
    sig = CombL.ar(sig,mod*[1,2,3,4]/300,mod/300,0.4);
    sig = LeakDC.ar(sig);
    sig = GVerb.ar(sig,50,6)/32+sig;
    sig = CompanderD.ar(sig,3/4,1/2,1);
    Splay.ar(sig,0.25,0.15);
};
~one.play;
);
~one.stop(30);
~one.clear;
~one.pause;
~one.resume;
