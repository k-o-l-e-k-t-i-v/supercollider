(
  p=ProxySpace.push(s.reboot);
);




// voice synth ///////////////////////////////////////

(
~voice.quant=1;
~voice.fadeTime=4.02;
~voice={
  var sig = Mix.fill(20,{|i| Formant.ar(43.20+(i*2*43.2),432.0/(i*10),43.2/(i+1),mul:0.1)});
  sig = Normalizer.ar(sig);
  sig = Formlet.ar(Dust.ar(111!2),[43.2,80.00],0.005,0.047) + (sig+sig);
  sig = BBandPass.ar(sig,14600/16*(1..16),0.05,mul:LFDNoise1.ar(1/4!16).exprange(0.000001,0.6));
  sig = sig.softclip;

 
  //sig = LPF.ar(sig,1200);
  sig = GVerb.ar(sig,100)/2+sig;
  sig = CompanderD.ar(sig,4/3,1/4,1/2);
  sig = Resonz.ar(sig,2860/16*(1..16)+43 + LFDNoise1.ar([12,280]).range(-10,420) ,0.0005,mul:LFDNoise1.ar(7!16).exprange(0.000001,0.6)); 
  sig = CompanderD.ar(sig,4/3,1/4,1/2);
  sig = Limiter.ar(sig);
  Splay.ar(sig,0.75,0.5);
};
~voice.play;
);
~voice.stop(7);
~voice.clear;



