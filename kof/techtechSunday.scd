


(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.005,lp=1500,hp=250,len=10,rev = 3|
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
             sig = LeakDC.ar(sig);
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



p.push();
p.bpm(120)

// peper synth ///////////////////////////////////////

(
~peper.ar(2);
~peper.clock = p.clock;
~peper.quant=[8,3];
~peper.fadeTime=4;
~peper={
    var note = [36,69,65].midicps/1.5;
    var mod = Duty.kr(32/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
    var sig = SinOsc.ar([1,1/2,note/[1,2,4]*mod],0,Pulse.ar(~tempo/16/[1,1,[1,2,3,4]]) * [0,0,8pi]) + LFNoise2.kr(1/400!3,mul:4);
    sig = CombN.ar(sig,1/50,1/500/mod,1/2*LFNoise2.kr(1/400).range(0.5,8));
    sig = Perlin3.ar(sig[0],sig[1],sig[2]);
    sig = Normalizer.ar(sig);
    sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
    Splay.ar(sig,0.5,0.45,SinOsc.ar(~tempo*2));
};
~peper.play;
);
~peper.stop(4);
~peper.clear;
~peper.pause;
~peper.resume;


// hiss synth ///////////////////////////////////////

(
~hiss.ar(2);
~hiss.clock = p.clock;
~hiss.quant=[16,0];
~hiss.fadeTime=0.02;
~hiss={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,1,0, 1,0,0,0, 1,1,1,1,
    1,0,0,0, 1,0,1,0, 1,0,0,0, 1,1,1,1,
    1,0,0,0, 1,0,1,0, 1,0,0,0, 1,1,1,1,
    1,1,1,1, 1,1,1,1, 1,1,1,1, 1,1,1,1,
  ].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.05]*LFNoise2.kr(1/400).range(0.5,4),[3,-3]),imp * hit)}!4;
    var sig = RLPF.ar(WhiteNoise.ar(0.4),1800*[1,2,3,4]*LFNoise2.kr(~tempo/40!4).range(0.5,4),LFNoise2.kr(1/400!4).range(0.01,0.2));
  sig = sig * env;
    sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
  Splay.ar(sig,0.75,0.5);
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
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5]*LFNoise2.kr(1/4).range(0.95,1.4),[3,-3]),imp * hit)}!4;
    var sig = SinOsc.ar(50!2,env**(40*LFNoise2.kr(1/400).exprange(0.501,2))*8pi) * LFNoise2.kr(~tempo/16!4).range(0.5,1);
    sig = sig + VarSaw.ar(50+(env**80*5),0,env**0.2,mul:LFNoise2.kr(1/40/[1,2,2,3]).range(0.3,0.001));
    sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;
