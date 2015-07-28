


(
  p=ProxySpace.push(s.reboot);
);



// system_sound synth ///////////////////////////////////////

(
~system_sound.quant=1;
~system_sound.fadeTime=0.02;
~system_sound={
  var temp = 3/4 + Duty.kr(Dseq([7.5,0.5],inf),0,Dseq([0,4-(3/4)],inf));
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.5],[5,-7]),Impulse.ar(temp,(1..4)/4));
  var env1 = EnvGen.ar(Env([0,1,0],[0.002,0.25],[9,-10]),Impulse.ar(temp,(1..4)/4));
  var env2 = EnvGen.ar(Env([0,1,0],[0.25,0.15],[5,-7]),Impulse.ar(temp,(1..4)/4));
  
  var sig = Mix.fill(8,{|i| BPF.ar(SinOsc.ar(100 + (env1*200),mul:0.75),1200/8*(i+1),0.2 )*8;});
  sig = sig * env + LFSaw.ar(44*(1.00001**(1..8)),mul:env2);
  sig = WhiteNoise.ar(1!2) * Delay1.ar(env,3/4/3) + sig;
  sig = CompanderD.ar(sig,3/4,1/2,1/2);
  Splay.ar(sig,0.25,0.5);
};
~system_sound.play;
);
~system_sound.stop(7);
~system_sound.clear;
