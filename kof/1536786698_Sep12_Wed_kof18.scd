
p.bpm(67);
p.push();

// dart synth ///////////////////////////////////////

(
~dart.ar(2);
~dart.clock = p.clock;
~dart.quant=2;
~dart.fadeTime=4;
~dart={
  var sig;
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3]),Impulse.ar(4));
  sig = SinOsc.ar(33+(env**80*1300),env**20*2pi);
  sig = sig * env;
  Splay.ar(sig,0.5,0.25);
};
~dart.play;
);
~dart.stop(4);
~dart.clear;
~dart.pause;
~dart.resume;


SynthDescLib.global.read;
SynthDescLib.global.browse;


// krack synth ///////////////////////////////////////

(
~krack.ar(2);
~krack.clock = p.clock;
~krack.quant=[4,0];
~krack.fadeTime=0.02;
~krack={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1,
  ].rotate(1);
  var mod2 = Duty.kr([1,2,3]/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
  var mod = Duty.kr(1/4/~tempo,0,Dseq([2,8,2,2,2,4,2,4],inf))/mod2;
  var imp = PulseDivider.kr(~tick.kr,[1,2,3],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(45!2,env**40*8pi);
  sig = sig + Perlin3.ar(sig*mod,SinOsc.ar(SinOsc.ar([50,500,5000]*mod).range(8,2500).round(50)),env*mod);
  sig = sig * env;
  sig = Mix.ar(LPF.ar(sig,500)) + HPF.ar(sig,500);
  Splay.ar(sig,0.75,0.25);
};
~krack.play;
);
~krack.stop(4);
~krack.clear;
~krack.pause;
~krack.resume;
