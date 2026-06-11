s.boot;
p=ProxySpace.push()

~one.fadeTime=5;
(
~one={
  var mod = LFSaw.ar(4/[4,3,2])/2+1;
  var sig = {SinOsc.ar([47.5,475,50,500]*([1,5,8]/12**2+1) * mod,mul:0.1)}.sum;
  sig = Splay.ar(sig,0.75,0.5,LFSaw.ar(1/[3,4,2]));
  sig = sig * Pulse.ar(4/[1,2,3]);
  sig = LeakDC.ar(sig);
  sig = CombL.ar(sig,1,1/([1,5,8]/12**2+47.5),1);
  sig = LPF.ar(sig,1800) + HPF.ar(sig,5000) / 10 + sig;
  sig = CompanderD.ar(sig,3/4,1/2,1)/8+sig/2;
  //sig = GVerb.ar(sig,60,7)/12 + sig;
  sig;
};
~one.play();
)
