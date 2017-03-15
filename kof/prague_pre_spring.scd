

p.push();
p.bpm(90*2);

(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.15,lp=3500,hp=250,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  
  var mod = Duty.kr(~tempo*(1..8),0,Dseq([1,2,1.5,1.33333],inf));
  //fx = Limiter.ar(sig,0.95);
  wet = LFTri.kr(~tempo/8/(1..8))**2;
  sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = CombN.ar(fx,1.5/50*mod*(1..8),1.5/50*(1..8)*mod,2);
  fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]).distort**0.92/2;
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
  
);
p.moveNodeToTail(\master);

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=4;
~one.fadeTime=8;
~one={
  var mod = Duty.kr(~tempo*[4,16,2,1],0,Dseq([1,2,1.5,1.33333],inf));
  var sig = SinOsc.ar([1,2,3,4]/16/16,SinOsc.ar(15/16/[1,2,3,4]));
  sig = LFSaw.ar(sig.range(500,20000).round(3333.3/mod/[1,2,3,4]),0, LFPulse.ar(12/[1,2,3,4],LFNoise2.kr(3/16/16)/80,0.0333));
  sig = CombN.ar(sig,1/33.3334,1/33.3*[1,2,3,4],4);
  sig = Resonz.ar(sig,33.3333*[1,15,40,20],LFNoise2.kr(~tempo/16!4).range(0.02,0.32));
  sig = Normalizer.ar(sig);
  Compander.ar(sig,~kick2.ar+~kick.ar,0.1,1,0.1);
  Splay.ar(sig,0.5,0.15);
};
~one.play;
);
~one.stop(32);
~one.clear;
~one.pause;
~one.resume;


// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.clock = p.clock;
~kick.quant=[4,0];
~kick.fadeTime=0.02;
~kick={
  //  |       |       |       |       |  
  var pat = [
    1,1,1,1, 0,0,0,0, 0,0,0,0, 0,0,0,0,
  ].rotate(1);
  var len = LFNoise2.kr(~tempo/16).range(1/4,4);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5]*len,[3,-3]),imp * hit)};
  var sig = VarSaw.ar(50!2+(env**400.92*15000),0,(env**40.0) + (env**0.12));
  sig = sig * env;
  Splay.ar(sig,0.75,0.05);
};
~kick.play;
);
~kick.stop(32);
~kick.clear;
~kick.pause;
~kick.resume;

// hiss synth ///////////////////////////////////////

(
~hiss.ar(2);
~hiss.clock = p.clock;
~hiss.quant=[16,0];
~hiss.fadeTime=0.02;
~hiss={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1,
  ].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15*[1,2,3,4]],[3,-3]),imp * hit);
  var sig = HPF.ar(WhiteNoise.ar(env**LFNoise2.kr(1/4/[1,2,3,4]).range(0.1,8)),8000) + GrayNoise.ar(env**LFNoise2.kr(1/4/[1,2,3,4]).range(0.7,16));
  sig = sig * env;
  Compander.ar(sig,~kick2.ar+~kick.ar,0.1,1,0.1);
  Splay.ar(sig,0.335,0.5);
};
~hiss.play;
);
~hiss.stop(64);
~hiss.clear;
~hiss.pause;
~hiss.resume;

(
  s.latency=0.2;
  //p.clock.tempo_(120/60);
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
  ~tick.kr(1);
  ~tick.clock = p.clock;
  ~tick.quant = 16;
  ~counter.clock = p.clock;
  ~counter.quant = 16;
  ~counter = {PulseCount.kr(~tick.kr);};
  ~tick = { Impulse.kr( ~tempo * 4 ); };
);


// kick2 synth ///////////////////////////////////////

(
~kick2.ar(2);
~kick2.clock = p.clock;
~kick2.quant=[16,0];
~kick2.fadeTime=0.02;
~kick2={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(50+(env**50*500),env**50*4pi);
  sig = sig * env;
  Splay.ar(sig,0.005,0.25);
};
~kick2.play;
);
~kick2.stop(32);
~kick2.clear;
~kick2.pause;
~kick2.resume;
