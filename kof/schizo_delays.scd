



(
  p=ProxySpace.push(s.reboot);
  e=ProxySubmix.new(\filter);
);



// switcher synth ///////////////////////////////////////

(
~switcher.quant=2;
~switcher.fadeTime=0.02;
~switcher={
  var duty = Duty.kr(4,0,Dseq([1,2,1.5,1.25],inf));
  var mod = Duty.kr(16,0,Dseq([1,2,1.5,1.25].pyramid,inf));
  var freq = [60,58,55,72].midicps*2/(mod*pi)*(1.001**(1..8))*duty;
  var puls = EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),Impulse.ar(1,(0..3)++0.5/4));
  var sig = [
    SinOsc.ar(freq+(puls*10)),
    WhiteNoise.ar(0.4),
    LFSaw.ar(freq+(puls*10)),
    PinkNoise.ar(0.7)
  ];
  sig = Select.ar(LFSaw.ar(1/4).exprange(0.001,sig.size+0.1),sig/2);
  sig = LPF.ar(sig,10000);
  sig = BBandPass.ar(sig,4320/(1..8)) * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = sig + (SinOsc.ar(50+(puls**2*150),mul:0.045)*Pulse.ar(4/[1,1.5]));
  sig = sig + (LFPulse.ar(1/4)*AllpassC.ar(sig,1/50.01*mod,1/50*duty,32));
  sig = GVerb.ar(sig/1.5,[20,100])+sig;
  sig = CompanderD.ar(sig,4/3,1/3,1/2);
  sig = sig * puls;

  Splay.ar(sig,0.125,0.75);
};
e.addMix(~switcher,postVol:true);
~switcher.play;
);
~switcher.stop(7);
