p.push();

~tempo={120*0.98/120}


// 8**4

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=0;
~one.fadeTime=0;
~one={
    var shift = Duty.kr(4/~tempo,0,Dseq([1,14,-4,7],inf));
    var bf = [40,50,60].reverse * 10 * (2**(shift/12));
    var freq = 2**([shift,5+shift,8-shift]/LFSaw.ar(~tempo*4/[2,3,4]).exprange(0.98,4096).round(shift)) * bf;
    var sig = SinOsc.ar(freq,mul:0.2) * Pulse.ar(~tempo*4/[1,2,3]) ;
    sig = CombC.ar(sig,16/freq,4/bf,2)/8+sig;
    sig = LeakDC.ar(sig);
    sig = CompanderD.ar(sig,3/4,1/2,1);
    Splay.ar(sig,1,0.98*0.5);
};
~one.play;
);
~one.stop(120);
~one.clear;
~one.pause;
~one.resume;
