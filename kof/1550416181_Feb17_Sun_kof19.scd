
// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=16;
~one.fadeTime=7;
~one={
    var mel = Duty.kr(4/~tempo*[1,2,3],0,Dseq([1,2,1.5,1.33333],inf));
  var sig = SinOsc.ar(5000/mel)/10;
  sig = Shaper.ar(b,sig + LFSaw.ar(8/[1,2,3]) + (Pulse.ar(2/[1,2,3])/8) );
  sig = RLPF.ar(sig, 1500/[1,2,3,4] ) * (LFTri.ar(1/4/[1,2,3])**2,0.2);
  Splay.ar(sig,0.5,0.25,SinOsc.ar(1/4));
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


p.push();


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = BrownNoise.ar(1);
  Splay.ar(sig,0.5,1);
};
~one.play;
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
  var sig = Pulse.ar(~tempo);
  Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

(
  s.latency=0.2;
  //p.clock.tempo_(120/60);
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
  ~tick.kr(1);
  ~tick.clock = p.clock;
  ~tick.quant = 16;
  ~counter.clock = p.clock;
  ~counter.quant = 16;
  ~counter = {PulseCount.kr(~tick.kr);};
  ~tick = { Impulse.kr( ~tempo * 4 ); };
);

p.bpm(120);
// kkick synth ///////////////////////////////////////

(
~kkick.ar(2);
~kkick.clock = p.clock;
~kkick.quant=[16,0];
~kkick.fadeTime=0.02;
~kkick={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,1,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.02,1.5]*LFNoise1.kr(1/16).range(0.1,3),[3,-3]),imp * hit)};
  var mel = Duty.kr(4/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
  var sig = SinOsc.ar(50+(env**120*500),env**80*2pi) + LFSaw.ar(49*4/mel+(env**0.2*50),mul:0.15);
  sig = sig * env;
  Splay.ar(sig,0.95,0.85);
};
~kkick.play;
);
~kkick.stop(30);
~kkick.clear;
~kkick.pause;
~kkick.resume;

(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
)

// drama synth ///////////////////////////////////////

(
~drama.ar(2);
~drama.clock = p.clock;
~drama.quant=[16,0];
~drama.fadeTime=0.02;
~drama={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.2,4.5],[3,-3]),imp * hit);
  var mel = Duty.kr(4/~tempo,0,Dseq([1,2,1.5,1.33333],inf)) ;
  var sig = Shaper.ar(b,env ** LFSaw.ar(20/mel).range(1,80));
  sig = sig * env;
  sig = LPF.ar(sig,6000);
  Splay.ar(sig,0.15,0.5,SinOsc.ar(1/4)/2);
};
~drama.play;
);
~drama.stop(4);
~drama.clear;
~drama.pause;
~drama.resume;
p.bpm(240)
(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(200);};});
}.fork;  
)

// hiss synth ///////////////////////////////////////

(
~hiss.ar(2);
~hiss.clock = p.clock;
~hiss.quant=[16,0];
~hiss.fadeTime=2.02;
~hiss={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1,
  ].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4,5,6,7,8],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15],[3,-3]),imp * hit);
  var sig = WhiteNoise.ar(0.05) + BrownNoise.ar(0.1) + (Osc.ar(b,1/4)/8);
  sig = sig * env;
  sig = RHPF.ar(sig,LFNoise1.ar(4).range(1500,15000),0.52);
  Splay.ar(sig,0.15,0.35,SinOsc.ar(1/4)/2);
};
~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=4;
~one.fadeTime=4;
~one={
  var sig = Shaper.ar(b,Pulse.ar(1/4)/20);
  sig = LeakDC.ar(sig) * (LFSaw.ar(1/4*LFSaw.ar(4).range(1,4))**2);
  Splay.ar(sig,0.5,0.005);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

b = Buffer.alloc(s,4096,1);

(
  ~asd.ar(3);
  ~asd.clock = p.clock;
  ~asd.quant=4;
  ~asd.fadeTime=4;
  ~asd={
    var f = 50;
    var sig = [
      SinOsc.ar(f),
      BrownNoise.ar(1),
      LFSaw.ar(f),
    ];
    RecordBuf.ar(Mix(sig),b.bufnum,loop:0);
  };
);


// low synth ///////////////////////////////////////

(
~low.ar(2);
~low.clock = p.clock;
~low.quant=[16,0];
~low.fadeTime=0.02;
~low={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3]),imp * hit);
  var sig = Shaper.ar(b,LFSaw.ar(1/4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~low.play;
);
~low.stop(4);
~low.clear;
~low.pause;
~low.resume;

b = Buffer.allocConsecutive(3,s,4096,1);
(
  ~recorder.ar(3);
  ~recorder.clock = p.clock;
  ~recorder.quant=4;
  ~recorder.fadeTime=4;
  ~recorder={
    var f = 50;
    var sig = LFClipNoise.ar(1);
    RecordBuf.ar(Mix(sig),b.bufnum,loop:0);
  sig;
  };
);

// calllm synth ///////////////////////////////////////

(
~calllm.ar(2);
~calllm.clock = p.clock;
~calllm.quant=2;
~calllm.fadeTime=4;
~calllm={
  var sig = SinOsc.ar();
  Splay.ar(sig,0.5,0.25);
};
~calllm.play;
);
~calllm.stop(4);
~calllm.clear;
~calllm.pause;
~calllm.resume;

(
  s.latency=0.2;
  //p.clock.tempo_(120/60);
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
  ~tick.kr(1);
  ~tick.clock = p.clock;
  ~tick.quant = 16;
  ~counter.clock = p.clock;
  ~counter.quant = 16;
  ~counter = {PulseCount.kr(~tick.kr);};
  ~tick = { Impulse.kr( ~tempo * 4 ); };
);

// kkk synth ///////////////////////////////////////

(
~kkk.ar(2);
~kkk.clock = p.clock;
~kkk.quant=2;
~kkk.fadeTime=4;
~kkk={
  var sig = Formant.ar(50/[1,2,1.5],150.2,501*[1,2]) * LFSaw.ar(4);
  sig = sig + (sig*LFSaw.ar(50));
  Splay.ar(sig,0.85,0.15);
};
~kkk.play;
);
~kkk.stop(4);
~kkk.clear;
~kkk.pause;
~kkk.resume;


// lalala synth ///////////////////////////////////////

(
~lalala.ar(2);
~lalala.clock = p.clock;
~lalala.quant=4;
~lalala.fadeTime=4;
~lalala={
    var mel = Duty.kr(4/~tempo,0,Dseq([1,2,1.5,1.33333],inf)) / 2;
  var t = LFSaw.ar(500/[1,1/2*[1,2,8],1.5]*mel) + LFSaw.ar(1/16/[1,2,3]);
  var sig = Perlin3.ar(t[0],t[1],t[2]) * (LFSaw.ar(4/[1,2,3])**2);
  Splay.ar(sig,0.95,0.25);
};
~lalala.play;
);
~lalala.stop(4);
~lalala.clear;
~lalala.pause;
~lalala.resume;

(
  //s.latency=0.2;
  //p.clock.tempo_(120/60);
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
  ~tick.kr(1);
  ~tick.clock = p.clock;
  ~tick.quant = 16;
  ~counter.clock = p.clock;
  ~counter.quant = 16;
  ~counter = {PulseCount.kr(~tick.kr);};
  ~tick = { Impulse.kr( ~tempo * 4 ); };
);
