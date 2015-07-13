

(
  p=ProxySpace.push(s.reboot);
  e=ProxySubmix.new(\filter);
);


// boom synth ///////////////////////////////////////


// high synth ///////////////////////////////////////

(
~high.quant=1;
~high.fadeTime=0.02;
~high={
  var sig = SinOsc.ar(4320/([2,4,8,12,16,24]*0.75pi));
  sig = sig * LFSaw.ar(1/4/(1..6)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~high,postVol:true);
~high.play;
);
~high.stop(7);
~high.clear;

// kaboom synth ///////////////////////////////////////

(
~kaboom.quant=1;
~kaboom.fadeTime=0.02;
~kaboom={
  var sig = LFSaw.ar(72*(1.001**(1..8)));
  var env = EnvGen.ar(Env([0,1,0],[0.002,1.5],[3,-3]),Impulse.ar(1/4,(0..7)/8));
  sig = BPF.ar(sig,16000*LFSaw.ar(1/4/(1..4)).exprange(0.001,1)+80,0.2) * env;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~kaboom,postVol:true);
~kaboom.play;
);
~kaboom.stop(7);
~kaboom.clear;



(
~boom.quant=1;
~boom.fadeTime=0.02;
~boom={
  var md = Duty.kr(1,0,Dseq([1,2,1.5,1.25]*2,inf));
  var tem = Duty.kr(1/4,0,Dseq([1,2,1.25,1.25]*md,inf));
  var env = EnvGen.ar(Env([0,LFSaw.ar(1/4).exprange(0.1,1),0],[0.0002,1.75/md],[3,-2]),Impulse.ar(tem,(0..3)/4));
  var sig = LFPulse.ar(env.pow(6)*400*tem+99) + PinkNoise.ar(0.2!2) * env;
  sig = BPF.ar(sig*8,60+SinOsc.ar(4).range(0,200),0.2);
  Splay.ar(sig.flat,0.25,0.3);
};
e.addMix(~boom,postVol:true);
~boom.play;
);
~boom.stop(7);
~boom.clear;


// preset filter ///////////////////////////////////////

(
~preset.quant=1;
~preset.fadeTime=4;
~preset={
  var high,mid,low;
  var sig = e.ar * Pulse.ar(2/fib(8));
  sig = Vibrato.ar(sig,[3,4,5,6],0.2);
  sig = GVerb.ar(sig,10,3,0.01,0.4,120)+sig;
  low = CompanderD.ar(LPF.ar(sig,150),4/3,1/4,1/2);
  mid = CompanderD.ar(BPF.ar(sig,400*LFSaw.ar(1/4/fib(4)).exprange(0.001,1)+400,0.2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,14000),4/3,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat.clip,4/3,1/1.01,1/1.01);
  Splay.ar(sig,0.25,0.475);
};
~preset.play;
);
~preset.stop(7);
