



ProxySpace.push(s).makeTempoClock;

p.connect;

p.restartClock;
p.time;
p.metro(2);




  p.makeTempoClock;  
  p.clock.tempo_(60/60);
(
  ~offset = {(0..7)/8};
  
  ~tick.quant = 2;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);


// sync synth ///////////////////////////////////////

(
~sync.ar(2);
~sync.quant=[2,-1/2];
~sync.fadeTime=0.2;
~sync={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(5000,env**40*8pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~sync.play;
);
~sync.stop(4);
~sync.clear;
~sync.pause;
~sync.resume;








