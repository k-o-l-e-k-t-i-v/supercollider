p.push();



// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=0;
~one.fadeTime=2;
~one={
    var len = LFSaw.ar(~tempo.kr/3/[1,2,3]).exprange(0.02,1);
    var note = LFSaw.ar(~tempo.kr/4/[1,2,3]).exprange(0.001,1) * [1,5,8];
    var freq = 110*(2**(note/12));
    var sig = SinOsc.ar(freq,mul:0.4) * Pulse.ar(~tempo*4/[1,2,3]);
    sig = CombN.ar(sig,len/freq,len/freq,1);
    sig = LeakDC.ar(sig);
    Splay.ar(sig,1,0.05);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
