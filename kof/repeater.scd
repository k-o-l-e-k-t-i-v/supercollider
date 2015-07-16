

(
  p=ProxySpace.push(s.reboot);
);



/////// FEEDBACK CONTROL ////////////
(
~vol.fadeTime=1;
~vol={0.5};
)

s.scope;

// input synth ///////////////////////////////////////


(
~repeater.quant=1;
~repeater.fadeTime=0.0002;
~repeater={
  var time = 4;
  var sig = DelayN.ar(~repeater.ar,time,time) * ~vol.kr;
  sig = sig + Dust.ar(1!2); 
  sig = BPF.ar(Decay.ar(sig,0.001),LFNoise1.ar(1!2).range(90,18000))+sig;
  sig = CompanderD.ar(sig,1/2,1/1.1,1/2);
  Limiter.ar(sig.softclip);
};
~repeater.play;
);
~repeater.stop(7);
~repeater.clear;



// ring synth ///////////////////////////////////////

(
~ring.quant=1;
~ring.fadeTime=4.02;
~ring={
  var sig = Formlet.ar(~repeater.ar,[77,432*[1,1.5,2,4]],0.001,0.02);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
~ring.play;
);
~ring.stop(7);
~ring.clear;
