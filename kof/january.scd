(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);

(
  p.clock.tempo_(120/60);

  ~offset = (0..7)/8;

  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

  ~counter = {PulseCount.kr(~tick.kr)};
);




// one synth ///////////////////////////////////////

(
  ~one.ar(2);
  ~one.quant=2;
  ~one.fadeTime=4.2;
  ~one={
    var mod = Duty.kr(16,0,Dseq(100/[1.5,2,1.333,3],inf)).lag(1);
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,1,0,1,0,0,0,1,0,1,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5+SinOsc.kr(1/16,mul:0.5)],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(mod+(env**20*200));
    sig = sig * env * LFNoise2.kr(1/4!2).range(0.25,1);
    Splay.ar(sig,0.005,0.25);
  };
  ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


// two synth ///////////////////////////////////////

(
  ~two.ar(2);
  ~two.quant=2;
  ~two.fadeTime=0.2;
  ~two={
    var mod = Duty.kr(16,0,Dseq([1500,5000,3000,10000],inf)).lag(1);
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,[8,3,4,5],~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.007,2.15/[1,2,3,4]],[3,-3],curve:'exp'),imp * hit);
    var sig = Dust.ar(15000!2);
    sig = RLPF.ar(sig,mod/[1,1.5,3,1.25],SinOsc.kr(4.011/[1,2,3,4],add:1));
    sig = sig * (env**[3,4,5,6]) * LFNoise1.kr(1/8!4);
    Splay.ar(sig,0.25,0.25);
  };
  ~two.play;
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;


// three synth ///////////////////////////////////////

(
  ~three.ar(2);
  ~three.quant=2;
  ~three.fadeTime=0.2;
  ~three={
    var mds = [1,1.5,2,4];
    //         |       |       |       |       |  
    var pat = [0,0,0,0,1,0,0,0,1,0,0,0,1,0,0,1].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,[3,4,5,6],~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.0001,1,0.0001],[0.002,SinOsc.kr(1/[2,3,4,5]).range(0.01,0.75)],[3,-30],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50*(1/(1..16)+1),mul:SinOsc.kr(1/4).range(0,0.2));
    sig = Vibrato.ar(sig,[4,3,8,16],0.28);
    sig = MoogFF.ar(sig,5000/mds,2.95*env**0.92);
    sig = sig * env * LFNoise2.kr(1/8.2!4);
    Splay.ar(sig,0.95,0.25,SinOsc.kr([2,3.01])*pi);
  };
  ~three.play;
);
~three.stop(4);
~three.clear;
~three.pause;
~three.resume;

// two synth ///////////////////////////////////////

(
~four.ar(2);
~four.quant=2;
~four.fadeTime=0.2;
~four={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]*3,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = LFNoise2.ar(16000/[1,2,4,8]);
  sig = sig * env * LFNoise2.kr(1/4!4);
  Splay.ar(sig,0.75,0.15);
};
~four.play;
);
~four.stop(4);
~four.clear;
~four.pause;
~four.resume;

// oo synth ///////////////////////////////////////

(
  ~oo.ar(2);
  ~oo.quant=2;
  ~oo.fadeTime=0.2;
  ~oo={
    var mod = Duty.kr(32,0,Dseq([1,2,1.5,1.25],inf));
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,0,1,0].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]*2,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.095+SinOsc.kr(1/32/[1,1.1,1.12,1.123,1.234],mul:0.25)],[3,-30],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(15000/[1,2,4,8]/mod,SinOsc.ar(500+(env**0.04*1000))*0.2,mul:0.1);
    sig = sig * env*LFNoise2.kr(1/8.1!4);
    Splay.ar(sig,0.75,0.5);
  };
  ~oo.play;
);
~oo.stop(4);
~oo.clear;
~oo.pause;
~oo.resume;

// bbas synth ///////////////////////////////////////

(
~bbas.ar(2);
~bbas.quant=2;
~bbas.fadeTime=0.2;
~bbas={
    var mod = Duty.kr(16,0,Dseq([1,2,0.5,4],inf));
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.12,0.175],[3,-3],curve:'exp'),imp * hit);
  var sig = LFSaw.ar(49)*SinOsc.ar(1/mod)*SinOsc.ar(5000/mod);
  sig = Resonz.ar(sig,50+(50/((1..32).reciprocal/mod+1)),LFNoise2.kr(1/4!4).range(0.1,0.9));

  sig = sig * env * LFNoise2.kr(1/4!4);
  Splay.ar(sig,0.5,0.5,SinOsc.kr(1/7));
};
~bbas.play;
);
~bbas.stop(4);
~bbas.clear;
~bbas.pause;
~bbas.resume;

// aa synth ///////////////////////////////////////

(
  ~aa.ar(2);
  ~aa.quant=2;
  ~aa.fadeTime=4;
  ~aa={
    var sig = SinOsc.ar(50!2*Duty.kr(16,0,Dseq([1,2,1.5,1.25],inf)).lag(1));
    Splay.ar(sig,0.25,0.05);
  };
  ~aa.play;
);
~aa.stop(4);
~aa.clear;
~aa.pause;
~aa.resume;


// mel synth ///////////////////////////////////////

(
~mel.ar(2);
~mel.quant=2;
~mel.fadeTime=4;
~mel={
  var f = 500.0/([1,2,4,1.5,4/3,8].scramble*[0.5,0.25]*pi)/([1,2,1.5,4/3,4].choose);
  var sig = SinOsc.ar(f,[0,pi]) + LFSaw.ar(f,[0,1]) + Pulse.ar(f) + BrownNoise.ar(0.6);
  sig = sig * LFTri.ar(1/fib(16)).exprange(0.001,1);
  sig = Resonz.ar(sig,f+SinOsc.kr(f/10.001/fib(16).scramble).range(f/1.025,f*1.025),0.005+LFNoise2.kr(1/4!16).exprange(0.001,0.5))*4;
  sig = CombN.ar(sig,1,1.001,4)/4+sig;
  sig = AllpassN.ar(sig,1.1,[2,2.01],4)/4 + sig;
  sig = CompanderD.ar(sig,3/4,1/2,1/2) * LFNoise2.kr(1/4!4);
  Splay.ar(sig,0.95,0.025,SinOsc.kr/(1/6));
};
~mel.play;
~reb.quant=2;
~reb={loop{~mel.rebuild;16.wait;}}.fork;
);
~reb.clear;
~mel.stop(4);
~mel.clear;
~mel.pause;
~mel.resume;






(
  ~compress={
    var sig = []++~one.ar++~two.ar++~three.ar++~four.ar++~oo.ar++~bbas.ar++~aa.ar++~mel.ar;
     
    //sig = DelayN.ar(sig,(1..4),(1..4))*LFNoise2.kr(1/4!4)+sig;
    sig = GVerb.ar(LPF.ar(sig,7500),[30,10],[3,4],SinOsc.kr(1/16/[4.0111,4.1]).range(0.1,0.9),[0.22,0.9],spread:55)/128.0+sig;
    sig = Mix.ar(CompanderD.ar(sig*LFNoise2.kr(1/4!8).range(0.2,0.7),3/4,1/3.5,1/2,0.00001,0.5));
    Splay.ar(sig,0.82,0.33,SinOsc.kr(1/4.1)*pi);
  };
  ~compress.play;
)

~compress.stop(15);
