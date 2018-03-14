
p.push();


OpenObject.openInterpreter;


TempoClock.reset;


().play;


(
  //s.latency=0.2;
  //p.clock.tempo_(120/60);
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
  ~tick.kr(1);
  ~tick.clock = p.clock;
  ~tick.quant = 15;
  ~counter.clock = p.clock;
  ~counter.quant = 15;
  ~counter = {PulseCount.kr(~tick.kr);};
  ~tick = { Impulse.kr( ~tempo * 4 ); };
);


// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.clock = p.clock;
~kick.quant=[16,0];
~kick.fadeTime=0.02;
~kick={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
  ];
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,4.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(50!2,env**80*8pi);
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
SynthDef(\test,{
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3]),doneAction:Done.freeSelf);
    var sig = LPF.ar(VarSaw.ar(50+(env**4*50)!2,0,env*80),env.range(100,10000));
    sig = sig * env;
    Out.ar(0,sig);
}).add;
)

//while true; do sleep 60; oscsend localhost 57120 /oo_i s "Synth.new(\test)"& ; done
