
p.push();

~tempo={121.34/120};

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
    var base = 60.midicps / Duty.kr([1,2,3,4]/~tempo,0,Dseq([1,2,1.5,1.33333],inf))  ;
    var set = [1,3,5,11];
    var vibrato = SinOsc.kr(~tempo*4/[3,7,13,33]);
    var sig = SinOsc.ar(base/(12/(2**set.log2))+vibrato,LFTri.kr(~tempo/4/set)) * LFTri.kr(~tempo/set);
  Splay.ar(sig,0.75,0.5);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
