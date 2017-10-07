

p.push();
b = Buffer.alloc(s,512, 1);

// recorder synth ///////////////////////////////////////

(
~recorder.ar(2);
~recorder.clock = p.clock;
~recorder.quant=2;
~recorder.fadeTime=4;
~recorder={
  var sig = SinOsc.ar(1/4/((1..8).reciprocal+1)) / 2+ LFTri.ar(1/3600/(1..8),mul:4);
  sig = Perlin3.ar(sig[0],sig[1],sig[2..7]) / 3 + BrownNoise.ar(0.001);
  RecordBuf.ar(Mix(sig),b.bufnum,0,0.5);
  //Splay.ar(Mix(sig),0.5,0.25);
};
//~recorder.play;
);
~recorder.stop(4);
~recorder.clear;
~recorder.pause;
~recorder.resume;


// shaperOne synth ///////////////////////////////////////

(
~shaperOne.ar(2);
~shaperOne.clock = p.clock;
~shaperOne.quant=4;
~shaperOne.fadeTime=4;
~shaperOne={
  var sig = SinOsc.ar([~tempo,~tempo/4,48000/512]) + LFSaw.ar(~tempo/60,mul:4);
  sig = Perlin3.ar(sig[0],sig[1],sig[2]);
  sig = Shaper.ar(b,sig) * Pulse.ar(~tempo*2);
  Splay.ar(sig,0.5,0.05);
};
~shaperOne.play;
);
~shaperOne.stop(4);
~shaperOne.clear;
~shaperOne.pause;
~shaperOne.resume;

// shaper synth ///////////////////////////////////////

(
~shaper.ar(2);
~shaper.clock = p.clock;
~shaper.quant=4;
~shaper.fadeTime=4;
~shaper={
    var mod = Duty.kr(16/~tempo,0,Dseq([1,2,1.5,1.33333,[1,1.5],1.3333,1.66666,1.125,1.0115],inf));
  var f = [5,10,40/mod] + SinOsc.kr(~tempo/16/[1,2,3],mul:0.12);
  var sig = SinOsc.ar(f*[1,10,100]).range(0.01,0.99);
  sig = Shaper.ar(b,sig) * Pulse.ar(~tempo*2/[1,2,3]);
  sig = CombL.ar(sig,1/(f*10),1/(f.lag(1/10)*10),1);
  sig = CombL.ar(sig,2,~tempo/4,4);
  sig = LeakDC.ar(sig)/4;
  sig = BRF.ar(sig,LFNoise2.kr(~tempo/16!8).range(50,1500),1);
  sig = LPF.ar(sig,1500) ;//+ (BPF.ar(sig,LFNoise1.kr(1/16!3).range(5000,10000),0.2)*LFPulse.ar(16/[1,2,3]));
  //sig = CombN.ar(sig,1/4,1/4,4);
  sig = Compander.ar(sig,~kick.ar + ~kick2.ar,0.1,1,0.1);
  Splay.ar(sig,0.5,0.25);
};
~shaper.play;
);
~shaper.stop(4);
~shaper.clear;
~shaper.pause;
~shaper.resume;

(
  s.latency=0.5;
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

// two synth ///////////////////////////////////////

(
~two.ar(2);
~two.clock = p.clock;
~two.quant=[4,2];
~two.fadeTime=4;
~two={
    var mod = Duty.kr(16/~tempo,0,Dseq([1,2,1.5,1.33333,[1,1.5],1.3333,1.66666,1.125,1.0115],inf));
  var sig = SinOsc.ar([500,501]/mod);
  sig = Shaper.ar(b,sig) * LFPulse.ar(~tempo*4);
  sig = BRF.ar(sig,LFNoise2.kr(~tempo/16!8).range(100,5000),1);
  sig = LPF.ar(sig,5000);
  sig = Compander.ar(sig,~kick.ar + ~kick2.ar,0.1,1,0.1);
  Splay.ar(sig,0.5,0.25);
};
~two.play;
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;

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
  var sig = SinOsc.ar(50+(env**40*40),env**50*8pi) + LPF.ar(Shaper.ar(b,LFSaw.ar(50,0,env**10*8pi)),800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
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
~hiss.quant=[16,3];
~hiss.fadeTime=0.02;
~hiss={
  //  |       |       |       |       |  
  var pat = [
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
  ].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.25],[3,-3]),imp * hit);
  var sig = WhiteNoise.ar(0.5!2) * Pulse.ar(32);
  sig = HPF.ar(sig,8000);
  sig = BRF.ar(sig,LFNoise2.kr(4!4).range(800,16000),1);
  sig = sig * env;

  sig = Compander.ar(sig,~kick.ar + ~kick2.ar,0.1,1,0.1);
  Splay.ar(sig,0.75,0.5);
};
~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;

// kick2 synth ///////////////////////////////////////

(
~kick2.ar(2);
~kick2.clock = p.clock;
~kick2.quant=[16,0];
~kick2.fadeTime=0.02;
~kick2={
  //  |       |       |       |       |  
  var pat = [
    0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0,
    0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0,
    0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0,
    0,0,0,0, 1,0,0,0, 0,0,0,0, 1,1,1,1,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(50!2+BrownNoise.ar(10!2*env),env**40*8pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~kick2.play;
);
~kick2.stop(4);
~kick2.clear;
~kick2.pause;
~kick2.resume;

(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.15,lp=3500,hp=250,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = CompanderD.ar(sig,3/4,1,1/4).softclip;
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);
