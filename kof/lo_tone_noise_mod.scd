


(
  p=ProxySpace.push(s.reboot,clock:TempoClock.default);
);


(
  ~tempo = 4/3;
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~offset = (0..7)+0.5/8;
  ~tick2.quant = 1;
  ~tick2 = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
  ~time = {LFSaw.kr(~tempo/4).range(0,1)};
)

// nois synth ///////////////////////////////////////

(
~nois.quant=1;
~nois.fadeTime=3.02;
~nois={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0];
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[4.002,0.5],[3,-3]),imp * hit);
  var sig = BPF.ar(WhiteNoise.ar(1!4),LFNoise2.kr(1/4!4).range(400,8000),env/8+0.01);
  sig = Normalizer.ar(sig) + Formant.ar(20*[1,2,1.5,1.25],[400,800,1600,3200],1200) + RLPF.ar(Dust.ar(0.1!4)*60,[800,8000,12000,10000]);
  sig = DelayN.ar(sig,[1,2,3,4])+sig;
  sig = CombN.ar(sig,1/4,1/[4,2,1,8],4);
  sig = BBandPass.ar(sig,16000/8*(1..8),1,mul:LFNoise2.kr(fib(8)).exprange(0.0001,1));
  sig = CompanderD.ar(sig + SinOsc.ar(60*env,mul:0.25),3/4,1/2,1/2);
  sig = GVerb.ar(sig,40,[2,3,4,5],spread:[40,90])/4+sig;
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~nois.play;
);
~nois.stop(7);
~nois.clear;
