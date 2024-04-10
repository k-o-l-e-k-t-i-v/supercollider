p.push();

~freq.mold(1);
~tempo.mold(1);
(
    ~scal = 12;
    ~alter = {Duty.kr(4/~tempo,0,Dseq([1,7,1,5],inf))};
~multi = {8};
~len = {2};
~tempo = {7.48077 * ~multi/60};
~mod = {1/4};
~mod.quant=16;
~freq = {748.077*~mod};
//~earthian.ar(2);
~earthian.quant=0;
~earthian.fadeTime=2;
~earthian={
    var notes = Duty.kr([4,24,96]/~tempo,0,Dseq([1,3,5,1,5,8,7,8,6,8,11],inf));
    var harmonics = (2**((notes*~alter%(~scal) )+1));
    var sig = SinOsc.ar(~freq*harmonics,mul:1/(10..1)) * Decay2.ar(Impulse.ar(~tempo*4/(1..10)),0.02, ~len/(10..1));
    sig = CompanderD.ar(sig,3/4,1/2,1);
    sig = LPF.ar(sig,1200);
    sig = GVerb.ar(sig,90,3)/16+sig;
    Splay.ar(sig,0.75,0.25);
};
~earthian.play;
);
~earthian.stop(4);
~earthian.clear;
~earthian.pause;
~earthian.resume;
