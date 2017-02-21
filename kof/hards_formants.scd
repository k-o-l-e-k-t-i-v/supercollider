

p.push();
p.bpm(120);
// one synth ///////////////////////////////////////


(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.15,lp=3500,hp=250,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = CompanderD.ar(sig,3/4,1/1.5,1);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  sig = CompanderD.ar(sig,3/4,1/1.15,1);
  ReplaceOut.ar(0,sig);
  };
p.moveNodeToTail(\master);
);

(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(40);};});
}.fork;  
)

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=16;
~one.fadeTime=4;
~one={
  var mod = Duty.kr(16,0,Dseq([1,2,1.5,1.33333],inf));
  var sig = Formant.ar([150,100]/[1,2,1.3333,1.25]+(Pulse.ar(1/[1,2,3,4])*150)/mod,50*LFTri.kr(1/4/(1..4)+0.001),LFSaw.kr(1/16/(1..4)).range(5,5000)/mod);
  sig = sig * Pulse.ar(4/[1,2,3,4]);
  sig = LPF.ar(sig,10000/mod);
  sig = CombC.ar(sig,1/5000,1/4,[1,2,3,4]);
  sig = CompanderD.ar(sig,3/4,1/2,1);
  sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
  Splay.ar(sig,0.5,0.15);
};
~one.play;
);
~one.stop(16);
~one.clear;
~one.pause;
~one.resume;

// hiss synth ///////////////////////////////////////

(
~hiss.ar(2);
~hiss.clock = p.clock;
~hiss.quant=[16,0];
~hiss.fadeTime=0.02;
~hiss={
  //  |       |       |       |       |  
  var pat = [
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,1,1,1,
  ].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.095],[3,-3]),imp * hit);
  var sig = WhiteNoise.ar(0.2!4);
  sig = HPF.ar(sig,16000/[1,2,10,20]);
  sig = sig * env;
  sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
  Splay.ar(sig,0.75,0.5);
};
~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;


// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.clock = p.clock;
~kick.quant=[16,0];
~kick.fadeTime=0.02;
~kick={
  //  |       |       |       |       |  
  var pat = [
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[2,4,8],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.0],[3,-3]),imp * hit);
  var sig = SinOsc.ar(50 + (env**100*80),env**100*8pi);
  sig = sig * env;
  sig = VarSaw.ar(50+(env**50*500),0,env**0.72) * (env**LFNoise2.kr(1/32!2).range(0.01,0.9))/3 + sig;
  sig = CompanderD.ar(sig,3/4,1/2,1);
  Splay.ar(sig,0.005,0.333);
};
~kick.play;
);
~kick.stop(16);
~kick.clear;
~kick.pause;
~kick.resume;


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
