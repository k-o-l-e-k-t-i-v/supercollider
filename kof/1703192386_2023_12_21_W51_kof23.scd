
p.push();

~tempo = {110/120};


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=6;
~one={
    var freq = [55/2,110,55] * 2**(([1,3,5,8]/12)+1);
    var sig = SinOsc.ar(freq,Pulse.ar(~tempo*4/[1,2,3,4])) * LFPulse.ar(~tempo*4/[1,2,3,4]);
    sig = LPF.ar(sig,1500);
    sig = sig * Pulse.ar(~tempo/8*[1,2,3]);
    sig = CombL.ar(sig,~tempo/4,~tempo/4,4);
    sig = LeakDC.ar(sig);
    sig = Limiter.ar(sig.softclip,0.5);
    sig = Compander.ar(sig,3/4,1/2,1);
    sig = GVerb.ar(sig,30,3)/32+sig;
    Splay.ar(sig,0.95,0.75);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=4;
~kick.fadeTime=2;
~kick={
    var sig = Pulse.ar(~tempo*4) * SinOsc.ar(55);
    Splay.ar(sig,0.5,0.25);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;
