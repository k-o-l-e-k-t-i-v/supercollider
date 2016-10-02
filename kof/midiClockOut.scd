
"mkfifo /tmp/cmd".unixCmd;


(
  p=ProxySpace.push(s.reboot);
  p.makeTempoClock;
)

(
  p.clock.tempo_(120/60);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);



// one synth ///////////////////////////////////////

m = MIDIOut(0);
(
m.stop;
p.clock.sched(p.clock.timeToNextBeat,{m.start;});
)




// lalala synth ///////////////////////////////////////

(
~lalala.ar(2);
~lalala.quant=1;
~lalala.fadeTime=0.2;
~lalala={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = WhiteNoise.ar(env!2);
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~lalala.play;
);
~lalala.stop(4);
~lalala.clear;
~lalala.pause;
~lalala.resume;
