
p.push
p.bpm(120)

(
  //s.latency=0.2;
  //p.clock.tempo_(120/60);
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
  ~tick.kr(1);
  ~tick.quant = 16;
  ~counter.quant = 16;
  ~counter = {PulseCount.kr(~tick.kr);};
  ~tick = { Impulse.kr( ~tempo * 4 ); };
);

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=[16,0];
~one.fadeTime=4;
~one={
  var sig = LFTri.ar(~tempo/4/[1,2,3,4]) ** 2 * WhiteNoise.ar(0.1!4);
  sig = sig + (LPF.ar(sig,8000/[1,2,3,4]));
  Splay.ar(sig,0.95,0.15,SinOsc.kr([1,2,3,4]));
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

// harsh synth ///////////////////////////////////////

(
~harsh.ar(2);
~harsh.quant=16;
~harsh.fadeTime=0.2;
~harsh={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr % pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(50!2),
  WhiteNoise.ar(0.1),
  LFSaw.ar(50),
  LFSaw.ar(150),
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  //sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~harsh.play;
);
~harsh.stop(4);
~harsh.clear;
~harsh.pause;
~harsh.resume;


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(50!2);
  Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;




