// History, as it was on Sun Jun 14 15:34:40 2015.

[
[ 0, 'me', "(
~varna.quant=2;
~varna.fadeTime=2;
~varna={
  var sig = LFSaw.ar(50!2);
  sig = sig * (Pulse.ar(1) + Pulse.ar(1.5));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~varna,postVol:true);
~varna.play;
);" ],
[ 6.412350458, 'me', "(
~varna.quant=2;
~varna.fadeTime=2;
~varna={
  var sig = LFSaw.ar(50!2);
  sig = sig * (Pulse.ar(1) + Pulse.ar(1.5));
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~varna,postVol:true);
~varna.play;
);" ],
[ 14.957507762, 'me', "(
~varna.quant=2;
~varna.fadeTime=2;
~varna={
  var sig = LFSaw.ar(50!2);
  sig = sig * (Pulse.ar(1) + Pulse.ar(1.5));
  Splay.ar(sig.flat,0.25,0.035);
};
e.addMix(~varna,postVol:true);
~varna.play;
);" ],
[ 23.929235105, 'me', "(
~varna.quant=2;
~varna.fadeTime=2;
~varna={
  var sig = LFSaw.ar(90!2);
  sig = sig * (Pulse.ar(1) + Pulse.ar(1.5));
  Splay.ar(sig.flat,0.25,0.035);
};
e.addMix(~varna,postVol:true);
~varna.play;
);" ],
[ 28.20529008, 'me', "(
~varna.quant=2;
~varna.fadeTime=2;
~varna={
  var sig = SinOsc.ar(90!2);
  sig = sig * (Pulse.ar(1) + Pulse.ar(1.5));
  Splay.ar(sig.flat,0.25,0.035);
};
e.addMix(~varna,postVol:true);
~varna.play;
);" ],
[ 40.114930768, 'me', "(
~varna.quant=2;
~varna.fadeTime=2;
~varna={
  var sig = SinOsc.ar(90*[1,2]);
  sig = sig * (Pulse.ar(1) + Pulse.ar(1.5));
  Splay.ar(sig.flat,0.25,0.035);
};
e.addMix(~varna,postVol:true);
~varna.play;
);" ],
[ 62.798262776, 'me', "(
~varna.quant=2;
~varna.fadeTime=2;
~varna={
  var sig = SinOsc.ar(90*[1,2]);
  sig = sig * (Pulse.ar(1) + Pulse.ar(1.5));
  sig = Greyhole.ar(sig);
  Splay.ar(sig.flat,0.25,0.035);
};
e.addMix(~varna,postVol:true);
~varna.play;
);" ],
[ 80.01141745, 'me', "(
~varna.quant=2;
~varna.fadeTime=2;
~varna={
  var sig = SinOsc.ar(90*[1,2]) ++ WhiteNoise.ar(0.1!2);
  sig = sig * (Pulse.ar(1) + Pulse.ar(1.5));
  sig = Greyhole.ar(sig);
  Splay.ar(sig.flat,0.25,0.035);
};
e.addMix(~varna,postVol:true);
~varna.play;
);" ],
[ 88.933081639, 'me', "(
~varna.quant=2;
~varna.fadeTime=2;
~varna={
  var sig = SinOsc.ar(90*[1,2]) ++ WhiteNoise.ar(0.4!2);
  sig = sig * (Pulse.ar(1) + Pulse.ar(1.5));
  sig = Greyhole.ar(sig);
  Splay.ar(sig.flat,0.25,0.035);
};
e.addMix(~varna,postVol:true);
~varna.play;
);" ],
[ 106.64081619, 'me', "(
~varna.quant=2;
~varna.fadeTime=2;
~varna={
  var sig = SinOsc.ar(90*[1,2]) ++ WhiteNoise.ar(0.4!2);
  sig = sig * (Pulse.ar(1) + Pulse.ar(1.5) + Pulse.ar(4));
  sig = Greyhole.ar(sig);
  Splay.ar(sig.flat,0.25,0.035);
};
e.addMix(~varna,postVol:true);
~varna.play;
);" ],
[ 111.270009746, 'me', "(
~varna.quant=2;
~varna.fadeTime=2;
~varna={
  var sig = SinOsc.ar(90*[1,2]) ++ WhiteNoise.ar(0.4!2);
  sig = sig * (Pulse.ar(1) + Pulse.ar(1.5) + Pulse.ar(4));
  sig = Greyhole.ar(sig,1/2);
  Splay.ar(sig.flat,0.25,0.035);
};
e.addMix(~varna,postVol:true);
~varna.play;
);" ],
[ 115.808245225, 'me', "(
~varna.quant=2;
~varna.fadeTime=2;
~varna={
  var sig = SinOsc.ar(90*[1,2]) ++ WhiteNoise.ar(0.4!2);
  sig = sig * (Pulse.ar(1) + Pulse.ar(1.5) + Pulse.ar(4));
  sig = Greyhole.ar(sig,1/4);
  Splay.ar(sig.flat,0.25,0.035);
};
e.addMix(~varna,postVol:true);
~varna.play;
);" ],
[ 130.208474035, 'me', "(
~varna.quant=2;
~varna.fadeTime=2;
~varna={
  var sig = SinOsc.ar(90*[1,2]) ++ WhiteNoise.ar(0.4!2);
  sig = sig * (Pulse.ar(1) + Pulse.ar(1.5) + Pulse.ar(4));
  sig = Limiter.ar(sig);
  sig = Greyhole.ar(sig,1/4);
  Splay.ar(sig.flat,0.25,0.035);
};
e.addMix(~varna,postVol:true);
~varna.play;
);" ],
[ 133.322064663, 'me', "(
~varna.quant=2;
~varna.fadeTime=2;
~varna={
  var sig = SinOsc.ar(90*[1,2]) ++ WhiteNoise.ar(0.4!2);
  sig = sig * (Pulse.ar(1) + Pulse.ar(1.5) + Pulse.ar(4));
  sig = Limiter.ar(sig);
  sig = Greyhole.ar(sig,1/4);
  Splay.ar(sig.flat,0.25,0.135);
};
~varna.play;
);" ],
[ 134.672598272, 'me', "(
~varna.quant=2;
~varna.fadeTime=2;
~varna={
  var sig = SinOsc.ar(90*[1,2]) ++ WhiteNoise.ar(0.4!2);
  sig = sig * (Pulse.ar(1) + Pulse.ar(1.5) + Pulse.ar(4));
  sig = Limiter.ar(sig);
  sig = Greyhole.ar(sig,1/4);
  Splay.ar(sig.flat,0.25,0.535);
};
e.addMix(~varna,postVol:true);
~varna.play;
);" ],
[ 138.397835711, 'me', "(
~varna.quant=2;
~varna.fadeTime=2;
~varna={
  var sig = SinOsc.ar(90*[1,2]) ++ WhiteNoise.ar(0.4!2);
  sig = sig * (Pulse.ar(1) + Pulse.ar(1.5) + Pulse.ar(4));
  sig = Limiter.ar(sig);
  sig = Greyhole.ar(sig,1/4);
  Splay.ar(sig.flat,0.25,0.235);
};
e.addMix(~varna,postVol:true);
~varna.play;
);" ],
[ 141.337028449, 'me', "(
~varna.quant=2;
~varna.fadeTime=2;
~varna={
  var sig = SinOsc.ar(90*[1,2]) ++ WhiteNoise.ar(0.4!2);
  sig = sig * (Pulse.ar(1) + Pulse.ar(1.5) + Pulse.ar(4));
  sig = Limiter.ar(sig);
  sig = Greyhole.ar(sig,1/40);
  Splay.ar(sig.flat,0.25,0.235);
};
e.addMix(~varna,postVol:true);
~varna.play;
);" ],
[ 144.99126726, 'me', "(
~varna.quant=2;
~varna.fadeTime=2;
~varna={
  var sig = SinOsc.ar(90*[1,2]) ++ WhiteNoise.ar(0.4!2);
  sig = sig * (Pulse.ar(1) + Pulse.ar(1.5) + Pulse.ar(4));
  sig = Limiter.ar(sig);
  sig = Greyhole.ar(sig,1/40,0,1);
  Splay.ar(sig.flat,0.25,0.235);
};
e.addMix(~varna,postVol:true);
~varna.play;
);" ],
[ 148.022226391, 'me', "(
~varna.quant=2;
~varna.fadeTime=2;
~varna={
  var sig = SinOsc.ar(90*[1,2]) ++ WhiteNoise.ar(0.4!2);
  sig = sig * (Pulse.ar(1) + Pulse.ar(1.5) + Pulse.ar(4));
  sig = Limiter.ar(sig);
  sig = Greyhole.ar(sig,1/40,0,0.1);
  Splay.ar(sig.flat,0.25,0.235);
};
e.addMix(~varna,postVol:true);
~varna.play;
);" ],
[ 151.015220019, 'me', "(
~varna.quant=2;
~varna.fadeTime=2;
~varna={
  var sig = SinOsc.ar(90*[1,2]) ++ WhiteNoise.ar(0.4!2);
  sig = sig * (Pulse.ar(1) + Pulse.ar(1.5) + Pulse.ar(4));
  sig = Limiter.ar(sig);
  sig = Greyhole.ar(sig,1/40,0,0.1,0.1);
  Splay.ar(sig.flat,0.25,0.235);
};
e.addMix(~varna,postVol:true);
~varna.play;
);" ],
[ 155.448958105, 'me', "(
~varna.quant=2;
~varna.fadeTime=2;
~varna={
  var sig = SinOsc.ar(90*[1,2]) ++ WhiteNoise.ar(0.4!2);
  sig = sig * (Pulse.ar(1) + Pulse.ar(1.5) + Pulse.ar(4));
  sig = Limiter.ar(sig);
  sig = Greyhole.ar(sig,1/40,0,0.1,0.5);
  Splay.ar(sig.flat,0.25,0.235);
};
e.addMix(~varna,postVol:true);
~varna.play;
);" ],
[ 159.030731762, 'me', "(
~varna.quant=2;
~varna.fadeTime=2;
~varna={
  var sig = SinOsc.ar(90*[1,2]) ++ WhiteNoise.ar(0.4!2);
  sig = sig * (Pulse.ar(1) + Pulse.ar(1.5) + Pulse.ar(4));
  sig = Limiter.ar(sig);
  sig = Greyhole.ar(sig,1/40,0,0.5,0.5);
  Splay.ar(sig.flat,0.25,0.235);
};
e.addMix(~varna,postVol:true);
~varna.play;
);" ],
[ 163.166305387, 'me', "(
~varna.quant=2;
~varna.fadeTime=2;
~varna={
  var sig = SinOsc.ar(90*[1,2]) ++ WhiteNoise.ar(0.4!2);
  sig = sig * (Pulse.ar(1) + Pulse.ar(1.5) + Pulse.ar(4));
  sig = Limiter.ar(sig);
  sig = Greyhole.ar(sig,1/40,0.5,0.5,0.5);
  Splay.ar(sig.flat,0.25,0.235);
};
e.addMix(~varna,postVol:true);
~varna.play;
);" ],
[ 169.447045266, 'me', "(
~varna.quant=2;
~varna.fadeTime=2;
~varna={
  var sig = SinOsc.ar(90*[1,2]) ++ WhiteNoise.ar(0.4!2);
  sig = sig * (Pulse.ar(1) + Pulse.ar(1.5) + Pulse.ar(4));
  sig = Limiter.ar(sig);
  sig = Greyhole.ar(sig,1/400,0.5,0.5,0.5);
  Splay.ar(sig.flat,0.25,0.235);
};
e.addMix(~varna,postVol:true);
~varna.play;
);" ],
[ 172.942085319, 'me', "(
~varna.quant=2;
~varna.fadeTime=2;
~varna={
  var sig = SinOsc.ar(90*[1,2]) ++ WhiteNoise.ar(0.4!2);
  sig = sig * (Pulse.ar(1) + Pulse.ar(1.5) + Pulse.ar(4));
  sig = Limiter.ar(sig);
  sig = Greyhole.ar(sig,1/400,0.5,1.5,0.5);
  Splay.ar(sig.flat,0.25,0.235);
};
e.addMix(~varna,postVol:true);
~varna.play;
);" ],
[ 178.597002502, 'me', "(
~varna.quant=2;
~varna.fadeTime=2;
~varna={
  var sig = SinOsc.ar(90*[1,2]) ++ WhiteNoise.ar(0.4!2);
  sig = sig * (Pulse.ar(1) + Pulse.ar(1.5) + Pulse.ar(4));
  sig = Limiter.ar(sig);
  sig = Greyhole.ar(sig,1/400,0.5,0.25,0.5);
  Splay.ar(sig.flat,0.25,0.235);
};
e.addMix(~varna,postVol:true);
~varna.play;
);" ],
[ 183.543561011, 'me', "(
~varna.quant=2;
~varna.fadeTime=2;
~varna={
  var sig = SinOsc.ar(90*[1,2]) ++ WhiteNoise.ar(0.4!2);
  sig = sig * (Pulse.ar(1) + Pulse.ar(1.5) + Pulse.ar(4));
  sig = Limiter.ar(sig);
  sig = Greyhole.ar(sig,1/400,0.5,0.25,0.5) + sig;
  Splay.ar(sig.flat,0.25,0.235);
};
e.addMix(~varna,postVol:true);
~varna.play;
);" ],
[ 199.62663098, 'me', "(
~varna.quant=2;
~varna.fadeTime=2;
~varna={
  var sig = SinOsc.ar(90*[1,2]) ++ WhiteNoise.ar(0.4!2);
  sig = sig * (Pulse.ar(1) + Pulse.ar(1.25) + Pulse.ar(3));
  sig = Limiter.ar(sig);
  sig = Greyhole.ar(sig,1/400,0.5,0.25,0.5) + sig;
  Splay.ar(sig.flat,0.25,0.235);
};
e.addMix(~varna,postVol:true);
~varna.play;
);" ],
[ 248.483001699, 'me', "(
~sin.quant=2;
~sin.fadeTime=2;
~sin={
  var sig = SinOsc.ar(432*[1,2,4,8]);
  sig = sig*LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.015);
};
e.addMix(~sin,postVol:true);
~sin.play;
);" ],
[ 255.342906928, 'me', "(
~sin.quant=2;
~sin.fadeTime=2;
~sin={
  var sig = SinOsc.ar(432*[1,2,4,8]);
  sig = sig*LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.035);
};
e.addMix(~sin,postVol:true);
~sin.play;
);" ],
[ 278.228023829, 'me', "(
~ffil.quant=2;
~ffil.fadeTime=2;
~ffil={
  var high,mid,low;
  var sig = e.ar;
  
  sig = Greyhole.ar(sig,1/400,0.5,0.25,0.5) + sig;
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.1);
};
~ffil.play;
);" ],
[ 280.686983338, 'me', "(
~varna.quant=2;
~varna.fadeTime=2;
~varna={
  var sig = SinOsc.ar(90*[1,2]) ++ WhiteNoise.ar(0.4!2);
  sig = sig * (Pulse.ar(1) + Pulse.ar(1.25) + Pulse.ar(3));
  sig = Limiter.ar(sig);
  Splay.ar(sig.flat,0.25,0.235);
};
e.addMix(~varna,postVol:true);
~varna.play;
);" ],
[ 281.635268511, 'me', "(
~sin.quant=2;
~sin.fadeTime=2;
~sin={
  var sig = SinOsc.ar(432*[1,2,4,8]);
  sig = sig*LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.035);
};
e.addMix(~sin,postVol:true);
~sin.play;
);" ],
[ 291.482934842, 'me', "(
~sin.quant=2;
~sin.fadeTime=2;
~sin={
  var sig = SinOsc.ar(432*[1,2,4,8]);
  sig = sig*LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~sin,postVol:true);
~sin.play;
);" ],
[ 301.14263539, 'me', "(
~ffil.quant=2;
~ffil.fadeTime=2;
~ffil={
  var high,mid,low;
  var sig = e.ar;
  
  sig = Greyhole.ar(sig,1/40,0.5,0.25,0.5) + sig;
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.1);
};
~ffil.play;
);" ],
[ 308.178142839, 'me', "(
~ffil.quant=2;
~ffil.fadeTime=2;
~ffil={
  var high,mid,low;
  var sig = e.ar;
  
  sig = Greyhole.ar(sig,1/40,0.5,0.5,0.5) + sig;
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.1);
};
~ffil.play;
);" ],
[ 312.945397414, 'me', "(
~ffil.quant=2;
~ffil.fadeTime=2;
~ffil={
  var high,mid,low;
  var sig = e.ar;
  
  sig = Greyhole.ar(sig,1/40,0.5,1.5,0.5) + sig;
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.1);
};
~ffil.play;
);" ],
[ 323.763606207, 'me', "(
~sin.quant=2;
~sin.fadeTime=2;
~sin={
  var sig = SinOsc.ar(43.2*[1,2,4,8]);
  sig = sig*LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~sin,postVol:true);
~sin.play;
);" ],
[ 399.369503441, 'me', "(
~sin2.quant=2;
~sin2.fadeTime=2;
~sin2={
  var sig = LFSaw.ar(50*[1,2,4,8,1.5,1.25,1.5,1.55]);
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*14000+50);
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~sin2,postVol:true);
~sin2.play;
);" ],
[ 412.006492883, 'me', "(
~sin2.quant=2;
~sin2.fadeTime=2;
~sin2={
  var sig = LFSaw.ar(43.2*[1,2,4,8,1.5,1.25,1.5,1.55]);
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*14000+50);
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~sin2,postVol:true);
~sin2.play;
);" ],
[ 431.073845246, 'me', "(
~sin2.quant=2;
~sin2.fadeTime=7;
~sin2={
  var sig = LFSaw.ar(432*[1,2,4,8,1.5,1.25,1.5,1.55]);
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*14000+50);
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~sin2,postVol:true);
~sin2.play;
);" ],
[ 442.894250431, 'me', "(
~ffil.quant=2;
~ffil.fadeTime=2;
~ffil={
  var high,mid,low;
  var sig = e.ar;
  
  sig = Greyhole.ar(sig,1/4,0.5,1.5,0.5) + sig;
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.1);
};
~ffil.play;
);" ],
[ 463.115531169, 'me', "(
~sin2.quant=2;
~sin2.fadeTime=7;
~sin2={
  var sig = LFSaw.ar(43.2+(4.32*[1,2,4,8,1.5,1.25,1.5,1.55]));
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*14000+50);
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~sin2,postVol:true);
~sin2.play;
);" ],
[ 469.351495438, 'me', "(
~sin2.quant=2;
~sin2.fadeTime=7;
~sin2={
  var sig = LFSaw.ar(432+(4.32*[1,2,4,8,1.5,1.25,1.5,1.55]));
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*14000+50);
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~sin2,postVol:true);
~sin2.play;
);" ],
[ 475.871005752, 'me', "~sin.stop(7);" ],
[ 480.831059843, 'me', "~varna.stop(7);" ],
[ 502.32827518, 'me', "(
~ffil.quant=2;
~ffil.fadeTime=2;
~ffil={
  var high,mid,low;
  var sig = e.ar;
  
  sig = Greyhole.ar(sig,1/4,0.5,1.5,0.5) + sig;
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.5);
};
~ffil.play;
);" ],
[ 507.258425778, 'me', "(
~ffil.quant=2;
~ffil.fadeTime=2;
~ffil={
  var high,mid,low;
  var sig = e.ar;
  
  sig = Greyhole.ar(sig,1/4,0.5,1.5,0.5) + sig;
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.2);
};
~ffil.play;
);" ],
[ 513.374251013, 'me', "(
~sin.quant=2;
~sin.fadeTime=2;
~sin={
  var sig = SinOsc.ar(43.2*[1,2,4,8]);
  sig = sig*LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.000135);
};
e.addMix(~sin,postVol:true);
~sin.play;
);" ],
[ 517.501484823, 'me', "(
~varna.quant=2;
~varna.fadeTime=2;
~varna={
  var sig = SinOsc.ar(90*[1,2]) ++ WhiteNoise.ar(0.4!2);
  sig = sig * (Pulse.ar(1) + Pulse.ar(1.25) + Pulse.ar(3));
  sig = Limiter.ar(sig);
  Splay.ar(sig.flat,0.25,0.000235);
};
e.addMix(~varna,postVol:true);
~varna.play;
);" ],
[ 531.668921852, 'me', "(
~sin.quant=2;
~sin.fadeTime=2;
~sin={
  var sig = SinOsc.ar(43.2*[1,2,4,8]);
  sig = sig*LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~sin,postVol:true);
~sin.play;
);" ],
[ 533.180155088, 'me', "(
~sin2.quant=2;
~sin2.fadeTime=7;
~sin2={
  var sig = LFSaw.ar(432+(4.32*[1,2,4,8,1.5,1.25,1.5,1.55]));
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*14000+50);
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.005);
};
e.addMix(~sin2,postVol:true);
~sin2.play;
);" ],
[ 548.829050721, 'me', "(
~sin.quant=2;
~sin.fadeTime=2;
~sin={
  var sig = SinOsc.ar(43.2*[1,2,4,8]);
  sig = sig*LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.435);
};
e.addMix(~sin,postVol:true);
~sin.play;
);" ],
[ 577.401628049, 'me', "(
~sin.quant=2;
~sin.fadeTime=2;
~sin={
  var sig = SinOsc.ar(43.2*[1,2,4,8]) + WhiteNoise.ar(0.05!2);
  sig = sig*LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.435);
};
e.addMix(~sin,postVol:true);
~sin.play;
);" ],
[ 590.053412566, 'me', "(
~sin.quant=2;
~sin.fadeTime=2;
~sin={
  var sig = SinOsc.ar(43.2*[1,2,4,8]) + WhiteNoise.ar(0.05!2);
  sig = sig*LFSaw.ar(4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.435);
};
e.addMix(~sin,postVol:true);
~sin.play;
);" ],
[ 592.814704098, 'me', "(
~sin2.quant=2;
~sin2.fadeTime=7;
~sin2={
  var sig = LFSaw.ar(432+(4.32*[1,2,4,8,1.5,1.25,1.5,1.55]));
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*14000+50);
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.005);
};
e.addMix(~sin2,postVol:true);
~sin2.play;
);" ],
[ 597.437128002, 'me', "(
~sin2.quant=2;
~sin2.fadeTime=7;
~sin2={
  var sig = LFSaw.ar(432+(4.32*[1,2,4,8,1.5,1.25,1.5,1.55]));
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*14000+50);
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.015);
};
e.addMix(~sin2,postVol:true);
~sin2.play;
);" ],
[ 605.544775123, 'me', "(
~varna.quant=2;
~varna.fadeTime=2;
~varna={
  var sig = SinOsc.ar(90*[1,2]) ++ WhiteNoise.ar(0.4!2);
  sig = sig * (Pulse.ar(1) + Pulse.ar(1.25) + Pulse.ar(3));
  sig = Limiter.ar(sig);
  Splay.ar(sig.flat,0.25,0.0235);
};
e.addMix(~varna,postVol:true);
~varna.play;
);" ],
[ 609.362870818, 'me', "(
~varna.quant=2;
~varna.fadeTime=2;
~varna={
  var sig = SinOsc.ar(90*[1,2]) ++ WhiteNoise.ar(0.4!2);
  sig = sig * (Pulse.ar(1) + Pulse.ar(1.25) + Pulse.ar(3));
  sig = Limiter.ar(sig);
  Splay.ar(sig.flat,0.25,0.235);
};
e.addMix(~varna,postVol:true);
~varna.play;
);" ],
[ 615.010146098, 'me', "(
~varna.quant=2;
~varna.fadeTime=2;
~varna={
  var sig = SinOsc.ar(90*[1,2]) ++ WhiteNoise.ar(0.4!2);
  sig = sig * (Pulse.ar(1) + Pulse.ar(1.25) + Pulse.ar(3));
  sig = Limiter.ar(sig);
  Splay.ar(sig.flat,0.25,0.1235);
};
e.addMix(~varna,postVol:true);
~varna.play;
);" ],
[ 626.311992506, 'me', "(
~sin2.quant=2;
~sin2.fadeTime=7;
~sin2={
  var sig = LFSaw.ar(432+(4.32*[1,2,4,8,1.5,1.25,1.5,1.55]));
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*14000+50);
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.15);
};
e.addMix(~sin2,postVol:true);
~sin2.play;
);" ],
[ 655.884682823, 'me', "(
~varna.quant=2;
~varna.fadeTime=2;
~varna={
  var sig = SinOsc.ar(90*[1,2]);
  sig = sig * (Pulse.ar(1) + Pulse.ar(1.25) + Pulse.ar(3));
  sig = Limiter.ar(sig);
  Splay.ar(sig.flat,0.25,0.1235);
};
e.addMix(~varna,postVol:true);
~varna.play;
);" ],
[ 660.309508405, 'me', "(
~varna.quant=2;
~varna.fadeTime=2;
~varna={
  var sig = SinOsc.ar(90*[1,2]);
  sig = sig * (Pulse.ar(1) + Pulse.ar(1.25) + Pulse.ar(3));
  sig = Limiter.ar(sig);
  Splay.ar(sig.flat,0.25,0.235);
};
e.addMix(~varna,postVol:true);
~varna.play;
);" ],
[ 677.410578012, 'me', "(
~varna.quant=2;
~varna.fadeTime=2;
~varna={
  var sig = SinOsc.ar(120*[1,2]);
  sig = sig * (Pulse.ar(1) + Pulse.ar(1.25) + Pulse.ar(3));
  sig = Limiter.ar(sig);
  Splay.ar(sig.flat,0.25,0.235);
};
e.addMix(~varna,postVol:true);
~varna.play;
);" ],
[ 688.345392841, 'me', "(
~varna.quant=2;
~varna.fadeTime=2;
~varna={
  var sig = SinOsc.ar(120*[1,1.5]);
  sig = sig * (Pulse.ar(1) + Pulse.ar(1.25) + Pulse.ar(3));
  sig = Limiter.ar(sig);
  Splay.ar(sig.flat,0.25,0.235);
};
e.addMix(~varna,postVol:true);
~varna.play;
);" ],
[ 691.935500224, 'me', "(
~varna.quant=2;
~varna.fadeTime=2;
~varna={
  var sig = SinOsc.ar(120*[1/2,1.5]);
  sig = sig * (Pulse.ar(1) + Pulse.ar(1.25) + Pulse.ar(3));
  sig = Limiter.ar(sig);
  Splay.ar(sig.flat,0.25,0.235);
};
e.addMix(~varna,postVol:true);
~varna.play;
);" ],
[ 704.98162017, 'me', "(
~sin2.quant=2;
~sin2.fadeTime=7;
~sin2={
  var sig = LFSaw.ar(432+(4.32*[1,2,4,8,1.5,1.25,1.5,1.55]));
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*14000+50);
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.0015);
};
e.addMix(~sin2,postVol:true);
~sin2.play;
);" ],
[ 712.295095522, 'me', "(
~ffil.quant=2;
~ffil.fadeTime=2;
~ffil={
  var high,mid,low;
  var sig = e.ar;
  
  sig = Greyhole.ar(sig,1/4,0.5,1.5,0.5) + sig;
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.2);
};
~ffil.play;
);" ],
[ 719.612599258, 'me', "(
~ffil.quant=2;
~ffil.fadeTime=2;
~ffil={
  var high,mid,low;
  var sig = e.ar;
  
  sig = Greyhole.ar(sig,1/4,0.5,1.5,0.5) + sig;
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/4,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.2);
};
~ffil.play;
);" ],
[ 727.199558217, 'me', "(
~ffil.quant=2;
~ffil.fadeTime=2;
~ffil={
  var high,mid,low;
  var sig = e.ar;
  
  sig = Greyhole.ar(sig,1/4,0.5,1.5,0.5) + sig;
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/1.5,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.2);
};
~ffil.play;
);" ],
[ 729.20501249, 'me', "(
~ffil.quant=2;
~ffil.fadeTime=2;
~ffil={
  var high,mid,low;
  var sig = e.ar;
  
  sig = Greyhole.ar(sig,1/4,0.5,1.5,0.5) + sig;
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/1.5,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/3,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.2);
};
~ffil.play;
);" ],
[ 744.953344643, 'me', "(
~varna.quant=2;
~varna.fadeTime=2;
~varna={
  var sig = SinOsc.ar(120*[1/2,1.5]);
  sig = sig * (Pulse.ar(1) + Pulse.ar(1.25) + Pulse.ar(3));
  sig = Limiter.ar(sig);
  Splay.ar(sig.flat,0.25,0.1235);
};
e.addMix(~varna,postVol:true);
~varna.play;
);" ],
[ 746.607773006, 'me', "(
~varna.quant=2;
~varna.fadeTime=2;
~varna={
  var sig = SinOsc.ar(120*[1/2,1.5]);
  sig = sig * (Pulse.ar(1) + Pulse.ar(1.25) + Pulse.ar(3));
  sig = Limiter.ar(sig);
  Splay.ar(sig.flat,0.25,0.001235);
};
e.addMix(~varna,postVol:true);
~varna.play;
);" ],
[ 756.723197474, 'me', "(
~sin.quant=2;
~sin.fadeTime=7;
~sin={
  var sig = SinOsc.ar(43.2*[1,2,4,8]) + WhiteNoise.ar(0.05!2);
  sig = sig*LFSaw.ar(4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.0000435);
};
e.addMix(~sin,postVol:true);
~sin.play;
);" ],
[ 761.470426007, 'me', "(
~sin2.quant=2;
~sin2.fadeTime=7;
~sin2={
  var sig = LFSaw.ar(432+(4.32*[1,2,4,8,1.5,1.25,1.5,1.55]));
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*14000+50);
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.000015);
};
e.addMix(~sin2,postVol:true);
~sin2.play;
);" ],
[ 767.515395433, 'me', "~ffil.stop(17);" ],
];