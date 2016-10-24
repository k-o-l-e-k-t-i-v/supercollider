(
  p.makeTempoClock;  
  ~offset = {(0..7)/8};
  
  //~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  p.clock.tempo_(60/60);
);

(
    s.latency=0;
    ~tick.kr;
    ~counter = {PulseCount.kr(~tick.kr)};
    ~tick.fadeTime=0;
    ~tick.quant=0;
    ~tick = { Trig1.kr(1.0,0.05) };
    t = p.clock;
    t.sched(t.timeToNextBeat(1),{~tick.rebuild; 1;});
)


(
  
  p.clock.tempo_(127/60*2);

);

p.clock.beats=0;

(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.5,lp=3500,hp=250,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = Compander.ar(sig,3/4,1/1.1,1/3);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);

T2K.help
Trig1.help

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=0.2;
~one={
  //         |       |       |       |       |  
  var pat = [1,1,1,1].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2,env**40*8pi);
  SendTrig.kr(~tick.kr);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;



//resender
(
  // output triggers
  o = OSCFunc({ arg ...args;
               //args.postln;
               //m.sendMsg("/trig",args[0][3]);
                p.clock.beats.postln;
              },'/tr', s.addr);
)
