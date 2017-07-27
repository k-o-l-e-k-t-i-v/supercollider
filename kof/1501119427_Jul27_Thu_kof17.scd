
p.push();
p.bpm(90);

// symbol synth ///////////////////////////////////////

(
~symbol.ar(2);
~symbol.clock = p.clock;
~symbol.quant=4;
~symbol.fadeTime=4;
~symbol={
    var base = Duty.kr([1,2,4]*16/~tempo,0,Dseq([60,84,48].midicps,inf)) ;
    var f = Duty.kr([1,2,32]*.x[4,32,64]/~tempo,0,Dseq(base/[1,2,4,1.5,1.333]*.x[1,2,1.5,1.3333],inf));
  var sig = LPF.ar(CombN.ar(PinkNoise.ar(1!3)*Pulse.ar(~tempo*4),~tempo,4/f,~tempo),SinOsc.ar(~tempo*4/(1..3)).range(f/4,f));
  
  sig = AllpassL.ar(sig * Pulse.ar(~tempo/[1/2,1,4]).softclip,~tempo,[1,2,4]/f,~tempo);
  RandSeed.ar(Impulse.ar(~tempo/32),LFSaw.kr(~tempo/3200).range(1,1000));
  //sig = Resonz.ar(sig,f/[4,2,1.5],0.15) * sig;
  sig = Normalizer.ar(sig);
  

  sig = LeakDC.ar(sig);
  sig = Compander.ar(sig,3/4,1/2,1);
  sig = LeakDC.ar(sig);
  Splay.ar(sig,0.5,0.25);
};
~symbol.play;
);
~symbol.stop(4);
~symbol.clear;
~symbol.pause;
~symbol.resume;

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
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(50!2,env**50*8pi);
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
