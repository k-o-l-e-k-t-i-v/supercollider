

p.push();
~tempo={110/120};


// water synth ///////////////////////////////////////

(
~water.ar(2);
~water.quant=0;
~water.fadeTime=4.5;
~water={
    var notes = Array.rand(1,10,3);
    var undertone = ((1/notes)**10)+1;
    var detune = SinOsc.ar(~tempo/[1,2,3].scramble,2pi/[3,2,1].scramble,mul:[0.44,0.432]);
    var harm = (2**((((notes).scramble)/10)))+1/[4,1,8,1/2,1/4,16].scramble;
    var freq = LFTri.ar([43.01001,4.3209221,44.00123].scramble).exprange(431.99,440.01)*undertone +detune* harm;
    var sig = SelectX.ar(LFTri.ar(~tempo*4/[1,2,3,4])**2*2, [SinOsc.ar(freq,mul:(1..9)**2/100),LFSaw.ar(freq,mul:(1..9)**2/100),Dust.ar(freq)] );
    sig = (sig * Pulse.ar(~tempo*4/[1,2,3,4]))/32 + sig;
    sig = LeakDC.ar(sig);
    sig = RLPF.ar(sig,[432/2,220]*[1,1/2,0.75]*harm+detune*undertone,LFNoise1.kr(~tempo/4/[1,2,3]).range(0.01,0.4))/4+sig;
    sig = GVerb.ar(sig,[90,61,33],3)/LFTri.kr(~tempo/16*[1,2,3,4]).exprange(0.751,16)+sig;
    sig = SelectX.ar(LFTri.ar(~tempo*1/[1,2,3,4])**2*sig.length, sig );
    sig = CompanderD.ar(sig,3/4,1/10,1,0.02/[1,2,10,32],0.01);
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
