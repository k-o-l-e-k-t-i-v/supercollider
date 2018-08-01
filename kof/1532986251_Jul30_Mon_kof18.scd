p.push();
p.bpm(90);

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

// randomizer synth ///////////////////////////////////////

(
~randomizer.ar(2);
~randomizer.clock = p.clock;
~randomizer.quant=[8,0];
~randomizer.fadeTime=0.02;
~randomizer={
  //  |       |       |       |       |  
  var pat = [
    1,1,1,1,
  ].rotate(1);
  var len = LFSaw.kr(1/4)**2*2;
  var imp = PulseDivider.kr(~tick.kr,[1,2,3],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,len*[1,2,3]],[3,-3]),imp * hit);
  var sig = SelectX.ar(env**LFNoise1.ar(1/4/[1,2,3],mul:2)*4,[
      GrayNoise.ar(env),
      SinOsc.ar(50,env*2pi),
      LFSaw.ar(50),
      LFSaw.ar(50,env**20),
      SinOsc.ar(1500/[1,1.5,2]*env,env**20*2pi) * (env**20)
  ]);
  sig = sig * env ;
  sig = Mix.ar(LPF.ar(sig,500))+HPF.ar(sig,500);
  Splay.ar(sig,0.25,0.5);
};
~randomizer.play;
);
~randomizer.stop(4);
~randomizer.clear;
~randomizer.pause;
~randomizer.resume;


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
