


p.push();

d = Buffer.alloc(s,4096*4,2);


// rec synth ///////////////////////////////////////

(
~rec.ar(2);
~rec.clock = p.clock;
~rec.quant=2;
~rec.fadeTime=4;
~rec={
    var t = LFSaw.ar([16.0001,16,1/16/[1,1.001,1.00001]]) * 2pi;

  var sig = Perlin3.ar(t[0].cos,t[1].sin,t[2].sin);
  sig = LeakDC.ar(sig);
  RecordBuf.ar(Mix(sig)!2,d.bufnum,loop:1);
  Splay.ar(sig,0.5,0.25);
};
~rec.play;
);
~rec.stop(4);
~rec.clear;
~rec.pause;
~rec.resume;

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = Osc.ar(d.bufnum,[60,65,57].midicps/8);
  sig=CombL.ar(sig/3,1,1/4,4);
  //sig = CompanderD.ar(MoogVCF.ar(sig,LFSaw.kr(1/4/[1,2,3,4]).exprange(50.01,1500),0.2),3/4,1/2,1);
  //RecordBuf.ar(Mix(sig)!2,d.bufnum,SinOsc.kr(1/[160,161]).range(0,2pi),0.03,1);
  sig = LPF.ar(sig,1500);
  Splay.ar(sig,0.15,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
