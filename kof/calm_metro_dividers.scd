

(
  p=ProxySpace.push(s.reboot);
  e=ProxySubmix.new(\filter);
  m = ProxyMixer.new(p);
);



(
  var tempo = 4/3;
  var offset = (0..7)/8;
  t = TempoClock.new(tempo);
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( tempo / 2 , offset ))};
  
  offset = (0..7)+0.5/8;
  ~tick2.quant = 1;
  ~tick2 = {Mix(Impulse.kr( tempo / 2 , offset ))};
)



// kick synth ///////////////////////////////////////

(
~kick.quant=1;
~kick.fadeTime=1.02;
~kick={
  var imp = PulseDivider.kr(~tick.kr,[4,8,16]*2);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3]),imp);
  var sig = SinOsc.ar(env**[80,120,400]*800+80);
  sig = sig * env;
  Splay.ar(sig,0.25,0.5);
};
e.addMix(~kick,postVol:true);
~kick.play;
);
~kick.stop(7);
~kick.clear;


// bb synth ///////////////////////////////////////

(
~bb.quant=1;
~bb.fadeTime=4.02;
~bb={
  var imp = PulseDivider.kr(~tick.kr,16);
  var env = EnvGen.ar(Env([0.001,1,0.001],[2.502,0.5],[5,-5]),imp);
  var sig = SinOsc.ar(env**[0.1,0.5,0.08]*10+Select.kr(LFNoise0.kr(1/3!3).range(0,8),[36,64,55,58,65,72,67].midicps)*2);
  sig = sig * env;
  sig = CombN.ar(sig,0.3,0.3,3) + sig;
  Splay.ar(sig,0.25,0.25);
};
e.addMix(~bb,postVol:true);
~bb.play;
);
~bb.stop(7);
~bb.clear;


// hat synth ///////////////////////////////////////

(
~hat.quant=1;
~hat.fadeTime=0.02;
~hat={
  var imp = PulseDivider.kr(~tick.kr,[4,16]);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,[0.15,2]],[3,-3]),imp);
  var sig = WhiteNoise.ar(0.5!2);
  sig = HPF.ar(sig,LFNoise2.kr(1/16!4).range(1000,16000));
  sig = sig * env;
  sig = sig + (CombC.ar(sig,1/32,1/33,1) * LFPulse.ar(1));
  Splay.ar(sig,0.25,0.5);
};
e.addMix(~hat,postVol:true);
~hat.play;
);
~hat.stop(7);
~hat.clear;


// high synth ///////////////////////////////////////

(
~high.quant=1;
~high.fadeTime=0.02;
~high={
  var imp = PulseDivider.kr(~tick.kr,32);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3]),imp);
  var sig = SinOsc.ar(5000 + SinOsc.kr(11).range(-10,10),mul:0.02);
  sig = sig * env;
  Splay.ar(sig,0.25,0.5);
};
e.addMix(~high,postVol:true);
~high.play;
);
~high.stop(7);
~high.clear;



// fil filter ///////////////////////////////////////

(
~fil.quant=1;
~fil.fadeTime=1;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(HPF.ar(sig,400),40)/8 + LPF.ar(sig,400);
  low = CompanderD.ar(LPF.ar(sig,800),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,800,2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,800),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  Splay.ar(sig,0.25,0.25);
};
~fil.play;
);
~fil.stop(7);
~fil.clear;
