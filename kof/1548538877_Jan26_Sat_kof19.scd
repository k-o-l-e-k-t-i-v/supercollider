


p.push();

2**16
b = Buffer.alloc(s,48000,1);
b.free;


// rec_fade synth ///////////////////////////////////////

(
~rec_fade.ar(2);
~rec_fade.clock = p.clock;
~rec_fade.quant=2;
~rec_fade.fadeTime=4;
~rec_fade={
  var sig = LFNoise1.ar(1250) + LFNoise1.ar(50) + LFNoise1.ar(16);
  sig = Normalizer.ar(sig);
  RecordBuf.ar(Mix(sig),b.bufnum,loop:0);
//  Splay.ar(sig,0.5,0.25);
};
//~rec_fade.play;
);
~rec_fade.stop(4);
~rec_fade.clear;
~rec_fade.pause;
~rec_fade.resume;

// dusts synth ///////////////////////////////////////

(
~dusts.ar(2);
~dusts.clock = p.clock;
~dusts.quant=4;
~dusts.fadeTime=4;
~dusts={
  var f = [60,48,65].midicps * 2 + SinOsc.kr(1/4/[1,2,4]);
  var sig = Shaper.ar(b.bufnum,LFTri.ar(f)/4+SinOsc.ar(f/2.01)/2+LFSaw.ar(f/4.001));
  sig = Resonz.ar(sig,f.lag(0.2),LFNoise1.kr(1/[2,3,4]).range(0.1,0.5));
  sig = sig + Mix(LPF.ar(sig,f));
  Splay.ar(sig,0.75,0.5);
};
~dusts.play;
);
~dusts.stop(4);
~dusts.clear;
~dusts.pause;
~dusts.resume;




