

p.push();
p.bpm(140/2)

(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.25,lp=3500,hp=150,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
  sig = Limiter.ar(sig.softclip);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
p.moveNodeToTail(\master);
);

// perlin_again synth ///////////////////////////////////////

(
~perlin_again.ar(2);
~perlin_again.clock = p.clock;
~perlin_again.quant=[2,0];
~perlin_again.fadeTime=16;
~perlin_again={
  var mod2 = Duty.kr(16*[1,2,4] / ~tempo,0,Dseq([1,2,1,4],inf)) *.x [2,1/2,1] ;
  var mod = Duty.kr(32*[1,2,4] / ~tempo,0,Dseq([1,1/2,1,2],inf)) *.x TWChoose.kr(1/16/[1,2,4],[1,1.5,1/2,2],[5,5,2,1],1);
  var freq = TWChoose.kr(Impulse.kr(1/16/[1,2,4] * ~tempo),[60,64,48,72,36,24].midicps/mod2,[10,5,3,2,1,1],1) * mod;
  var t = LFTri.ar([freq/10000,1/3600/[1,2,4],freq],SinOsc.kr(1/16/[1,2,4] * ~tempo*freq)*0.1pi) * [LFNoise2.kr(1/16!9).range(1/4,8),4000,1/4];
  var sig = Perlin3.ar(t[0],t[1],t[2]) + BrownNoise.ar(0.001!3) * (LFTri.ar(1/16/[1,2,4] * ~tempo)**1.66);
  sig = Vibrato.ar(sig,[5,6,7],0.02);
  sig = MoogFF.ar(sig,[freq,freq*1.5],[2.5,LFNoise2.kr(1/4!3).range(1,3.45)],mul:[0.6,0.12]);
  sig = HPF.ar(sig,40);
  sig = CompanderD.ar(sig,3/4,1/2,1);
  Splay.ar(sig,0.25,0.25);
};
~perlin_again.play;
);
~perlin_again.stop(120);
~perlin_again.clear;
~perlin_again.pause;
~perlin_again.resume;


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
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(50!2,env**20*8pi);
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
