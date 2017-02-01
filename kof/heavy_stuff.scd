


p.push();

p.bpm(113);


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
  fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);

// silent_one synth ///////////////////////////////////////

(
~silent_one.ar(2);
~silent_one.clock = p.clock;
~silent_one.quant=16;
~silent_one.fadeTime=4;
~silent_one={
  var sig = SinOsc.ar(33.midicps*32,Pulse.ar(2*~tempo,SinOsc.kr(1/64*~tempo/[2,1,4,8]).range(0.5,1))) * Pulse.ar([4,3,2,1]*~tempo);
  Splay.ar(sig,0.5,0.0125);
};
~silent_one.play;
);
~silent_one.stop(4);
~silent_one.clear;
~silent_one.pause;
~silent_one.resume;


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=[16,0];
~one.fadeTime=0.02;
~one={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,

    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,1,0,

    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,

    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1,

  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,3.0],[3,-3]),imp * hit);
  var sig = VarSaw.ar(33.midicps!2+(env**40*LFNoise2.kr(1/64*~tempo.kr/2).range(0.5,1.5)*400),0,env**20);
  sig = LPF.ar(sig,800+(env**0.9*8000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~one.play;
);
~one.stop(4);
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
    1,0,0,0, 1,0,1,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1,
    1,0,0,0, 1,0,1,0, 1,0,1,0, 1,0,0,0,
    1,0,1,0, 1,0,0,0, 1,0,0,1, 1,0,1,0,
  ].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.05*[1,2,3,4]],[3,-3]),imp * hit);
  var sig = WhiteNoise.ar(0.5!2);
  sig = RHPF.ar(sig,800+(env**[20,10,2,0.4]*LFNoise2.kr(1/63!4).range(0.5,1.5)*2200),LFSaw.ar(1/8/[1,2,3,4]*~tempo+(env**8*8)).range(0.1,0.9));
  sig = sig * env;
  sig = Compander.ar(sig,~one.ar,0.1,1,0.001);
  Splay.ar(sig,0.75,0.5);
};
~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;


// hiss2 synth ///////////////////////////////////////

(
~hiss2.ar(2);
~hiss2.clock = p.clock;
~hiss2.quant=[16,0];
~hiss2.fadeTime=0.02;
~hiss2={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,1,0, 0,0,0,0, 1,0,1,0, 1,0,1,0,

  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5]*LFNoise2.kr(1/8*~tempo/2!2).range(0.05,1.5),[3,-3]),imp * hit)};
  var sig = SinOsc.ar(33.midicps!2,env**0.4*8pi+0.5pi);
  sig = sig * env;
  sig = Compander.ar(sig,~one.ar,0.1,1,0.001);
  Splay.ar(sig,0.75,0.25);
};
~hiss2.play;
);
~hiss2.stop(4);
~hiss2.clear;
~hiss2.pause;
~hiss2.resume;

(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
)

// hiss synth ///////////////////////////////////////

(
~hiss3.ar(2);
~hiss3.clock = p.clock;
~hiss3.quant=[16,0];
~hiss3.fadeTime=0.02;
~hiss3={
  //  |       |       |       |       |  
  var pat = [
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,1,1,1,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.005/[1,20,2,40],0.15/[1,2,3,10]*LFNoise2.kr(2*~tempo).range(0.1,4)],[3,-3]),imp * hit)};
  var sig = RHPF.ar(WhiteNoise.ar(0.7!4),[100,5000,15000,1200]*Pulse.ar([8,2,16,50].scramble*~tempo/2).abs.softclip+100,0.26);
  sig = sig * env;
  sig = Compander.ar(sig,~one.ar,0.1,1,0.001) * LFNoise2.kr(4 * ~tempo!4);
  Splay.ar(sig,SinOsc.kr(1/[4,2,3,1]*~tempo).abs,0.25/3);
};
~hiss3.play;
);
~hiss3.stop(32);
~hiss3.clear;
~hiss3.pause;
~hiss3.resume;

// perlin synth ///////////////////////////////////////

(
~perlin.ar(2);
~perlin.clock = p.clock;
~perlin.quant=[16,0];
~perlin.fadeTime=16.02;
~perlin={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
  ].rotate(1);
  var notes = TWChoose.kr(Impulse.kr(1/8*~tempo/2!3),[60,64,69,72,36,24,48,61].midicps,[1,1,1,0.5,0.5,0.25,0.1],1)/[1,1/2,1.5];
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[1,2.5],[3,-3]),imp * hit);
  var t = SinOsc.ar([1/16*~tempo/2,1/64*~tempo*[1.01,1.001,1.0001],notes]) * [1,40,1] + LFSaw.ar(1/128/[64,640,4]*~tempo,mul:[40,4,1/4]);
  var sig = Perlin3.ar(t[0],t[1],t[2]);
  sig = sig * env;
  sig = Compander.ar(sig,~one.ar,0.1,1,0.001);
  Splay.ar(sig,0.75,0.15,SinOsc.kr(1/4*~tempo.kr));
};
~perlin.play;
);
~perlin.stop(4);
~perlin.clear;
~perlin.pause;
~perlin.resume;
// perl synth ///////////////////////////////////////
