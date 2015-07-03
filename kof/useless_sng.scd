

(
  p=ProxySpace.push(s.reboot);
  e=ProxySubmix.new(\filter);
);

// saw synth ///////////////////////////////////////

(
~saw.quant=2;
~saw.fadeTime=3;
~saw={
  var env = Decay.ar(Impulse.ar([1,8],(0..3)+TExpRand.ar(0.0001,0.01,Impulse.ar(4!4))/4),3);
  var freq = ([60,67,65,63,58].midicps.pyramid)*8/[1,1.5,1/2]/([1,2,1.5,1.25,1.125,4,8]*2pi)-(env*SinOsc.ar(env*10).range(-4,4));
  var sig = LFSaw.ar(freq,mul:0.4);
  sig = BPF.ar(sig,freq+SinOsc.kr(4/fib(4)).range(-40,40));
  sig = sig * LFSaw.ar(1/4/fib(4)).exprange(0.001,4);
  sig = sig * env;
  sig = Limiter.ar(sig);
  sig = AllpassN.ar(sig.distort,1/[1,2,4,8],1/4,4);
  sig = LPF.ar(sig,2500)/2+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~saw,postVol:true);
~saw.play;
);
~saw.stop(7);


// kick synth ///////////////////////////////////////

(
~kick.quant=2;
~kick.fadeTime=4;
~kick={
  var his = EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1,(0..3)++0.5/4));
  var env = Decay.ar(Impulse.ar(1,(0..3)++0.5/4),1);
  var sig = SinOsc.ar(72-(20*(env**0.02))+(env**4*250),mul:0.2) + (his * BrownNoise.ar(0.4!2));
  sig = sig * Pulse.ar([1/4,4]);
  sig = Limiter.ar(sig);
  sig = LPF.ar(sig,4480*LFSaw.ar(4/fib(4)).exprange(0.001,1)+100);
  sig = GVerb.ar(sig,[50,60])/2+sig;
  Splay.ar(sig.flat,0.25,0.35);
};
e.addMix(~kick,postVol:true);
~kick.play;
);
~kick.stop(7);



// noise synth ///////////////////////////////////////

(
~noise.quant=2;
~noise.fadeTime=5;
~noise={
  var sig = BrownNoise.ar(0.2!2);
  sig = HPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(100.001,10000));
  sig = sig * LFSaw.ar([4,8]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~noise,postVol:true);
~noise.play;
);
~noise.stop(7);


History.end;
