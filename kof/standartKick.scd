
s.boot();
p.push();
p.bpm(90);


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
~kick2.ar(2);
~kick2.clock = p.clock;
~kick2.quant=[16,0];
~kick2.fadeTime=0.02;
~kick2={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
  ].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var ocas = LFNoise1.kr(~tempo/128,mul:8 * -1,add: -1);
  var len = LFNoise1.kr(~tempo/64).range(0.15,0.5);
  var slope = LFNoise1.kr(~tempo/64).range(20,50);
  var amp = LFNoise2.kr(~tempo/4).range(1/4,1);
  var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.002,len],[3,ocas]),imp * hit)};
  var base = 55+(env**slope*55);
  var sig = SinOsc.ar(base,BrownNoise.ar(env**slope/4)+(env**slope*8pi));
  sig = sig * env * amp;
  sig = VarSaw.ar(base,0,env**10.2)/4 * (env**1.5) + sig;
//  sig = CompanderD.ar(sig,3/4,1/2,1);
//  sig = CompanderD.ar(sig,9/10,1,10)+sig;
  //sig = CombN.ar(sig,1/50,1/500,len)/4 + sig;
  Splay.ar(sig,0.005,0.25);
};
~kick2.play;
);
~kick2.stop(4);
~kick2.clear;
~kick2.pause;
~kick2.resume;


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
  var imp = PulseDivider.kr(~tick.kr,1);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var ocas = LFNoise1.kr(~tempo/128,mul:8 * -1,add: -1);
  var len = LFNoise1.kr(~tempo/64).range(0.15,2.5);
  var slope = LFNoise1.kr(~tempo/64).range(20,100);
  var amp = LFNoise2.kr(~tempo/4).range(1/4,1);
  var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.002,len],[3,ocas]),imp * hit)};
  var base = 55+(env**slope*55);
  var sig = SinOsc.ar(base,BrownNoise.ar(env**slope/4)+(env**slope*8pi));
  sig = sig * env * amp;
  //sig = VarSaw.ar(base,0,env**10.2)/4 * (env**1.5) + sig;
//  sig = CompanderD.ar(sig,3/4,1/2,1);
//  sig = CompanderD.ar(sig,9/10,1,10)+sig;
  //sig = CombN.ar(sig,1/50,1/500,len)/4 + sig;
  Splay.ar(sig,0.005,0.25);
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
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.25],[3,-20]),imp * hit);
  var sig = WhiteNoise.ar(0.5);
  sig = sig * env;
  sig = HPF.ar(sig,5000*[1,2,3,4]);
  //sig = CombN.ar(sig,1/55,2/55,4);
  Splay.ar(sig,0.75,0.5);
};
~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;
