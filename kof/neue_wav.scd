


(
  p.clock.tempo_(4);

  ~offset = (0..7)/8;

  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

  ~counter = {PulseCount.kr(~tick.kr)};
);


// one synth ///////////////////////////////////////

(
  ~one.ar(2);
  ~one.quant=2;
  ~one.fadeTime=4.02;
  ~one={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,[1,4],~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
    var sig = [
      Blip.ar(50!2),
      SinOsc.ar(50!2),
      LFSaw.ar(50!2),
      DC.ar(0),
      SinOsc.ar(15000/[1,1.5,1.25,4],mul:0.2),
      DC.ar(0),
      LFNoise2.ar(16000/[1,2,3,4]);
      LFNoise1.ar(16000/[1,2,3,4]);
      LFNoise0.ar(16000/[1,2,3,4]);
    ];
    sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
    //sig = sig * env;
    //sig = CombN.ar(sig,1/4,2/[10,15,13.333,20]*1.25,1);
    //sig = AllpassN.ar(sig,1/4,1/4,8);
    Splay.ar(sig,0.15,~n1,SinOsc.ar(4));
  };
  ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;  

// two synth ///////////////////////////////////////

(
~two.ar(2);
~two.quant=2;
~two.fadeTime=0.2;
~two={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(50!2),
  Pulse.ar(50!2),
  LFNoise2.ar(5000!2),
  SinOsc.ar(5000!2,mul:0.2),
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
 // sig = sig * env;
  Splay.ar(sig,0.75,~n2);
};
~two.play;
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;



// three synth ///////////////////////////////////////

(
~three.ar(2);
~three.quant=2;
~three.fadeTime=4;
~three={
  var sig = Pulse.ar(4/[1,2,3,4],LFNoise2.kr(1/40!4));
  var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.25],inf));
  sig = CombN.ar(sig,1/50,1/50*mod,16) * LFPulse.ar([4,3,2,1]);
  sig = AllpassN.ar(sig,1/4,1/4,4);
  Splay.ar(sig,0.5,~n3);
};
~three.play;
);
~three.stop(4);
~three.clear;
~three.pause;
~three.resume;


// four synth ///////////////////////////////////////

(
~four.ar(2);
~four.quant=2;
~four.fadeTime=0.2;
~four={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(75+(env**50*500));
  sig = sig * env;
  Splay.ar(sig,0.75,~n4);
};
~four.play;
);
~four.stop(4);
~four.clear;
~four.pause;
~four.resume;
