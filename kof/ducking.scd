

(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);

(
  ~tick.kr(1);
  ~tick.clock = p.clock;
  ~tick.quant=16;
  ~tick = { Impulse.kr(~tempo * 2); };
  ~counter = {PulseCount.kr(~tick.kr);};
);


p = NetProxy.push();
p.bpm(110);
s.latency = 0.5;
p.makeTempoClock;
(
  TempoClock.default = p.clock;
  p.clock.tempo_(120/60);
  p.arProxyNames.do(p[_.asSymbol].rebuild);
)

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
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
  ];
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(50!2,env**40*8pi);
  sig = sig * env;
  Splay.ar(sig,0.005,0.5);
};
//~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;

// hiss synth ///////////////////////////////////////

(
~hiss.ar(2);
~hiss.clock = p.clock;
~hiss.quant=[16,1/16];
~hiss.fadeTime=0.02;
~hiss={
  //  |       |       |       |       |  
  var pat = [
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,1,1,1,
  ];
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.05],[3,-3]),imp * hit);
  var sig = WhiteNoise.ar(0.1!2);
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;

(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.5,lp=3500,hp=250,len=20,rev = 2|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  sig = Compander.ar(sig,~kick.ar,LFNoise2.kr(1/4*~tempo!2).range(0.1,0.9),1,0.01);
  sig = sig + ~kick.ar;
  sig = HPF.ar(sig,20);
  sig = HPF.ar(sig,20);
  sig = Limiter.ar(sig,0.95);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);

(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
)


// background synth ///////////////////////////////////////

(
~background.ar(2);
~background.clock = p.clock;
~background.quant=[16,0];
~background.fadeTime=0.02;
~background={
  //  |       |       |       |       |  
  var pat = [
    1,1,1,1
  ];
  var base = ([60]).midicps;
  var mod2 = Duty.kr(4*16/~tempo*[2,4,8],0,Dseq([1,2,1,4,1,1.5],inf));
  var mod = Duty.kr(16/~tempo*[2,4,8],0,Dseq([1,0.5,1.5,1.33333]/mod2*[1,2,0.5],inf)).lag(1/40);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = {EnvGen.ar(Env.asr(0.002,2/16*mod,3/16*mod,[1,-2,-4]*mod),imp * hit)};
  var t = SinOsc.ar([base*mod,LFSaw.kr(1/320*~tempo,mul:10),env**LFDNoise1.kr(1/16!3).range(1/20,4)]).abs + 1 * 1/4;
  var sig = Perlin3.ar(t[0],t[1],t[2]);
  sig = LPF.ar(sig,LFNoise2.kr(1/16!3).exprange(15000.01,50));
  sig = sig * env;
  sig = CompanderD.ar(sig,3/4,1/2,1);
  Splay.ar(sig,0.5,0.95);
};
~background.play;
);
~background.stop(4);
~background.clear;
~background.pause;
~background.resume;

Env.help
