



(
  p=ProxySpace.push(s.reboot);
  p.makeTempoClock;
)

(
  p.clock.tempo_(60/60);
)

~pos={LFTri.kr(1/150).range(20,10000)};
~spread={1000};



~kick.clear

(

  ~offset = (0..7)/8;

  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

  ~counter = {PulseCount.kr(~tick.kr)};
  ~time = {LFSaw.kr(~tempo/4).range(0,1)};

  // snth synth ///////////////////////////////////////

  ~snth.quant=4;
  ~snth.fadeTime=0.2;
  ~snth={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var mod = Select.kr(PulseCount.kr(hit)%4,fib(4,1,2));
    var mod2 = Select.kr(PulseCount.kr(hit)/16%4,[1,2,3,4]);
    var len = (3.7)*2/~tempo;
    var env = EnvGen.ar(Env([0.00001,1,0.00001],[0.15,len],[1,-3],curve:'exp'),imp * hit);
    var freq = (mod)*~spread.kr+~pos.kr;
    var sig = SinOsc.ar(5+(env**20*200));
    sig = Resonz.ar(sig,LFNoise2.kr(1/4!8).range(50,800));
    SendTrig.ar(K2A.ar(hit*imp),0,2000);
    sig = sig * env;
    Splay.ar(sig.flat,0.75,0.95);
  };
  ~snth.play;



);


//resender
(
  m = NetAddr("224.0.0.1", 10001);

  // output triggers
  o = OSCFunc({ arg ...args;
               args.postln;
               m.sendMsg("/tempo",args[0][3]);
              },'/tr', s.addr);


  // output triggers
  r = OSCFunc({ arg ...args;
              "recieved".postln;
               args.postln;
              },'/tempo', m.addr);

)
