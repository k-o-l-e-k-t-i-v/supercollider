

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
~one.fadeTime=0.2;
~one={
  var mod = Duty.kr(16,0,Dseq(100/[1.5,2,1.333,3],inf)).lag(1);
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(mod+(env**20*500),SinOsc.ar(4.01*(env))*env**6.2*8pi);
  sig = sig * env;
  Splay.ar(sig,0.005,0.45);
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
  var imp = PulseDivider.kr(~tick.kr,[8,3,4,5],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.007,2.15/[1,2,3,4]],[3,-3],curve:'exp'),imp * hit);
  var sig = Dust.ar(16000);
  sig = RLPF.ar(sig,5000/[1,1.5,3,1.25],SinOsc.kr(4.011/[1,2,3,4],add:1));
  sig = sig * (env**[3,4,5,6]);
  Splay.ar(sig,0.25,0.25);
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
~three.fadeTime=0.2;
~three={
  var mds = [1,1.5,2,4];
  //         |       |       |       |       |  
  var pat = [0,0,0,0,1,0,0,0,1,0,0,0,1,0,0,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[3,4,5,6],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,0.0001],[0.002,SinOsc.kr(1/[2,3,4,5]).range(0.01,0.75)],[3,-30],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50*(1/(1..16)+1),mul:SinOsc.kr(1/4).range(0,0.2));
  sig = Vibrato.ar(sig,[4,3,8,16],0.28);
  sig = MoogFF.ar(sig,5000/mds,2.95*env**0.92);
  sig = sig * env;
  Splay.ar(sig,0.95,0.25,SinOsc.kr([2,3.01])*pi);
};
~three.play;
);
~three.stop(4);
~three.clear;
~three.pause;
~three.resume;


(
~compress={
  var sig = ~one.ar+~two.ar+~three.ar;
  sig = GVerb.ar(sig,[30,10],[3,4],SinOsc.kr(1/8/[4.0111,4.1]).range(0.1,0.9),[0.22,0.9],spread:55)/8+sig;
  sig = CompanderD.ar(sig,3/4,1/10,1/2,0.0002,0.32);
  Splay.ar(sig,0.82,0.133,SinOsc.kr(1/4.1)*pi);
};
~compress.play;
)
