

p.push();




// hights synth ///////////////////////////////////////

(
~hights.ar(2);
~hights.quant=4;
~hights.fadeTime=5;
~hights={
    var mod = Duty.kr(24/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
    var pomer = [60,61,65,67,72,48].midicps/[1,2,4,mod] + (SinOsc.kr(~tempo/4)*0.1);
    var sig = LFSaw.ar(pomer)+1 * pi;
    sig = CombN.ar(sig,1/~tempo,1/pomer,1);
    sig = CombL.ar(sig,2/~tempo,1/mod,2);
    sig = Perlin3.ar(sig.cos,sig.sin,LFSaw.ar(~tempo/24)) * Pulse.ar(~tempo*4/[1,2,3]);
    sig = GVerb.ar(sig)/32;
    Splay.ar(sig,0.95,0.015);
};
~hights.play;
);
~hights.stop(60);
~hights.clear(60);
~hights.pause;
~hights.resume;


// oneoneone synth ///////////////////////////////////////

(
~oneoneone.ar(2);
~oneoneone.quant=12;
~oneoneone.fadeTime=1;
~oneoneone={
    var mel = Duty.kr(16/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
    var detune = SinOsc.kr(~tempo/16) * 0.001;

    var mod = Duty.kr(48/~tempo,0,Dseq([60,65,61,67].midicps/.x[36,48,61,72].midicps,inf)) + detune;
    var sig = LFSaw.ar([(1/(1..12)+1)/60,[50,60,300]*mel,(1/(1..12)+1)/1000])*2pi;
    sig = Perlin3.ar(sig[0].cos,sig[1].sin,sig[2]*10);
    sig = LPF.ar(sig,[900,9000,16000]);
    sig = LeakDC.ar(sig);

    sig = CombN.ar(sig,1,mod,1);
    sig = CombC.ar(sig,1,mod,4);

    sig = GVerb.ar(sig)/32 + sig;

    Splay.ar(sig,0.5,0.0025);
};
~oneoneone.play;
);
~oneoneone.stop(4);
~oneoneone.clear;
~oneoneone.pause;
~oneoneone.resume;
