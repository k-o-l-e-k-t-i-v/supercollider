

p.push();




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

    Splay.ar(sig,0.5,0.005);
};
~oneoneone.play;
);
~oneoneone.stop(4);
~oneoneone.clear;
~oneoneone.pause;
~oneoneone.resume;
