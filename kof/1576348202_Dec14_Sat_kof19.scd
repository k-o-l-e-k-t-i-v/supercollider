p.push();

b = Buffer.alloc(s,48000,2);
d = Buffer.alloc(s,48000,2);

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=0.4;
~one={
  var sig = LFSaw.ar(1!2) * SinOsc.ar(1/4) + PlayBuf.ar(2,b.bufnum);
  sig = BufDelayL.ar(d.bufnum,sig,SinOsc.ar(50.01).range(0,1));
  RecordBuf.ar(sig,b.bufnum,0,0.1,1);
  Splay.ar(sig,0.95,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
