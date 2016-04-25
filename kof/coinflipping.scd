


// coin synth ///////////////////////////////////////

(
~coin.ar(2);
~coin.quant=2;
~coin.fadeTime=4;
~coin={
  var trig = CoinGate.kr(0.15,Impulse.kr(8/(1..16)));
  var env = Decay2.kr(trig,0.002,8/(1..16));
  var sig = SinOsc.ar(16000/640*fib(16,1,2)+SinOsc.kr(5/(1..16),mul:2),env**(1/(1..16))*4pi) * env.pow(2);
  sig = LeakDC.ar(sig);
  sig = CombN.ar(sig,10/44100,1/(1..16)*(env**(0.98/(1..16))),8);
  sig = LeakDC.ar(sig);
  sig = LPF.ar(sig,2900);
  sig = CompanderD.ar(sig,3/4,1/3,1/2);
  Splay.ar(sig,0.05,0.25);
};
~coin.play;
);
~coin.stop(4);
~coin.clear;
~coin.pause;
~coin.resume;
