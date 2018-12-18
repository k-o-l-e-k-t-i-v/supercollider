

p.push();
p.bpm(121.5)
b = Buffer.alloc(s,2048,1);

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

// rec synth ///////////////////////////////////////

(
~rec.ar(2);
~rec.quant=16;
~rec.fadeTime=0.2;
~rec={
  //         |       |       |       |       |  
  var pat = [1,1,1,1].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3],~counter.kr % pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.02,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(40*[1,2,1.5]),
  WhiteNoise.ar(0.2!2),
  VarSaw.ar(20*[1,4,8]),
  ClipNoise.ar(0.5!2),
  SinOsc.ar(400/[1,1.5]),
  GrayNoise.ar(0.5!2)
  ];
  sig = sig * env;
  8.do{|n|
    sig = AllpassN.ar(sig,1/50,1/(50+n),1);
  };
  sig = CombN.ar(sig,~tempo/4,~tempo/8,1/4);
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  RecordBuf.ar(Mix(sig),b.bufnum);
  Splay.ar(sig,0.75,0.5);
};
//~rec.play;
);
~rec.stop(4);
~rec.clear;
~rec.pause;


// osc synth ///////////////////////////////////////

(
~osc.ar(2);
~osc.clock = p.clock;
~osc.quant=16;
~osc.fadeTime=0.1;
~osc={
    var f = Duty.kr([1,2,3,4,5,6]*16/~tempo,0,Dseq([1,2,1.5,1.33333,1/2,1/4,1/8],inf))*100;
  var sig = Osc.ar(b,[f+1,f],Pulse.ar(~tempo*4/[1,2,3,4]));
  sig = sig * (LFSaw.ar(~tempo/4)**2);
  sig = LPF.ar(MoogFF.ar(sig,LFSaw.ar(~tempo/16).range(f,f*16),2.5)+MoogVCF.ar(sig,f*16,0.2)+(sig/2),15000);
  8.do{|n|
    sig = AllpassN.ar(sig,1/4,1/(4+n),1);
  };
  sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
  Splay.ar(sig,0.95,0.25);
};
~osc.play;
);
~osc.stop(4);
~osc.clear;
~osc.pause;
~osc.resume;

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
  ].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(50!2,env**40*8pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
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
