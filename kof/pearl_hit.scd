




// prln synth ///////////////////////////////////////

(
~prln.ar(2);
~prln.quant=2;
~prln.fadeTime=4;
~prln={
  var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.33333],inf));
  var t = LFTri.ar([1,200/mod,50]) + LFTri.ar([1/50,1/600,1/7000]) ** LFNoise2.kr(1/16!4,mul:4,add:1);
  var sig = Perlin3.ar(t[0],t[1],t[2]) * (LFTri.ar(1/4/[1,2,3])**4) + Formant.ar(50,1500,1500);
  sig = sig * SinOsc.ar(4.5/[1,2,3]);
  Splay.ar(sig,0.95,0.5);
};
~prln.play;
);
~prln.stop(4);
~prln.clear;
~prln.pause;
~prln.resume;


(
  p.clock.tempo_(120/60*2);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);

// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,1].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,3.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2,env**20*8pi) + Formant.ar(50,env**10*150,env**5*150);
  sig = sig * env;
  Splay.ar(sig,0.05,0.75);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;
