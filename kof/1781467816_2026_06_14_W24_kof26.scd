s.boot();

p=ProxySpace.push();

~tempo={1/(2**0.5)}

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
  var duty = Duty.kr(4/~tempo,0,Dseq([632,720,576,480,1024],inf));
  var sig = SinOsc.ar([932,720,600,400]) * Pulse.ar(4/[1,1.1618,1.4142]) + LFSaw.ar([50,60,40]);
  sig = CombN.ar(sig * SinOsc.ar([632,1024]),1/2,1/2,1)/4+sig;
  sig = LFPulse.ar(24/[3,2,4,6]) * sig;
  sig = CombL.ar(sig,1,vals/632,1/4)/1 + sig;
  Splay.ar(sig,0.95,0.5);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


s.scope
