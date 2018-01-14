
p.push();


p.bpm(105)

(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
)


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=16;
~one.fadeTime=4;
~one={
    var mod = Duty.kr(16*[1,2,3]/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
  var sig = VarSaw.ar([~tempo,~tempo/640,250/[1,2,4]/mod]).range(0,4pi);
  sig= Compander.ar(sig,~kick.ar,0.1,1,0.1);
  sig = Perlin3.ar(sig[0],sig[1],sig[2]) * LFTri.ar(~tempo/16/[1,2,3]);
  sig= Compander.ar(sig,~kick.ar,0.1,1,0.1);
  Splay.ar(sig,0.5,0.15);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
)

// saw synth ///////////////////////////////////////

(
~saw.ar(2);
~saw.clock = p.clock;
~saw.quant=[16,0];
~saw.fadeTime=0.02;
~saw={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1,
  ].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4,5,6]*4,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,4.5/[1,4,8]],[3,-3]),imp * hit);
  var f = (TWChoose.kr(hit,[1,2,4,8,1.5,4/3,3,1/2,1/4]*250,[1,1,1,0.1,0.1,0.2,0.3,0.4],1))/[1,2,4];
  var sig = VarSaw.ar(f,0,env**0.81);
  sig = Perlin3.ar(sig[0],sig[1],sig[2]) * LFTri.ar(~tempo/16/[1,2,3]);
  sig = MoogFF.ar(sig,f*[2,1.5,4/3]/2,LFSaw.ar(~tempo/4/[1,2,3]).range(1,3.5)*env);
  sig = CompanderD.ar(sig,3/4,1/2,1);
  sig = sig * env;
  sig= Compander.ar(sig,~kick.ar,0.1,1,0.1);
  Splay.ar(sig,0.75,0.75);
};
~saw.play;
);
~saw.stop(4);
~saw.clear;
~saw.pause;
~saw.resume;

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
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(55!2,env**20*8pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);
~kick.stop(4);
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
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,1,0,
  ].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.05],[3,-3]),imp * hit);
  var sig = BPF.ar(WhiteNoise.ar(1),LFNoise0.kr(~tempo!3).range(50,15000).round(36.midicps),LFNoise0.kr(~tempo!3).range(0.01,0.74));
  sig = sig * env;
  sig= Compander.ar(sig,~kick.ar,0.1,1,0.1);
  Splay.ar(sig,0.75,0.75);
};
~hiss.play;
);
~hiss.stop(4);
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
