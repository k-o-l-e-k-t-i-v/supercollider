
p.push();
p.bpm(73.333);

(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(4);};});
}.fork;  
)

(
  //s.latency=0.2;
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
    1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.02,3.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(50!2,env**40*8pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;

// low synth ///////////////////////////////////////

(
~low.ar(2);
~low.clock = p.clock;
~low.quant=16;
~low.fadeTime=4;
~low={
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5],[3,-3]),Impulse.ar(~tempo*[1,2,3,4]));
  var sig = SinOsc.ar(50!2,env**40*2pi) + VarSaw.ar(50,0,env**0.9,mul:0.1);
  sig = sig * env;
  Splay.ar(sig,0.5,0.15);
};
~low.play;
);
~low.stop(4);
~low.clear;
~low.pause;
~low.resume;


// hihat synth ///////////////////////////////////////

(
~hihat.ar(2);
~hihat.clock = p.clock;
~hihat.quant=[16,0];
~hihat.fadeTime=0.02;
~hihat={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,1,0, 1,0,0,0, 1,0,1,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,1,0,
  ].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.02,1.75]*LFTri.kr(~tempo/16),[3,-3]),imp * hit)};
  var sig = RHPF.ar(WhiteNoise.ar(0.1!4),1500*[1,2,3,4],env*LFTri.ar(~tempo/16/[1,2,3,4]));
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~hihat.play;
);
~hihat.stop(4);
~hihat.clear;
~hihat.pause;
~hihat.resume;

// high synth ///////////////////////////////////////

(
~high.ar(2);
~high.clock = p.clock;
~high.quant=16;
~high.fadeTime=4;
~high={
  var sig = PinkNoise.ar(0.33!4) * (Decay.ar(Impulse.ar(~tempo*4/[1,2,3,4]),LFDNoise1.kr(~tempo/[1,2,3,4]/16)) * LFTri.ar(~tempo/16/[1,2,3,4]));
  sig = RLPF.ar(sig,[1,2,3,4]*4000);
  Splay.ar(sig,0.5,0.05);
};
~high.play;
);
~high.stop(4);
~high.clear;
~high.pause;
~high.resume;

(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.15,lp=3500,hp=250,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);
