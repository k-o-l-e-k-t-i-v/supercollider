



(
  p=ProxySpace.push(s.reboot);
  p.makeTempoClock;
)

(
  p.clock.tempo_(60/60);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);

(

  ~kick = {DC.ar(0!2)};
  ~kick.quant=4;
  ~kick.fadeTime=0.2;
  ~kick={
    //         |       |       |       |       |  
    var pat = [1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(500 + (env**40*400));
    SendTrig.ar(K2A.ar(hit*imp),0,{TRand.kr(0,1,hit*imp)});
    sig = sig * env;
    Splay.ar(sig,0.75,0.2);
  };
  ~kick.play;
);
~kick.clear

TRand.help


//resender
(
  m = NetAddr("172.20.4.32", 7000);

  // output triggers
  o = OSCFunc({ arg ...args;
               args.postln;
               m.sendMsg("/trig",args[0][3]);
              },'/tr', s.addr);
)
