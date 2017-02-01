s.reboot;
p.push();
p.bpm(144.2);


(
  ~master.quant=16;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.15,lp=2500,hp=250,len=20,rev = 2|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
  fx = LPF.ar(sig,lp);
  fx = LPF.ar(fx,lp);
  fx = HPF.ar(fx,hp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
p.moveNodeToTail(\master);
);

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
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.84],[6,-3]),imp * hit);
  var sig = SinOsc.ar(50+(env**80*750),env**40*8pi) + BrownNoise.ar(env**80/2);
  sig = sig * env;
  sig = LPF.ar(sig,1800);
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;


// low_hat synth ///////////////////////////////////////

(
~low_hat.ar(2);
~low_hat.clock = p.clock;
~low_hat.quant=[16,0];
~low_hat.fadeTime=0.02;
~low_hat={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,0,1,
    1,0,0,0, 1,0,0,0, 1,0,1,0, 1,0,1,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1
  ].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[[0.002],[0.2,0.25,0.5,0.14]/2],[3,-3]),imp * hit) * LFNoise2.kr(1/64*~tempo!4);
  var sig = RLPF.ar(WhiteNoise.ar(0.2!4+env),[20000,500,15000,20000],0.12+(env**[1.2,1.4,0.7,0.12]/2));
  sig = sig * env * 4;
  sig = Compander.ar(sig,~kick.ar,0.05,1,0.15);
  Splay.ar(sig,0.25,0.75);
};
~low_hat.play;
);
~low_hat.stop(4);
~low_hat.clear;
~low_hat.pause;
~low_hat.resume;



// saw synth ///////////////////////////////////////

(
~saw.ar(2);
~saw.clock = p.clock;
~saw.quant=[16,0];
~saw.fadeTime=0.02;
~saw={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
  ].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[1/4,2.5/4],[3,-3]),imp * hit);
  var sig = Blip.ar(50,env**LFNoise2.kr(1/32*~tempo).range(0.2,1.05)*10) * VarSaw.ar(50+[0,0.015,0.0013,0.00032],0,env**LFNoise2.kr(~tempo/64).range(0.9,2)*8pi);
  sig = sig * env;
  sig = CompanderD.ar(sig,3/4,1/2,1);
  sig = Compander.ar(sig,~kick.ar,0.05,1,0.15);
  sig = RLPF.ar(sig,LFTri.kr(~tempo/[1,2,3,4]/4).range(200,12000));
  Splay.ar(sig,0.75,0.045,SinOsc.kr(~tempo));
};
~saw.play;
);
~saw.stop(4);
~saw.clear;
~saw.pause;
~saw.resume;


// larn synth ///////////////////////////////////////

(
~larn.ar(2);
~larn.quant=16;
~larn.fadeTime=0.2;
~larn={
    var notes = TWChoose.kr(Impulse.kr(1/32/[1,2,3]*~tempo/4),[60,72,48,36,64,69],[1,1,1,0.5,0.25,0.3,0.1]);
    var mel = notes.midicps * [8,16,4] / Duty.kr([4,8,32,128] /  ~tempo,0,Dseq([1,2,1.5,1.33333],inf));
  //         |       |       |       |       |  
  var pat = [
      1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
  ].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.005,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(mel/2,env**4*8pi),
  LFSaw.ar(mel,mul:0.42),
  VarSaw.ar(mel*2,env**2*8pi,mul:0.8),
  Blip.ar(mel,env**0.99*8pi+SinOsc.kr(~tempo/[1,2,3,4])*4,mul:0.25),
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  sig = Compander.ar(sig,~kick.ar,0.05,1,0.15);
  Splay.ar(sig,SinOsc.kr(~tempo/4),0.75);
};
~larn.play;
);
~larn.stop(4);
~larn.clear;
~larn.pause;
~larn.resume;


(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
)

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
