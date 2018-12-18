





p.push();
p.bpm(120);

b = Buffer.alloc(s,2048,1);


// reco synth ///////////////////////////////////////

(
~reco.ar(2);
~reco.clock = p.clock;
~reco.quant=16;
~reco.fadeTime=4;
~reco={
  var sig = SinOsc.ar(LFSaw.ar(1/4));
  
  Splay.ar(sig,0.5,0.5);
};
~reco.play;
);
~reco.stop(4);
~reco.clear;
~reco.pause;
~reco.resume;

// play synth ///////////////////////////////////////

(
~play.ar(2);
~play.clock = p.clock;
~play.quant=4;
~play.fadeTime=4;
~play={
  var sig = VOsc.ar(b.bufnum, 50);
  sig = sig * (LFSaw.ar(1/4)**4);
  Splay.ar(sig,0.5,0.5);
};
~play.play;
);
~play.stop(4);
~play.clear;
~play.pause;
~play.resume;

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(52.8);
  Splay.ar(sig,0.5,0.95);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


// sw1 synth ///////////////////////////////////////

(
~sw1.ar(2);
~sw1.quant=16;
~sw1.fadeTime=0.2;
~sw1={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr % pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(50!2),
  WhiteNoise.ar(0.1),
  SinOsc.ar(50!2),
  WhiteNoise.ar(0.2),
  SinOsc.ar(50!2),
  WhiteNoise.ar(0.1),
  ];
  sig = SelectX.ar(LFSaw.ar(1/4).range(0,sig.size+1),sig);
  sig = sig * env;
  RecordBuf.ar(Mix(sig),b.bufnum);
  Splay.ar(sig,0.75,0.5);
};
//~sw1.play;
);
~sw1.stop(4);
~sw1.clear;
~sw1.pause;
~sw1.resume;
