

b=Buffer.read(s,"/home/kof/out.wav");
z=Buffer.alloc(s,2048,1);
p.push();


// one synth ///////////////////////////////////////

(
~one1.ar(2);
~one1.clock = p.clock;
~one1.quant=2;
~one1.fadeTime=4;
~one1={
  var sig = PlayBuf.ar(1,b.bufnum);
  RecordBuf.ar(sig,z.bufnum);
  Splay.ar(sig,0.5,0.25);
};

//~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = Osc.ar(z.bufnum,2);
  sig = LPF.ar(sig,5000);
  sig = LeakDC.ar(sig);
  Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
