
p.push;
p.bpm(90)


(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.5,lp=3500,hp=250,len=10,rev = 3|
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
~one.quant=4;
~one.fadeTime=16;
~one={
    var mod=  Duty.kr(16/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
  var sig = Formant.ar(75*[1,1/1.5,1/1.3333,4]/mod,[100,1000]/mod,[75,750]/mod+(Pulse.ar(~tempo*2/[1,2,3,4])*10000));
  sig = CombN.ar(sig,1/50*mod,1/50*mod,1/2)/4+sig;
  sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
  Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

// formant synth ///////////////////////////////////////

(
~formant.ar(2);
~formant.clock = p.clock;
~formant.quant=4;
~formant.fadeTime=4;
~formant={
  var t = SinOsc.ar([~tempo/4,~tempo/16,~tempo/[1,2,3,4]/16],SinOsc.ar(~tempo/[1,2,3,4])*0.5pi) * SinOsc.kr(~tempo/600/[1,2,3,4]).range(1/400,4);
  var sig = Perlin3.ar(t[0],t[1],t[2]);
  sig = Formant.ar([75,50,51,100],sig[1].range(5,1500),sig[2].range(5,1500));
  sig = MoogFF.ar(sig,5000/[1,8,1.5,4],sig.range(0.15,3.5));
  sig = Normalizer.ar(sig);
  sig = LPF.ar(sig,5000);
  sig = CompanderD.ar(sig,3/4,1/2,1);
  Splay.ar(sig,0.5,0.05);
};
~formant.play;
);
~formant.stop(4);
~formant.clear;
~formant.pause;
~formant.resume;

// hiss synth ///////////////////////////////////////

(
~hiss.ar(2);
~hiss.clock = p.clock;
~hiss.quant=[16,0];
~hiss.fadeTime=0.02;
~hiss={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1,
  ].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002*[1,10,100,200],0.15],[3,-3]),imp * hit);
  var sig = WhiteNoise.ar(0.4!2);
  sig = LPF.ar(sig,[1,2,3,4]*5000);
  sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;

// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.clock = p.clock;
~kick.quant=[4,0];
~kick.fadeTime=0.02;
~kick={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.0],[3,-3]),imp * hit);
  var sig = SinOsc.ar(50!2+(env**20*100),env**LFNoise1.kr(~tempo/32).range(20,80)*8pi);
  sig = sig * env;
  Splay.ar(sig,0.05,0.5);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;
