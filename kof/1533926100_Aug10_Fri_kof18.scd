



p.push();

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
~kick.quant=8;
~kick.fadeTime=8;
~kick={
    var mod = Duty.kr(1/8/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
    var line;
  var sig = Pulse.ar(4/[1,2,3,4]) * LFPulse.ar(3/[1,2,3,4]);
  line = sig;
  sig = BPF.ar(sig,LFTri.kr(~tempo/4/[1,2,3,4]).range(100,15000));
  line = CombL.ar(line,1/50,mod/500,LFSaw.kr(~tempo/16/[1,2,3,4]))/8 + line;
  sig = sig + Mix(RLPF.ar(line,LFTri.kr(~tempo/4/[3,4,5,6]).range(150,1500)));
  Splay.ar(sig,0.95,0.5);
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
  ~master = {|wet=0.25,lp=3500,hp=250,len=10,rev = 3|
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


// hihat synth ///////////////////////////////////////

(
~hihat.ar(2);
~hihat.clock = p.clock;
~hihat.quant=[16,0];
~hihat.fadeTime=0.02;
~hihat={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
  ].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.05],[3,-3]),imp * hit);
  var sig = WhiteNoise.ar(1);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~hihat.play;
);
~hihat.stop(4);
~hihat.clear;
~hihat.pause;
~hihat.resume;
