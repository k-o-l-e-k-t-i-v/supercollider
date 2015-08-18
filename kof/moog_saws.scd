


(
  p=ProxySpace.push(s.reboot,clock:TempoClock.default);
);



(
  ~tempo = 1/3;
  ~offset = (0..7)/8;
  // t = TempoClock.new(~tempo);
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

  ~offset = (0..7)+0.5/8;
  ~tick2.quant = 1;
  ~tick2 = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  ~counter = {PulseCount.kr(~tick.kr)};
  ~time = {LFSaw.kr(~tempo/4).range(0,1)};
)


// ef synth ///////////////////////////////////////

(
  ~ef.quant=1;
  ~ef.fadeTime=3.02;
  ~ef={
    var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]*4,~counter.kr);
    var env = EnvGen.ar(Env([0.001,1,0.001],[1.7502,1.95],[3,-3]),imp);
    var change = PulseDivider.kr(imp,8);
    var freq = Select.kr(TRand.kr(0,7,change),[65,72,60,65,67,36,48].midicps/4) * TRand.kr(2,4,change).round([2,1.5,1.25,1.125]);
    var sig = VarSaw.ar(freq + (env**0.001*freq/100*SinOsc.ar(env*4)),width:LFNoise2.kr(1/4!4),mul:0.13);
    sig = MoogFF.ar(sig,LFNoise2.kr(1/4!4).range(200,15000),LFNoise2.kr(1/4!4)*3.5);
    sig = Normalizer.ar(sig).softclip;
    sig = sig * env;
    Splay.ar(sig,0.75,0.75);
  };
  ~ef.play;
  ~ef[20] =  \filter -> {|i| CompanderD.ar(BPF.ar(i,15000/10*(1..10)+100,0.5),3/4,1/2,1/2,mul:LFNoise2.kr(1/16!8).exprange(0.1,0.5)) + i / 2};
  ~ef[22] = \filter -> {|i| GVerb.ar(i,[10,100],[1,2,3,4],spread:[5,90]) + i};
);
~ef.stop(7);
~ef.clear;
