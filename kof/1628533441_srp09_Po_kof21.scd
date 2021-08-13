
p.push();
p.bpm(123.5)

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=24;
~one.fadeTime=0.04;
~one={
    var mod = Pulse.ar(~tempo/(1+1/(1..12)));
    var harm = (2**(1+(1/(1..12))));
    var sig = SinOsc.ar(50!2/harm+mod.range(0.1,5000/harm).abs,mod) * mod.abs.softclip;
    //sig= sig + VarSaw.ar(harm*50);
    sig = sig * mod;
    //sig = CombC.ar(sig,1/50,harm/50,LFSaw.ar(~tempo/24)**1.2*4+0.002);
    Splay.ar(sig,0.95,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
