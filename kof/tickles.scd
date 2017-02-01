p.bpm(120)

p.push();

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=[16,0];
~one.fadeTime=0.14;
~one={
  var env = Decay2.ar(Impulse.ar(4/[1,2,3,4]),0.1,0.2);
  var mod = Duty.kr([4,16,64]/4,0,Dseq([1,2,1.5,1.33333],inf)) / 2;
  var fs = [60,48,72].midicps/[mod[0],mod[1],mod[2]] * [32,8,16];
  var phases = Pulse.ar(2/[2,3,4],env**0.5) * LFPulse.ar(fs/2,env**2);
  var sig = SinOsc.ar(fs+([1,2,3]/100),phases) * LFTri.kr(8/[2,3,4]);
  Splay.ar(sig,0.15,0.15);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


// tickle synth ///////////////////////////////////////

(
~tickle.ar(2);
~tickle.clock = p.clock;
~tickle.quant=[16,0];
~tickle.fadeTime=0.02;
~tickle={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,1,1,1, 1,0,1,0, 1,1,1,1,
  ].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var len = Duty.kr([4,2,3,5],0,Dseq([1,2,1.5,1.33333,4,8,10],inf));
  var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.25/len],[3,-3]),imp * hit)};
  var sig = Dust.ar(4+(env**30*15000));
  sig = HPF.ar(sig,5000);
  sig = sig * env;
  Splay.ar(sig,0.25,0.15);
};
~tickle.play;
);
~tickle.stop(4);
~tickle.clear;
~tickle.pause;
~tickle.resume;

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

// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.clock = p.clock;
~kick.quant=[16,0];
~kick.fadeTime=0.02;
~kick={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,1,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,4.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(50!2,env**30*8pi);
  sig = sig * env;
  Splay.ar(sig,0.05,0.85);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;


(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.25,lp=3500,hp=150,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverb.ar(NumChannels.ar(fx,2),[4000.345,3000.234,5000,5010],1/len/[1,2,3,4])/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
p.moveNodeToTail(\master);
);
