
p.push();
p.bpm(115.37/2);

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
~one.quant=16;
~one.fadeTime=4;
~one={
    var mod2 = Duty.kr([8,16,32]*4/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
    var mod = Duty.kr([8,16,32]/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
    var change = Impulse.kr(~tempo/8/[1,2]);
    var sel = TChoose.kr(change,[1,1/2,2,4,8,16,32]/.x[1,1.5,4/3]);
  var f = Duty.kr([8,32,64]/~tempo,0,Dseq([1,2,1.5,1.33333],inf)) * 1500/mod2/mod + SinOsc.ar([4,5,6],mul:0.25pi) / [1,1,4,4];
    var sig = Resonz.ar(BrownNoise.ar(0.95!3),f,0.2) * ToggleFF.ar(change);
  sig = CombN.ar(sig,sel/(f/10),sel/f,2);
  sig = Perlin3.ar(SinOsc.ar(~tempo/(f/10)),sig,LFSaw.ar(~tempo/640));
  sig = LPF.ar(sig,1500);
  sig = CombL.ar(sig,sel/(f/20),sel/(f/10),2);
  sig = LeakDC.ar(sig)/LFSaw.ar(~tempo/8).exprange(10.01,1/2) + (SinOsc.ar(f,SinOsc.ar(f/[8,16,32,64,1024])*0.5pi));
  sig = Normalizer.ar(sig);
  sig = LPF.ar(sig,5000);
  sig = Compander.ar(sig,~kick.ar,0.1,1,0.1,0.01,2);
  Splay.ar(sig,0.5,0.15);
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
    1,0,0, 1,0,0,0, 1,1,0,0, 1,1,1,1,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.25,0.005],[3,-3]),imp * hit);
  var sig = HPF.ar(PinkNoise.ar(0.7!2*env),env.range(200,16000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
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
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-8]),imp * hit);
  var sig = SinOsc.ar(50!2,env*40*8pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
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

