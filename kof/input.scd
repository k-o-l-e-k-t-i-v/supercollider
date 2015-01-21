
s.boot;

(
    Ndef(\inter).fadeTime = 4.0;
    Ndef(\inter).quant = 2.0;

    Ndef(\iner,{

        ~mod = SinOsc.ar(1/111/(1.501**(1..8))).range(4320,43.2).round(43.2);
        ~sig = SinOsc.ar(~mod,mul:0.3) +
        ((LFSaw.ar(1/4/[1,2,4,8]).squared * LFSaw.ar(~mod/2,mul:0.7) + WhiteNoise.ar(0.2!4)) *
         Pulse.ar(4/fib(12)) ).softclip;

        ~sig = {|i| BBandPass.ar(~sig, SinOsc.ar(11/(1.01**(1..12)).at(i)).range(10000,43.20).round(43.2) ) }!8; 
        ~sig = ~sig + (SinOsc.ar(43.2+ (43.20/1.5pi*(2.001**(1..8))),mul:0.2) * LFSaw.ar(1/4/[1,2,4,8]).squared);
        ~sig = CombN.ar(~sig,0.0025**(1..8),4,8);
        ~sig = CompanderD.ar(~sig,0.5,1,0.25);
        ~sig = FreeVerb.ar(~sig,0.15,10);


        Splay.ar(
            ~sig.distort.softclip
            ,0.2,0.65)}).play;

)

(
    Ndef(\mic).fadeTime = 8.0;
    Ndef(\mic).quant = 2.0;

    Ndef(\mic,{

        ~sig = AudioIn.ar([1,1],2).softclip + (WhiteNoise.ar(0.2!4) * Decay.ar(Dust.ar(1/4!4)));
        ~sig = CompanderD.ar(~sig,0.5,1,0.5);

        ~sig = {|i| BBandPass.ar(~sig, SinOsc.ar(~sig.range(11,1/4).lag(0.02)/(2.001**(1..12)).at(i)).range(22,1600) ) }!8;

        ~sig = FreeVerb.ar(~sig,0.5,100);

        Splay.ar(
            ~sig 
            ,0.2,1)}).play;

)

s.freeAll;
