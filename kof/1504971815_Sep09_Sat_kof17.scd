
p.push();

p.bpm(45*2);

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

// one synth ///////////////////////////////////////
b = Buffer.read(s,Platform.resourceDir ++ "/sounds/beat.wav");

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=16;
~one.fadeTime=16;
~one={
  var f = (2**{((1..12)/12).choose}!3) * 256;
  var sig = Shaper.ar(b,LFTri.ar(~tempo/f/[1,2,4,8,16,1/2]) + SinOsc.ar(~tempo/[4,5,6,7,8],mul:0.000001));
  sig = LPF.ar(sig,2500);// + RHPF.ar(sig,3000);
  sig = LeakDC.ar(sig);
  sig = BRF.ar(sig,4000/8*(1..8),1,mul:LFNoise2.kr(~tempo/64!8)) * 2;
  sig = CombL.ar(sig,4/f,512/f,1);
  //sig = Normalizer.ar(sig)/2;
  sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
  Splay.ar(sig,0.75,0.25,SinOsc.ar(7.5)/4);
};
~one.play;
);
~one.stop(30);
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
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(75!2+(env**20*75),env*50*8pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;

// kkk synth ///////////////////////////////////////

(
~kkk.ar(2);
~kkk.clock = p.clock;
~kkk.quant=16;
~kkk.fadeTime=4;
~kkk={
  var sig = SinOsc.ar(75!2,Pulse.ar(0.75*2/[1,2,3,4])*8pi) * Pulse.ar(0.75*4/[1,2,3,4]).softclip;
  sig = CombN.ar(sig,[1,2,4,8]/750,[1,2,4,8]/750,0.75*LFNoise1.kr(3/4/4).range(1/4,2));
  sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
  Splay.ar(sig,0.5,0.5);
};
~kkk.play;
);
~kkk.stop(4);
~kkk.clear;
~kkk.pause;
~kkk.resume;

(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.15,lp=3500,hp=250,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = CompanderD.ar(sig,3/4,1/1.5,1/2);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);
