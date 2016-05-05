
"mkfifo /tmp/cmd".unixCmd;


(
  p=ProxySpace.push(s.reboot);
  p.makeTempoClock;
)

(
  p.clock.tempo_(240/60);
  
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
    var pat = [1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,1].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
    //var sig = SinOsc.ar(50, (env**40/[1,2,10,20]*8pi));
    var sig = CompanderD.ar(Mix.ar(AudioIn.ar([1,2],mul:8),3/4,1/2,1/2));
    sig = CombN.ar(sig,1/5,1/5,1) + SinOsc.ar(50,env**20*8pi);
    SendTrig.ar(K2A.ar(hit*imp),0,{TRand.ar(-0.1,0.1,hit*imp)});
    sig = sig * env;
    Splay.ar(sig,0.05,0.5);
  };
  ~kick.play;
);
~kick.clear

TRand.help


//resender
(
  m = NetAddr("127.0.0.1", 7000);

  o=nil;
  // output triggers
  o = OSCFunc({ arg ...args;
               args.postln;
               File.use("/tmp/cmd".standardizePath,"wb",{|f| f.write("seek "++args[0][3]++"\n"); });
               m.sendMsg("/trig",args[0][3]);

              },'/tr', s.addr);
)
