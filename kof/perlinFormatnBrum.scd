
p.push;
p.bpm(90*2)

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
  ~master.quant=8;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.25,lp=3500,hp=250,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverb3Band.ar(NumChannels.ar(fx,2),[5000,5010])/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);

// formant synth ///////////////////////////////////////

(
~formant.ar(2);
~formant.clock = p.clock;
~formant.quant=8;
~formant.fadeTime=16;
~formant={
    var mod = Duty.kr(16/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
  var t = SinOsc.ar([~tempo/4,~tempo/16,~tempo/[1,2,3]/160],SinOsc.ar(~tempo/[1,2,3]/4*mod)*0.5pi) * SinOsc.kr(~tempo/6000/[1,2,3,4]).exprange(1/400,4);
  var sig = Perlin3.ar(t[0],t[1],t[2]);
  sig = Formant.ar([1500,15000,150.01,300]/[1,4,8,4],sig[1].exprange(0.001,[500,1500]),sig[2].exprange(0.01,150/[1,2]));
  sig = MoogFF.ar(sig,1500/[1,8,1.5,4],sig.exprange(1.15,3.5));
  sig = Normalizer.ar(sig);
  sig = RLPF.ar(sig,500) + (Pulse.ar(~tempo/[1,2,3])*sig.tanh/[1,2,4]);
  sig = CompanderD.ar(sig,3/4,1/2,1) * LFTri.ar(~tempo/[3,4,12]);
  sig = CombN.ar(sig,1/50,1/50,4)/4+sig;
  sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
  Splay.ar(sig,0.75,0.15,SinOsc.kr(~tempo/[7,7.5,1.5]));
};
~formant.play;
);
~formant.stop(4);
~formant.clear;
~formant.pause;
~formant.resume;




// synth2 synth ///////////////////////////////////////

(
~synth2.ar(2);
~synth2.clock = p.clock;
~synth2.quant=[16,0];
~synth2.fadeTime=0.02;
~synth2={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[1.502,8.5],[3,-3]),imp * hit);
  var sig = VarSaw.ar(50!2,0,env**0.1*500);
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~synth2.play;
);
~synth2.stop(32);
~synth2.clear;
~synth2.pause;
~synth2.resume;


(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(90);};});
}.fork;  
)

// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.clock = p.clock;
~kick.quant=[8,0];
~kick.fadeTime=0.02;
~kick={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.0],[3,-3]),imp * hit);
  var sig = SinOsc.ar(50!2+(env**20*50),env**53*8pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~kick.play;
);
~kick.stop(16);
~kick.clear;
~kick.pause;
~kick.resume;




