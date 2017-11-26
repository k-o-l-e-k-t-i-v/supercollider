


p.push();
~tempo={130/60};

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

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=4;
~one.fadeTime=4;
~one={
    var f = TChoose.kr(Impulse.kr(~tempo*2/[1,2,3])*ToggleFF.kr(Impulse.ar(~tempo/2/[1,2,3])),(2..6).octcps) / {[1,2,4,8,16,1.5,1.333334].choose}!3 * (2**({[0,5,7,11,12].choose}!3/12)) + SinOsc.ar(~tempo*16/(1..3),mul:1pi);
  var sig = SinOsc.ar(f!2,mul:0.3334);
  sig = sig + Resonz.ar(sig,f/[1,2,4]) * LFTri.ar(~tempo/2/(1..16));
  sig = Mix(sig);
  sig = sig.softclip/2;
  sig = AllpassN.ar(sig,2/f,1/f,1/4);
  sig = CombN.ar(sig/2,4/f,2/f+LFNoise1.kr(~tempo*4!3).range(1/100000,1/1000000),1);

  Splay.ar(sig,0.5,0.045);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

(
Tdef(\reb).quant=4;
Tdef(\reb,{loop{~one.rebuild;(69.333333).wait;}}).play;
)
16*130/120
17.33333*4

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
  ].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3]),imp * hit);
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

(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.25,lp=3500,hp=250,len=10,rev = 3|
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
