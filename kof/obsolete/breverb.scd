

// coin synth ///////////////////////////////////////

(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([0.01,[400,250,250,200,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0885],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/4,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(2).exprange(0.01,0.56)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,1.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/4,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = LPF.ar(GVerb.ar(sig,100+((1..8)/8),mul:0.5),LFSaw.ar(1/4/fib(8)).exprange(100.001,10000))+(sig*LFSaw.ar(1/4/fib(8)).exprange(0.001,1));
  sig = sig * Pulse.ar(4);
  sig = Resonz.ar(GVerb.ar(sig,10+((1..8)/8),mul:0.5),LFSaw.ar(1/fib(8)).exprange(100.001,10000))+(sig*LFSaw.ar(4/fib(8)).exprange(0.001,1));
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.25,SinOsc.kr(4));
};
m.addMix(~coin,postVol:true);
~coin.play;
);
~coin.stop(7);



History.end;
