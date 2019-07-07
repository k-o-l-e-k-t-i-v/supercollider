

p.push();
p.bpm(73.3*2)

// klick synth ///////////////////////////////////////

(
~klick.ar(2);
~klick.quant=[16,0];
~klick.fadeTime=0.02;
~klick={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.2,1.5],[3,-3]),imp * hit);
  var f = 1500 / Duty.kr([1,2,3,4]*16/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
  var sig = Perlin3.ar(LFSaw.ar(~tempo/16/[1,10,100,1000]),SinOsc.ar(f+(env**10*100))+1,env*10);
  sig = sig + SinOsc.ar(f/8) * env;
  Splay.ar(sig,0.75,0.15);
};
~klick.play;
);
~klick.stop(4);
~klick.clear;
~klick.pause;
~klick.resume;


// klack synth ///////////////////////////////////////

(
~klack.ar(2);
~klack.quant=[16,0];
~klack.fadeTime=0.02;
~klack={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
  ].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(45!2+(env**20*15),env**50*8pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~klack.play;
);
~klack.stop(4);
~klack.clear;
~klack.pause;
~klack.resume;
