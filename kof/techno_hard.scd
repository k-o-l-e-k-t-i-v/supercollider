


(
  p=ProxySpace.push(s.reboot);
  e=ProxySubmix.new(\filter);
);



// kick synth ///////////////////////////////////////
(
(
~kick.quant=4;
~kick.fadeTime=0.02;
~kick={
  var env = EnvGen.ar(Env([0,1,0],[0.0002,0.75],[9,-2]),Impulse.ar(1/2,(0..3)++0.5/4));
  var sig = Mix.fill(40,{|i|SinOsc.ar(80+(100/(i+1))!2*env.pow(3)+(env.pow(8)*200),mul:0.2) * env});
  sig = Normalizer.ar(sig) * env;
  sig = HPF.ar(sig,80+LFSaw.ar(1/4).exprange(0.001,100));
  sig = LeakDC.ar(sig);
  sig = CompanderD.ar(sig,4/3,1/8,1/2);
  Splay.ar(sig.flat,0.5,1);
};
e.addMix(~kick,postVol:true);
~kick.play;
);

// hiss synth ///////////////////////////////////////

(
~hiss.quant=0.5;
~hiss.fadeTime=0.02;
~hiss={
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.15],[3,-5]),Impulse.ar(1+LFPulse.ar(1),(0..3)/4));
  var sig = HPF.ar(WhiteNoise.ar(2!2),4000) * env;
  sig = BPF.ar(sig,LFDNoise1.kr(1/2!4).range(2000,16000*env),0.5);
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);
);


// aa filter ///////////////////////////////////////

(
~aa.quant=1;
~aa.fadeTime=1;
~aa={
  var high,mid,low;
  var sig = e.ar;
  //sig = GVerb.ar(sig,40,3,0.01,0.15,65);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,2000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,4200),4/3,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,4/3,1/1.1,1/1.1);
  Splay.ar(sig,0.25,0.25);
};
~aa.play;
);
~aa.stop(7);



~kick.stop(7);
~kick.clear;
~hiss.stop(7);
~hiss.clear;

