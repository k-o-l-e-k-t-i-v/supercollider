



p.push();

~tempo = {110/120};

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
    var last = Duty.kr(4/~tempo,0,Dseq([8,6,10],inf));
    var base = 432/8;
 var freq = base * ([1,5,last,12]/12+1**2);//((2..10)**(0.5));
    var sig = LFSaw.ar(freq,mul:LFTri.kr(~tempo/4/(10..2)) ,mul:2pi);
    var shift = LFSaw.ar(~tempo/64/(1..10))*2;
    sig = Perlin3.ar(LFSaw.ar(freq,mul:2pi).cos+shift,LFSaw.ar(freq,mul:2pi).sin+shift,sig.sin+shift);
    sig = CombN.ar(sig*Pulse.ar(~tempo/4/[1,2,3,4]),4/freq,2/freq,4);
    sig = GVerb.ar(sig,90,3)/16+sig;
    Splay.ar(sig,1,0.00125);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

