p.push();


b = Buffer.allocConsecutive(3,s,4096,1);
(
  ~aaa.ar(3);
  ~aaa.clock = p.clock;
  ~aaa.quant=4;
  ~aaa.fadeTime=4;
  ~aaa={
    var f = 500;
    var sig = [
      SinOsc.ar(f/[1,2,4]),
      BrownNoise.ar(1),
      LFSaw.ar(f/[1,2,4]),
    ];
    3.do{|i|
    RecordBuf.ar(Mix(sig[i]),b[i],loop:0);
  };
  sig;
  };
);



// vvovov synth ///////////////////////////////////////

(
~vvovov.ar(2);
~vvovov.clock = p.clock;
~vvovov.quant=2;
~vvovov.fadeTime=1;
~vvovov={
  var sig = VOsc.ar(LFTri.ar(1/4/[1,2,3]).range(b.first.bufnum+0.1,b.last.bufnum-0.1),b);
  sig = PitchShift.ar(sig,0.5,Duty.kr(16/~tempo,0,Dseq([1,2,1.5,1.33333],inf)));
  sig = sig * Pulse.ar(4/[1,2,3]);
  Splay.ar(sig,0.5,0.05);
};
~vvovov.play;
);
~vvovov.stop(4);
~vvovov.clear;
~vvovov.pause;
~vvovov.resume;


