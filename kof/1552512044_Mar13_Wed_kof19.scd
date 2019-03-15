


p.push();
p.bpm(125)


// odd synth ///////////////////////////////////////

(
~odd.ar(2);
~odd.quant=[16,0];
~odd.fadeTime=0.02;
~odd={
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
  var sig = SinOsc.ar(50!2,env**50*8pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~odd.play;
);
~odd.stop(4);
~odd.clear;
~odd.pause;
~odd.resume;


// even synth ///////////////////////////////////////

(
~even.ar(2);
~even.quant=[16,0];
~even.fadeTime=0.02;
~even={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 0,0,0,0, 1,0,1,0,
  ].rotate(5);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(60!2,env**40*8pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~even.play;
);
~even.stop(4);
~even.clear;
~even.pause;
~even.resume;

(
~kiler.ar(2);
~kiler.quant=16;
~kiler.fadeTime=0.2;
~kiler={
  //         |       |       |       |       |  
  var pat = [1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4,7,8],~counter.kr % pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var mel = Duty.kr(32/~tempo*[1,2,3,4,8,16,32],0,Dseq([1,2,1.5,1.33333],inf));
  var sig = [
  SinOsc.ar(500!2/mel),
  BrownNoise.ar(0.2),
  SinOsc.ar(1500!2,mul:0.2),
  WhiteNoise.ar(0.62),
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = [
    LPF.ar(sig,5000),
    HPF.ar(sig,1500),
    BPF.ar(sig,1500),
    Resonz.ar(sig,5000,0.2),
      
];
  sig = Select.ar(PulseCount.kr(imp*hit)/8%sig.size,sig);

  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kiler.play;
);
~kiler.stop(4);
~kiler.clear;
~kiler.pause;
~kiler.resume;






