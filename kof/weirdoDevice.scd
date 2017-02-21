

p.push();
p.bpm(135);


(
  ~master.quant=32;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.05,lp=3500,hp=350,len=5,rev = 3|
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
p.moveNodeToTail(\master);
);

(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
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
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1,
  ].rotate(1);
  var l = LFNoise1.kr(1/640*~tempo).exprange(1/2,8);
  var sl = LFNoise2.kr(1/1280!3 * ~tempo).exprange(30.001,160);
  var imp = PulseDivider.kr(~tick.kr,1);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.1*l],[3,-8]),imp * hit)};
  var sig = BrownNoise.ar(env**sl[0]!2)+SinOsc.ar(55!2+(env**sl[1]*1500),env**sl[2]*8pi);
  sig = sig * env;
  Splay.ar(sig,0.005,0.25);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=16;
~one.fadeTime=0.04;
~one={
  var time = SinOsc.ar(LFNoise0.kr(4/[1,2,3]*~tempo).range(150,7500).round(60.midicps)/[1,1.3333,1.5]);
  var sig = Perlin3.ar(time[0],time[1],time[2]) * [1,1/4,1/400] ** LFNoise2.kr(1/4*~tempo!3).range(0.5,4) * LFNoise2.kr(1/32!3).exprange(1/8.001,400);
  sig = Perlin3.ar(sig[0],sig[1],sig[2]);
  sig = LPF.ar(sig,LFNoise2.kr(1/16*~tempo!3).range(100,17000)) * (Pulse.ar(4/[1,2,3] * ~tempo));
  sig = HPF.ar(sig,100);
  sig = CombN.ar(sig,1/4/~tempo,1/~tempo,1/4);
  sig = CompanderD.ar(sig,3/4,1/LFNoise2.kr(1/32*~tempo!3).range(1,2),1);
  sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
  Splay.ar(sig,0.25,0.05,SinOsc.kr(~tempo/4)/3*2);
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
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,1,1,1, 1,1,1,1, 1,1,1,1, 1,1,1,1,
  ].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15*[1,2,3,4]],[3,-3]),imp * hit);
  var sig = HPF.ar(WhiteNoise.ar(0.8!4)+Crackle.ar(env**4+[0,0.1,0.2,0.4]),LFNoise2.kr(1/32!4).range(500,15000));
  sig = sig * env;
  sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
  Splay.ar(sig,0.05,0.15);
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
