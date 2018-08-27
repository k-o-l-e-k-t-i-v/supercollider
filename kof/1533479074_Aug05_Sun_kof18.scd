

p.push();
p.bpm(48.5);


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

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=8;
~one.fadeTime=4;
~one={
    var mod = Duty.kr(Dseq([16,32,4,2],inf)/~tempo,0,Dseq([1,2,1.125,1/2],inf));
    var detune = SinOsc.kr(~tempo/16/[1,3,5,7]);
    var f = 110/mod+[0,0.0001,0.01,-0.0001];
  var sig = SinOsc.ar(f+detune,Pulse.ar(~tempo*2/[1,3,5,7]),mul:1/[1,2,3,4]) * LFTri.kr(~tempo/4/[1,3,5,7]);
  sig = sig * Pulse.ar(~tempo*4/[1,3,5,7]) + (HPF.ar(sig,5000)*DelayN.ar(Pulse.ar(~tempo*4/[1,3,5,7]),~tempo/8*3,~tempo/8*3));
  sig = LPF.ar(sig,LFTri.kr(~tempo/8/[1,3,5,7]).exprange(150.01,15000));
  sig = PitchShift.ar(sig,2/f,LFNoise1.kr(~tempo/32/[1,3,5,7]).range(0.9,1.1));
  sig = CombC.ar(sig,4/f,1/f,LFSaw.kr(~tempo/16/[1,3,5,7]).exprange(~tempo/8,~tempo*4));
  sig = Compander.ar(sig.distort,Pulse.ar(~tempo*1/[1,2,3,4]),0.1,1,0.1);
  sig = Mix.ar(LPF.ar(sig,1500)) + HPF.ar(sig,1500);
  sig = sig.softclip;
  Splay.ar(sig,0.125,0.095,SinOsc.kr(~tempo/[1,3]));
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
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(55!2, env**40*2pi);
  sig = sig * env;
  Splay.ar(sig,1,0.75);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;

// high synth ///////////////////////////////////////

(
~high.ar(2);
~high.clock = p.clock;
~high.quant=[16,0];
~high.fadeTime=0.02;
~high={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
  ].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.15],[3,-3]),imp * hit);
  var sig = SinOsc.ar(6000 + (LFPulse.ar(~tempo*16/[1,3,5,7])*3000/[1,3,5,7]),SinOsc.kr([3,4,5])*2pi) * LFPulse.ar(~tempo*8);
  sig = sig * env;
  Splay.ar(sig,0.75,0.05,SinOsc.kr(~tempo*30));
};
~high.play;
);
~high.stop(4);
~high.clear;
~high.pause;
~high.resume;


// highNoise synth ///////////////////////////////////////

(
~highNoise.ar(2);
~highNoise.clock = p.clock;
~highNoise.quant=[16,0];
~highNoise.fadeTime=0.02;
~highNoise={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
  ].rotate(0);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.3,0.005],[3,-3]),imp * hit);
  var sig = PinkNoise.ar(0.2!2);
  sig = HPF.ar(sig,6000);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~highNoise.play;
);
~highNoise.stop(4);
~highNoise.clear;
~highNoise.pause;
~highNoise.resume;



(
  ~master.quant=4;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.15,lp=3500,hp=250,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  sig = CompanderD.ar(sig,3/4,1/2,1/3);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);
