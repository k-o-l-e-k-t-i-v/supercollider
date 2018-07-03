


p.push();

p.bpm(128);



s.reboot();
p.push();
p.bpm(60);
~tempo={1};

(
  //s.latency=0.2;
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
~one.quant=[4,0];
~one.fadeTime=4;
~one={
    var mod = Duty.kr(16/~tempo*[1,4,8],0,Dseq([1,2,1.5,1.33333],inf));
    var f = TChoose.kr(Impulse.kr(1/32!3),[1250,150,5000,2500,100,75,500]).lag(1/4)/mod;
  var sig = FBSineC.ar(f,LFSaw.ar(1/640),LFNoise1.kr(1/320/[1,2,3])).range(0,0.33) + Resonz.ar(VarSaw.ar(f/4,mul:0.33),f);
  sig = MoogFF.ar(sig,f*1.333334,LFSaw.ar(1/16/[1,2,3])**2) * Pulse.ar(f/1024/[1,2,4]) * SinOsc.ar([5,6,7]);
  sig = Perlin3.ar(LFSaw.ar(1/6400),LocalIn.ar(3),sig) * LFTri.ar(~tempo/4/[1,4,8]);
  sig = DelayN.ar(sig,1/f,1/f);
  sig = LeakDC.ar(sig);
  sig = CompanderD.ar(sig,3/4,1/2,1);
  sig = RLPF.ar(sig,f/mod,0.2) * SinOsc.ar(f,Pulse.ar(4/[1,2,3]));
  LocalOut.ar(sig);
  //sig = CombC.ar(sig,1/f,1/f,1/4);
  Splay.ar(sig,0.25,0.5);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


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
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
  ].rotate(1);
  var mod = Duty.kr(16/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3]),imp * hit);
  var sig = FBSineC.ar(500/mod+(env**80*12500),env**LFNoise1.kr(1/16),env**40);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
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
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
  ].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.05],[3,-3]),imp * hit);
  var sig = HPF.ar(WhiteNoise.ar(0.1),5000);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;

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
