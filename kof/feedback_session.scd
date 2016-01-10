

// simple synth ///////////////////////////////////////

(
~simple.ar(2);
~simple.quant=2;
~simple.fadeTime=4;
~simple={
  var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.25],inf)).lag(1/20);
  var mod2 = Duty.kr(8,0,Dseq([1,2,1.5,1.25],inf)).lag(1/2);
  var mod3 = Duty.kr(16,0,Dseq([1,2,1.5,1.25],inf)).lag(1);
  var sig = AudioIn.ar([1,1])  ;
  //sig = CombN.ar(sig,1,1,(1..16))/64+sig;
  sig = Normalizer.ar(sig);
  //sig = CompanderD.ar(sig,3/4,1/2,1/2);
 // sig = CombN.ar(sig,1/2,1/[20,40,80,120]*mod*mod2*mod3,4)/2+sig;
  //sig = sig * LFSaw.ar(4/fib(16)).exprange(0.001,1) ;
  //sig = PitchShift.ar(sig,0.05,LFSaw.ar(4/[4,3,1/12]).exprange(0.01,1.5).round(1/10));
  sig = Resonz.ar(sig,16000/(1..16)/mod*mod2/mod3,0.2,mul:LFNoise2.kr(1/4!16));
  //sig = sig * Pulse.ar(4);
  sig = GVerb.ar(sig,100,10,spread:90)/32+sig;
  sig = CompanderD.ar(sig,3/4,1/2,1/2);
  //sig = Mix.ar(sig)!2;
  Splay.ar(sig.flat,0.45,0.95);
};
~simple.play;
);
~simple.stop(4);
~simple.clear;
~simple.pause;
~simple.resume;




(
  p.clock.tempo_(120/60*16);
  
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
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+SinOsc.kr(1/4).range(-pi,pi),SinOsc.ar(50)*8pi,mul:0.01) + AudioIn.ar([1,1]);
  sig = CompanderD.ar(sig,3/4,1/3,1/2);
  sig = Normalizer.ar(sig);
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
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
~two.fadeTime=4.2;
~two={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[2.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = Dust.ar(14000,mul:0.02) + AudioIn.ar([1,1]);
 // sig = RLPF.ar(sig,LFNoise2.kr(1/4!2).range(200,12000),0.2);
  sig = sig.tanh.distort;
  sig = GVerb.ar(sig,100,10,spread:90)/16+sig;
  sig = CompanderD.ar(sig,3/4,1/2,1/2);
  sig = sig * env;
  Splay.ar(sig,0.75,0.125,SinOsc.kr(4)*pi);
};
~two.play;
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;



// onetwo synth ///////////////////////////////////////

(
~onetwo.ar(2);
~onetwo.quant=2;
~onetwo.fadeTime=0.2;
~onetwo={
  //         |       |       |       |       |  
  var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.25],inf));
  var pat = [1,1,1,1].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.75],[3,-3],curve:'exp'),imp * hit);
  var in = Normalizer.ar(AudioIn.ar([1,1]));
  var sig = [
    LFNoise1.ar(500!2),
    in,
    LFNoise1.ar(500!2),
    CompanderD.ar(LPF.ar(in,800),1/2,1/4,1/2),
    LFNoise1.ar(1500!2),
    CompanderD.ar(in,1/4,1/4,1/2),
  ];
  
  //sig = PitchShift.ar(sig,0.05,[0.9995,1.001]/mod);
 // sig = PitchShift.ar(sig,0.15,[0.995,1.0011]);
 // sig = PitchShift.ar(sig,0.25,[1.95,1.001]/mod);
 // sig = PitchShift.ar(sig,0.35,[1.95,1.002]);
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = CombN.ar(sig,1/40,1/40*mod.lag(1),4)+sig;
  sig = GVerb.ar(sig,10,3,spread:90)/16+sig;
  //sig = sig * in;
  //sig = sig * env;
  Splay.ar(sig,0.75,0.05);
};
~onetwo.play;
);
~onetwo.stop(4);
~onetwo.clear;
~onetwo.pause;
~onetwo.resume;



// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,1,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var mod2 = Duty.kr(16,0,Dseq([1,2,1.5,1.25],inf));
  var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.25],inf));
  var imp = PulseDivider.kr(~tick.kr,[4,1],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.00202,2.5],[3,-3],curve:'exp'),imp * hit);
  //var sig = SinOsc.ar(Normalizer.ar(AudioIn.ar([1,1])).range(5,12000) ) * LPF.ar(AudioIn.ar([1,1]),500);
 // var sig = LFSaw.ar(15000/mod/mod2+AudioIn.ar([1,1]).lag(1/40).range(-8pi,8pi)) * LPF.ar(AudioIn.ar([1,1]),1800);
  var sig = SinOsc.ar(50+(env**100*100*mod)) + LPF.ar(AudioIn.ar([1,1]),8);
  sig = CompanderD.ar(sig,3/4,1/2,1/2);
  //sig = CombN.ar(sig,1,1,4);
  sig = sig * env;
  //sig = GVerb.ar(sig,100,10)/2+sig;
  Splay.ar(sig,0.05,0.75);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;







