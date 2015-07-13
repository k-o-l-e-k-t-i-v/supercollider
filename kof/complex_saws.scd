


(
  p=ProxySpace.push(s.reboot);
  e=ProxySubmix.new(\filter);
);



// complex synth ///////////////////////////////////////

(
~complex.quant=1;
~complex.fadeTime=0.02;
~complex={
  var sig = LFSaw.ar(SinOsc.ar([1,2,3,4]/fib(21)).exprange(0.001,1).round(1/64pi)*20000+100,mul:0.2);
  sig = Resonz.ar(sig,SinOsc.ar(1/fib(21)).range(40,20000));
  sig = AllpassC.ar(sig,SinOsc.ar(1/16/fib(21)).exprange(0.001,1),1/8,4);
  sig = BPF.ar(sig,20000/(1..21)+100,0.1) * SinOsc.ar(1/2/fib(21)).exprange(0.001,1);
  sig = sig * Pulse.ar([1,2,3,4]);
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~complex,postVol:true);
~complex.play;
);
~complex.stop(7);
~complex.clear;
