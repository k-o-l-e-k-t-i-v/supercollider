p.push();

~freq.mold(1);
~tempo.mold(1);
(
    ~scal = 5;
    ~alter = {Duty.kr(4/~tempo,0,Dseq([1,2,3,4],inf))};
//metric time fix
    ~multi = {0.6*10};
~len = {0.2};
// c @ 50.07731N = 38627.8 km
// 2 × pi * 6371(km R of E) * cos(50.07731) = 38627.8 km [surface]
// 2 × pi * 6371+48(km R of E) * cos(50.07731) = 39619.8 km [begginnigng of ionosphere]
// 2 × pi * 6371+965(km R of E) * cos(50.07731) = 45279.8 km [end of ionosphere]

~h = 7.56676; //Hz = ligthspeed rounding 48km above sfc
~tempo = {~h * ~multi/60};
~mod = {1/5};
~mod.quant=0;
~freq = {~h*8.0*~mod};
//~earthian.ar(2);
~earthian.quant=0;
~earthian.fadeTime=2;
~earthian={
    var notes = Duty.kr([4,24,96]/~tempo,0,Dseq([1,3,5,1,5,8,7,8,6,8,11],inf));
    var harmonics = (2**((notes*~alter%(~scal) )+1));
    var sig = SinOsc.ar(~freq*harmonics,mul:1/(10..1)) * Decay2.ar(Impulse.ar(~tempo*4/(1..10)),0.02, ~len/(10..1));
    sig = CompanderD.ar(sig,3/4,1/2,1);
    sig = LPF.ar(sig,2200);
    sig = GVerb.ar(sig,90,3)/16+sig;
    Splay.ar(sig,0.75,0.05);
};
~earthian.play;
);
~earthian.stop(90);
~earthian.clear;
~earthian.pause;
~earthian.resume;


(
    //s.latency=0.2;
    //p.clock.tempo_(120/60);
    p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
    ~tick.kr(1);
    ~tick.quant = 0;
    ~counter.quant = 0;
    ~counter = {PulseCount.kr(~tick.kr);};
    ~tick = { Impulse.kr( ~tempo * 4 ); };
);
