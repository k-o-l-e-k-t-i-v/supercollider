

p.push();
~tempo={110/120};


// water synth ///////////////////////////////////////

(
~water.ar(2);
~water.quant=0;
~water.fadeTime=4.5;
~water={
    var notes = Array.rand(1,12,3);
    var undertone = ((1/notes)*11.5)+1;
    var detune = SinOsc.ar(~tempo/[1,2,3].scramble,2pi/[3,2,1].scramble,mul:[0.44,0.382]);
    var harm = (2**((((notes).scramble)/12)))+1/[4,1,8,1/2,1/4,16].scramble;
    var freq = LFTri.ar([1/4.01001,4.3209221,44.00123].scramble).exprange(439.01,441.01) * undertone + detune * harm;
    var sig = SelectX.ar(LFTri.ar(~tempo*4/[1,2,3,4])**2*2, [SinOsc.ar(freq,mul:(1..9)**2/100),LFSaw.ar(freq,mul:(1..9)**2/100),Dust.ar(freq)] );
    sig = (sig * Pulse.ar(~tempo*4/[1,2,3,4]))/32 + sig;
    sig = LeakDC.ar(sig);
    sig = RLPF.ar(sig,[440/2,221]/4*harm+detune*undertone,LFNoise1.kr(~tempo/4/[1,2,3]).range(0.01,0.4))+(sig/4);
    sig = GVerb.ar(sig,90,3)*LFTri.kr(~tempo/16*(1..8))/7+(sig*2);
    sig = SelectX.ar(LFTri.ar(~tempo*1/(1..16))**1.2*8, sig );
    sig = CompanderD.ar(sig,3/4,1/2,1,0.02,0.2/[1,2,10,32])/4+(sig/1.2);
    Splay.ar(sig,0.776,0.035);
};
~water.play;
);
~water.stop(4);
~water.clear;
~water.pause;
~water.resume;

Tdef('rebuild',{loop {(45/(110/120) ).wait; ~water.rebuild;}}).play;
Tdef('rebuild').stop;
Tdef('rebuild').clear;
