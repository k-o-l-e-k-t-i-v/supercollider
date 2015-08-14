

(
  p=ProxySpace.push(s.reboot);
);


(
  var offset = (0..7)/8;
  ~tempo = 120/60;
  t = TempoClock.new(~tempo);
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , offset ))};

  offset = (0..7)+0.5/8;
  ~tick2.quant = 1;
  ~tick2 = {Mix(Impulse.kr( ~tempo / 2 , offset ))};
  ~counter = {PulseCount.kr(~tick.kr)};
  ~time = {LFSaw.kr(~tempo/16).range(0,1)};
)


// saw synth ///////////////////////////////////////

(
  ~saw.quant=4;
  ~saw.fadeTime=0.02;
  ~saw={
    var mod = Duty.kr(1/~tempo*8,0,Dseq( [1,2,1.5,1.25,1.5,2] ,inf)).lag(1);
    var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]*2,~counter.kr);
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.75*(1..4)],[4,-3]),imp);
    var f = env ** 8 * 40 + ( [44,88,44,444] * 2 / mod) + SinOsc.ar(1/7/fib(4)).range(-3,3);
    var sig = [] ++ Saw.ar(f) ++ LFPulse.ar(f,LFNoise2.kr(1/8).exprange(0.0001,0.1)) ++ LFSaw.ar(f,1) ++ SinOsc.ar(f,2);
    sig = Select.ar(~counter%sig.size,sig);
    sig = MoogFF.ar(sig,LFNoise2.kr(1/4!4).range(10,16000),LFNoise2.kr(1/4!4)*3) + sig;
    sig = RLPF.ar(sig,LFNoise2.kr(1/8/fib(4)).range(200,20000),0.2);
    sig = GVerb.ar( sig ,20,[2,3,4,5],spread:80)/8+sig;
    sig = CompanderD.ar(sig,3/4,1/3,1/2);
    sig = sig * env;
    Splay.ar(sig.flat,0.75,0.35);
  };
  ~saw.play;
);
~saw.stop(7);
~saw.clear;

