

(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);


(
  p.clock.tempo_(1/2);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);



(
~a.fadeTime = 4;
~a={

  var fq = [36,55,72,64].midicps / [1,1.5,1.25,2,3,8,0.5,0.25] + SinOsc.ar(1/8*(1..8)).range(-4,4);
  var sig = LFSaw.ar(fq,mul:0.1) + LFNoise2.ar(fq*2,mul:0.2) + SinOsc.ar(50);
  sig = sig * LFSaw.ar(~tempo.kr/4/(1..16)).exprange(0.0001,1);
  sig = CombL.ar(sig,1/4,LFNoise2.kr(1/4!4).range(0.001,0.5)+0.02,2);
  sig = CombL.ar(sig,1/4,LFNoise2.kr(1/8!4).range(0.001,0.5)+0.02,4);
  sig = CombL.ar(sig,1/4,LFNoise2.kr(1/16!4).range(0.001,0.5)+0.02,8);
    sig = Resonz.ar(sig,fq*[1,2,4,8,16,32]+SinOsc.ar(50.001),0.25)*4;
  sig = LPF.ar(sig,16000);
  sig = Mix.ar(sig)!2;
  sig = DelayN.ar(sig,0.1,LFNoise2.kr(1/4!2).range(0.001,0.1));
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.9,0.25);

};
~a.play;
)




// ss synth ///////////////////////////////////////

(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=2.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.25],[3,-3],curve:'exp'),imp * hit);
  var sig = AudioIn.ar([0,1]);
    sig = PitchShift.ar(sig,0.1,[1,1.0,1.25]);
    sig = CombN.ar(sig,1,1/[1,2,1.5,4],16);
  //sig = sig * env;
  Splay.ar(sig,0.75,~n8);
};
~ss.play;
);
~ss.stop(4);
~ss.clear;
~ss.pause;
~ss.resume;

~a.rebuild;
