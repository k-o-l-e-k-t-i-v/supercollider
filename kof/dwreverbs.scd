


(
  p.clock.tempo_(240/60);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=12.2;
~one={
  var mel = Duty.kr(8,0,Dseq([1,2,1.5,1.25,4,4*1.5,4*1.25,4*1.33333].scramble,inf));
  var mod2 = Duty.kr(4,0,Dseq([1,10,2,5],inf));
  //         |       |       |       |       |  
  var pat = [
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0
  ].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]*2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.25],[3,-3],curve:'exp',timescale:[1,2,3,4]),imp * hit);
  var sig = LFSaw.ar(432/mel*mod2,SinOsc.kr(1/16/[1,2,3,4])*2pi);
  sig = IIRFilter.ar(sig,460*[1,2,4,8]);
  sig = BMoog.ar(sig,4320,LFSaw.kr(1/4/[1,2,3,4]));
  sig = sig * env;
  sig = DWGReverb.ar(sig,1000*[1,2,3,4],mix:LFNoise2.kr(1/4!4).range(0.25,0.75));
  sig = CompanderD.ar(sig,3/4,1/3,1/2);
  Splay.ar(sig,0.5,0.5);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;



// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,3.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2+(env**50*500));
  sig = sig * env;
  sig = DWGReverb.ar(sig,1000*[1,2,3,4],mix:LFNoise2.kr(1/4!4).range(0.25,0.75));
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;
