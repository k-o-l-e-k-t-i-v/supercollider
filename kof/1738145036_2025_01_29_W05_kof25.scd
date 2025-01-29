
p.push();


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
    var freq = 80 * Duty.kr([4,16,24,36]/~tempo,0,Dseq([1,2,1.5,3/4],inf)) * ([1,5,8,12]/12+1**2);
    var gen = LFSaw.ar([1/24,3/[1,2,3,4],freq],mul:2pi);
    var noise = Perlin3.ar(gen[0].cos,gen[1].sin,gen[2].sin);
    var sig = SinOsc.ar(freq.lag(1/2)/2,2pi*Pulse.ar(3/[1,2,3,4])) * Pulse.ar(3/[1,2,3,4]);
    sig = sig + (Dust.ar(19)*Pulse.ar(3,0.5));
    sig = sig + (noise * Pulse.ar(3/[1,2,3,4],0.5) / 4);
    sig = CombL.ar(sig,2/freq,2/freq,[1,2,1/2,1/4]*2)/8+sig;
    sig = CompanderD.ar(sig,3/4,1/2,1);
    sig = GVerb.ar(HPF.ar(sig,1100),3,90)/16+sig;
    Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
