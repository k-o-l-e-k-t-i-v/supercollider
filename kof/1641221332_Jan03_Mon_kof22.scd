


p.push();
p.pbm(121.35)

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=8;
~one.fadeTime=0.4;
~one={
    var base = [48,60,67].midicps / Duty.kr(24/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
    var pulse = Pulse.ar(~tempo*24/[4,3,2,1],LFSaw.kr(~tempo/240/[1,2,3,4]));
    var sig = SinOsc.ar(base!2 + ((pulse).tanh * base * 100),pulse * 2pi);
    sig = CompanderD.ar(GVerb.ar(sig,10,3,LFSaw.kr(~tempo/[1,2,3,4]).range(0.1,0.9))/8,sig,3/4,1,1).dist+sig;
    sig = CombL.ar(sig,~tempo,~tempo/base/100,~tempo);
    sig = LPF.ar(sig,440)/8 + BPF.ar(sig,0.1,LFSaw.ar(~tempo/4).range(22,12200)) + (sig / 8);
    sig = LeakDC.ar(sig) * Pulse.ar(~tempo);
    sig = CompanderD.ar(GVerb.ar(sig,90,2,LFSaw.kr(~tempo/[4,3,2,1]).range(0.3,1.9))/4,sig,3/4,1,1).dist+sig;
Splay.ar(sig,0.15,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


(
  ~tick.kr(1);
  ~tick.clock = p.clock;
  ~tick.quant=24;
  ~tick = { Impulse.kr(~tempo * 4); };
  ~counter = {PulseCount.kr(~tick.kr);};
);    

// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=24;
~kick.fadeTime=0.02;
~kick={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(50!2,env**20*2pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;


(
  //s.latency=0.2;
  //p.clock.tempo_(120/60);
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
  ~tick.kr(1);
  ~tick.quant = 24;
  ~counter.quant = 24;
  ~counter = {PulseCount.kr(~tick.kr);};
  ~tick = { Impulse.kr( ~tempo * 4 ); };
);



(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
)
