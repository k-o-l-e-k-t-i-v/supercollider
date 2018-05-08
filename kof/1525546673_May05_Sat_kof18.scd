

p.push();
p.bpm(90);
s.latency=0.2;


// switcher synth ///////////////////////////////////////

(
~switcher.ar(2);
~switcher.quant=[16,0];
~switcher.fadeTime=0.02;
~switcher={

  //  |       |       |       |       |  
  var pat = [
      1,0,0,0,1,0,1,0,1,0,1,0,1,0,0,0,
      1,0,0,0,1,0,1,0,1,0,1,0,1,0,0,0,
      1,0,0,0,1,0,1,0,1,0,1,0,1,0,0,0,
      1,0,1,0,1,0,1,0,1,0,1,0,1,1,1,1
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr % pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.002,LFNoise1.kr(~tempo/16).range(0.01,2)],[3,-3],curve:'exp'),imp * hit)};
  var mel = Duty.kr(16/~tempo*[1,2,3,4],0,Dseq([4,2,2,1,1,2,1.5,1.33333],inf));
  
  var sig = [
  SinOsc.ar(50!2,env**40*4pi),
  WhiteNoise.ar(0.5*env),
  WhiteNoise.ar(0.7*env),
  SinOsc.ar(2500!2 / mel + LFSaw.ar(~tempo*32,mul:100*env),env**10*4pi,mul:0.5),
  
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  Splay.ar(sig,0.15,0.75);
};
~switcher.play;
);
~switcher.stop(4);
~switcher.clear;
~switcher.pause;
~switcher.resume;


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
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,4.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(50!2+env,env**80*8pi) + VarSaw.ar(50+env,0,env**0.2);
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;

(
  ~master.quant=16;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.0337,lp=2500,hp=150,len=5,rev = 1|
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
