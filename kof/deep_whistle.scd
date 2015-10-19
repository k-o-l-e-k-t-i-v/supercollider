

(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);


(
  p.clock.tempo_(60/60);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);



(
~a={

  var fq = [36,55,60,64].midicps / [1,1.5,1.25,2,3,8,0.5,0.25] + SinOsc.ar(1/8*(1..8)).range(-4,4);
  var sig = LFSaw.ar(fq,mul:0.1) + LFNoise2.ar(fq*2,mul:0.2) + SinOsc.ar(50);
  sig = sig * LFSaw.ar(~tempo.kr/4/(1..16)).exprange(0.0001,1);
  sig = CombL.ar(sig,1/4,LFNoise2.kr(1/4!4).range(0.001,0.5)+0.002,2);
  sig = CombL.ar(sig,1/4,LFNoise2.kr(1/8!4).range(0.001,0.5)+0.002,4);
  sig = CombL.ar(sig,1/4,LFNoise2.kr(1/16!4).range(0.001,0.5)+0.002,8);
  sig = Resonz.ar(sig,fq*[1,2,4,8,16,32],0.25)*4;
  sig = LPF.ar(sig,16000);
  sig = Mix.ar(sig)!2;
  sig = Delay1.ar(sig,LFNoise2.kr(1/4!2).range(0.001,0.2));
  Splay.ar(sig.flat,0.9,0.95);

};
~a.play;
)
