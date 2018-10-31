

p.push();
p.bpm(140);
s.latency=0.2;

// cork synth ///////////////////////////////////////

(
~cork.ar(2);
~cork.clock = p.clock;
~cork.quant=16;
~cork.fadeTime=4;
~cork={
    var harm = [5,3,4].log2;
  var sig = ~kick.ar * LFSaw.ar(~tempo/16/[1,2,3]);
  sig = CombN.ar(sig,1/32*2/harm,1/32/harm,2);
  sig = LeakDC.ar(sig).softclip;
  sig = MoogVCF.ar(sig,320*harm,LFSaw.kr(1/4*~tempo/[1,2,3]).range(0.1,0.9));
  Splay.ar(sig,0.5,0.75);
};
~cork.play;
);
~cork.stop(4);
~cork.clear;
~cork.pause;
~cork.resume;

// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.clock = p.clock;
~kick.quant=[16,0];
~kick.fadeTime=0.02;
~kick={
  //  |       |       |       |       |  
  var pat = [
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,1,1,1,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.75],[3,-3]),imp * hit);
  var sig = SinOsc.ar(32+(env**20*32),env**40*8pi);
  sig = sig * env;
  sig = sig + (CombN.ar(sig,1,~tempo/4,4)*LFPulse.ar(~tempo/4/[1,2,3,4],0.75));
  sig = Mix(sig);
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;


// mel synth ///////////////////////////////////////

(
~mel.ar(2);
~mel.clock = p.clock;
~mel.quant=[16,0];
~mel.fadeTime=0.02;
~mel={
  //  |       |       |       |       |  
  var pat = [
    1,0,1,0, 1,1,1,1, 1,0,1,0, 1,1,1,1,
  ].rotate(3);
  var mod = Duty.kr(16/~tempo*[1,2,3],0,Dseq([1,2,1.5,1.33333,4,8,12,16],inf)) ;
  var f = 160 + (2**[3,5,9,11,12,17].log2*(160/mod));
  var imp = PulseDivider.kr(~tick.kr,[1,2,3]*4,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.15*[1,4,8]],[3,-3]),imp * hit);
  var sig = SinOsc.ar(f,env*2pi);
  sig = sig * env;
  sig = sig + (CombN.ar(sig,1,~tempo/8,1)*LFPulse.ar(~tempo/8/[1,2,3,4],0.75));
  sig = MoogVCF.ar(sig,f*4,0.2);
  Splay.ar(sig,0.75,0.15);
};
~mel.play;
);
~mel.stop(4);
~mel.clear;
~mel.pause;
~mel.resume;


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
