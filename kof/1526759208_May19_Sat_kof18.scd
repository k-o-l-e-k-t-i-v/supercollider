p.push();
p.bpm(121)

(
  s.latency=1;
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


// kicker synth ///////////////////////////////////////

(
~kicker.ar(2);
~kicker.quant=8;
~kicker.fadeTime=0.2;
~kicker={
  //         |       |       |       |       |  
  var pat = [
      1,0,1,0,
      1,1,1,1,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr % pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = [
      {EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5]*LFSaw.kr(~tempo/16),[3,-3],curve:'exp'),imp * hit)},
      {EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5]*LFSaw.kr(~tempo/32),[3,-3],curve:'exp'),imp * hit)},
      {EnvGen.ar(Env([0.001,1,0.0001],[0.002,3.5]*LFSaw.kr(~tempo/16),[3,-3],curve:'exp'),imp * hit)},
      {EnvGen.ar(Env([0.001,1,0.0001],[0.002,8.5]*LFSaw.kr(~tempo/32),[3,-3],curve:'exp'),imp * hit)},
  ];
  var sig = [
  SinOsc.ar(50!2+WhiteNoise.ar(env**20*900),env**40*2pi),
  WhiteNoise.ar(0.6!2),
  SinOsc.ar(50!2+WhiteNoise.ar(env**40*450),env**80.5*8pi),
  PinkNoise.ar(0.6!2)
  ];
  sig = sig * env;
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  Splay.ar(sig,0.15,0.5);
};
~kicker.play;
);
~kicker.stop(4);
~kicker.clear;
~kicker.pause;
~kicker.resume;


// tone synth ///////////////////////////////////////

(
~tone.ar(2);
~tone.clock = p.clock;
~tone.quant=[16,0];
~tone.fadeTime=0.02;
~tone={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
  ].rotate(3);
  var mod = Duty.kr(16*[1,2,3,4]/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = {EnvGen.ar(Env([0.001,1,0.0001],[1,4.5]*LFNoise2.kr(~tempo/64),[3,-3]),imp * hit)};
  var sig = VarSaw.ar(100 / mod + SinOsc.ar(~tempo/[1,2,3,4]/128),0,env**0.5/[1,2,34]);
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~tone.play;
);
~tone.stop(4);
~tone.clear;
~tone.pause;
~tone.resume;

(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.15,lp=3500,hp=250,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);
