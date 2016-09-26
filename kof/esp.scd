
Esp.person = "Kof"; // set your name on the grid
Esp.machine = "t520"; // identify the machine on the grid
//Esp.broadcast = "192.168.0.255"; // change the broadcast address (if necessary)
Esp.clockMode = 5; // change the clock sync mode (see EspGrid documentation)
Esp.chat("hi there"); // send a chat message with EspGrid
// TempoClock synchronization

TempoClock.default = EspClock.new; // make the default clock a new EspClock
TempoClock.default.start; // if the beat is paused/was-never-started, make it go
TempoClock.tempo = 60/60; // change tempo in normal SC way (all changes shared via EspGrid)
TempoClock.default.pause; // pause the beat




(
p.clock = EspClock.new;
p.clock.start;
p.clock.tempo = 1;
)


(
  p=ProxySpace.push(s.reboot,\kof_proxy,TempoClock.default);
  //p.makeTempoClock;
);

(
  //p.clock.tempo_(120/60);
  //p.clock_(TempoClock.default);
  ~offset = {(0..7)/8};
  
  ~tick.quant = 4;
  ~tick = {Mix(Impulse.kr( ~tempo.kr / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);


// kk synth ///////////////////////////////////////

(
~kk.ar(2);
~kk.quant=2;
~kk.fadeTime=0.2;
~kk={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(500!2,mul:0.2);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kk.play;
);
~kk.stop(4);
~kk.clear;
~kk.pause;
~kk.resume;
