
p.push();
p.bpm(72);

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

// noise synth ///////////////////////////////////////

(
~noise.ar(2);
~noise.clock = p.clock;
~noise.quant=8;
~noise.fadeTime=1;
~noise={
    var f = Duty.kr(32/[1,2,4]/~tempo,0,Dseq(220*(2**([102,304,600,808,1100]/1200)),inf));
  var sig = HPF.ar(Dust.ar(LFSaw.ar(~tempo/16/(1..8)).range(100,20000)),20000/(1..8)) * Pulse.ar(~tempo*4/(1..8));
  sig = sig * LFTri.ar(~tempo/16/[1,2,3,4]);
  sig = sig/4 + MoogFF.ar(VarSaw.ar(f,0,LFSaw.ar(~tempo/4/(1..4)),mul:0.12),f*2,LFNoise2.kr(~tempo/32!4).range(1.2,3.5));
  sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
  Splay.ar(sig,0.6,0.25);
};
~noise.play;
);
~noise.stop(4);
~noise.clear;
~noise.pause;
~noise.resume;

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
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.75*(1..3)],[3,-7]),imp * hit);
  var sig = LFCub.ar(44!2 + (env**20*150),env**120*8pi);
  sig = sig * env;
  Splay.ar(sig,0,0.5);
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
  ~master = {|wet=0.05,lp=2500,hp=250,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig;
  var fx;
  //sig = BBandPass.ar(sig,(1..12)*(20000/12),0.75,mul:LFNoise1.kr(~tempo/4/(1..12)).exprange(0.01,1));
  sig = CompanderD.ar(LPF.ar(sig,22000/(1..8),mul:1/(8..1)),1/2,1/2,1);
  orig = sig;
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  //fx = AllpassL.ar(sig,~tempo/16,(2..13)/48000,~tempo/2);
  fx = Splay.ar(fx,1,1);
  fx = DWGReverbC1C3.ar(fx,[5000,5001],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  //sig = NumChannels.ar(sig,2);
  sig = Splay.ar(sig,0.21,1);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);
