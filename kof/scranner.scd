(
  p=ProxySpace.push(s.reboot);
  p.makeTempoClock;
);

(
  p.clock.tempo_(240/60);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);



(
~sell.quant=2;
~sell={LFTri.kr(1/64*~tempo)**4};
)


// scanner synth ///////////////////////////////////////

(
~scanner.ar(2);
~scanner.quant=2;
~scanner.fadeTime=0.2;
~scanner={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr % pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.005,0.25],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(50),
  LFNoise2.ar(1500),
  Pulse.ar(2),
  LFNoise1.ar(16000),
  LFSaw.ar(500!2,mul:0.1),
  LFNoise2.ar(1500),
  Pulse.ar(4),
  Blip.ar(50,3);
  WhiteNoise.ar(1),
  SinOsc.ar(12500),
  LFSaw.ar(75),
  SinOsc.ar(50),
  ];
  sig = SelectX.ar(~sell*sig.size,sig);
  sig = Resonz.ar(sig,LFNoise2.kr(1/4/[1,2,3,4]).exprange(100.01,16000),0.2,mul:2)+sig/2;
  sig = CombN.ar(sig,1/4,1/4+(~sell.kr/20),1)+sig;
  sig = CompanderD.ar(sig,3/4,1/3,1/2);
  sig = Limiter.ar(sig,0.95)/2;
  sig = LPF.ar(GVerb.ar(sig,90,3)/2,2000)+sig/2;
  Splay.ar(sig,0.95,0.125,SinOsc.kr(4.1));
};
~scanner.play;
);
~scanner.stop(4);
~scanner.clear;
~scanner.pause;
~scanner.resume;

