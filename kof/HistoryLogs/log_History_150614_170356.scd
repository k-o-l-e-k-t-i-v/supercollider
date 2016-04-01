// History, as it was on Sun Jun 14 17:03:56 2015.

[
[ 0, 'me', "(
~nois.quant=2;
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(1),[40,4000]);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)/4),1);
  Splay.ar(sig.flat,0.25,0.5);
};
~nois.play;
);" ],
[ 6.826632228, 'me', "(
~nois.quant=2;
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(1),[60,4000]);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)/4),1);
  Splay.ar(sig.flat,0.25,0.5);
};
~nois.play;
);" ],
[ 12.018221439, 'me', "(
~nois.quant=2;
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(1),[100,4000]);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)/4),1);
  Splay.ar(sig.flat,0.25,0.5);
};
~nois.play;
);" ],
[ 14.783977232, 'me', "(
~nois.quant=2;
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(1),[120,4000]);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)/4),1);
  Splay.ar(sig.flat,0.25,0.5);
};
~nois.play;
);" ],
[ 17.60219939, 'me', "(
~nois.quant=2;
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(1),[220,4000]);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)/4),1);
  Splay.ar(sig.flat,0.25,0.5);
};
~nois.play;
);" ],
[ 32.037821957, 'me', "(
~nois.quant=2;
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(1),[220,4000]);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)++[0.5]/4),1);
  Splay.ar(sig.flat,0.25,0.5);
};
~nois.play;
);" ],
[ 45.084080735, 'me', "(
~nois.quant=2;
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(0.1),[220,4000]);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)++[0.5]/4),1);
  Splay.ar(sig.flat,0.25,0.5);
};
~nois.play;
);" ],
[ 73.214179572, 'me', "(
~nois.quant=2;
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(0.1),[220,4000]) + SinOsc.ar(70,mul:[0,1]);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)++[0.5]/4),1);
  Splay.ar(sig.flat,0.25,0.5);
};
~nois.play;
);" ],
[ 145.568223786, 'me', "(
~nois.quant=2;
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(0.1),[220,4000]) + SinOsc.ar(70,mul:[0,1]);
  sig = sig * Decay.ar(Impulse.ar(2,(0..3)++[0.5]/4),1);
  Splay.ar(sig.flat,0.25,0.5);
};
~nois.play;
);" ],
[ 158.327043426, 'me', "(
~nois.quant=2;
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(0.2),[220,4000]) + SinOsc.ar(70,mul:[0,1]);
  sig = sig * Decay.ar(Impulse.ar(2,(0..3)++[0.5]/4),1);
  Splay.ar(sig.flat,0.25,0.5);
};
~nois.play;
);" ],
[ 161.695958041, 'me', "(
~nois.quant=2;
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(0.2),[220,14000]) + SinOsc.ar(70,mul:[0,1]);
  sig = sig * Decay.ar(Impulse.ar(2,(0..3)++[0.5]/4),1);
  Splay.ar(sig.flat,0.25,0.5);
};
~nois.play;
);" ],
[ 166.223653869, 'me', "(
~nois.quant=2;
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(0.2),[40,14000]) + SinOsc.ar(70,mul:[0,1]);
  sig = sig * Decay.ar(Impulse.ar(2,(0..3)++[0.5]/4),1);
  Splay.ar(sig.flat,0.25,0.5);
};
~nois.play;
);" ],
[ 179.058967957, 'me', "(
~nois.quant=2;
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(0.2),[40,14000]) + SinOsc.ar([70,60],mul:[0,1]);
  sig = sig * Decay.ar(Impulse.ar(2,(0..3)++[0.5]/4),1);
  Splay.ar(sig.flat,0.25,0.5);
};
~nois.play;
);" ],
[ 186.735417358, 'me', "(
~nois.quant=2;
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(0.2),[400,14000]) + SinOsc.ar([70,60],mul:[0,1]);
  sig = sig * Decay.ar(Impulse.ar(2,(0..3)++[0.5]/4),1);
  Splay.ar(sig.flat,0.25,0.5);
};
~nois.play;
);" ],
[ 193.356199447, 'me', "(
~nois.quant=2;
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(0.2),[800,14000]) + SinOsc.ar([70,60],mul:[0,1]);
  sig = sig * Decay.ar(Impulse.ar(2,(0..3)++[0.5]/4),1);
  Splay.ar(sig.flat,0.25,0.5);
};
~nois.play;
);" ],
[ 203.152707141, 'me', "(
~nois.quant=2;
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(0.2),[800,14000]) + SinOsc.ar([70,60],mul:[0,1]);
  sig = sig * Decay.ar(Impulse.ar(1/4,(0..3)++[0.5]/4),1);
  Splay.ar(sig.flat,0.25,0.5);
};
~nois.play;
);" ],
[ 208.172793674, 'me', "(
~nois.quant=2;
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(0.2),[800,14000]) + SinOsc.ar([70,60],mul:[0,1]);
  sig = sig * Decay.ar(Impulse.ar(1/4,(0..3)++[0.5]/4),4);
  Splay.ar(sig.flat,0.25,0.5);
};
~nois.play;
);" ],
[ 240.545730806, 'me', "(
~nois.quant=2;
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(0.2),[800,14000]);
  sig = CombN.ar(sig,1,1/40,8);
  Splay.ar(sig.flat,0.25,0.5);
};
~nois.play;
);" ],
[ 243.11984585, 'me', "thisProcess.stop;" ],
[ 250.063501281, 'me', "(
~nois.quant=2;
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(0.2),[800,14000]);
  sig = CombN.ar(sig,1,1/[40,20],8);
  Splay.ar(sig.flat,0.25,0.5);
};
~nois.play;
);" ],
[ 266.386523597, 'me', "(
~nois.quant=2;
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(0.2),[800,14000]);
  sig = CombN.ar(sig,1,1/[40,20],8) * LFSaw.ar(1/4/fib(4)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~nois.play;
);" ],
[ 269.749741789, 'me', "(
~nois.quant=2;
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(0.2),[800,14000]);
  sig = CombN.ar(sig,1,1/[40,20,10,5],8) * LFSaw.ar(1/4/fib(4)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~nois.play;
);" ],
[ 279.023787555, 'me', "(
~nois.quant=2;
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(0.2),[800,14000]);
  sig = CombN.ar(sig,1,1/[400,200,10,5],8) * LFSaw.ar(1/4/fib(4)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~nois.play;
);" ],
[ 306.164320447, 'me', "(
~nois.quant=2;
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(0.2),[800,14000]);
  sig = CombN.ar(sig,1,1/[400,200,10,5],8) * LFSaw.ar(1/4/fib(4)).exprange(0.001,1);
  sig = RLPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*4000+40);
  Splay.ar(sig.flat,0.25,0.5);
};
~nois.play;
);" ],
[ 317.461266321, 'me', "(
~nois.quant=2;
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(0.2),[800,14000]);
  sig = CombN.ar(sig,1,1/[400,200,10,5],8) * LFSaw.ar(1/4/fib(4)).exprange(0.001,1);
  sig = RLPF.ar(sig,LFSaw.ar(4).exprange(0.001,1)*4000+40);
  Splay.ar(sig.flat,0.25,0.5);
};
~nois.play;
);" ],
[ 328.81827885, 'me', "(
~nois.quant=2;
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(0.2),[800,14000]);
  sig = CombN.ar(sig,1,1/[400,200,10,5],8) * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = RLPF.ar(sig,LFSaw.ar(4).exprange(0.001,1)*4000+40);
  Splay.ar(sig.flat,0.25,0.5);
};
~nois.play;
);" ],
[ 338.137366239, 'me', "(
~nois.quant=2;
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(0.2),[800,14000]);
  sig = CombN.ar(sig,1,1/[400,200,10,5],1) * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = RLPF.ar(sig,LFSaw.ar(4).exprange(0.001,1)*4000+40);
  Splay.ar(sig.flat,0.25,0.5);
};
~nois.play;
);" ],
[ 346.549437826, 'me', "(
~nois.quant=2;
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(0.2),[800,14000]);
  sig = CombN.ar(sig,1/4,1/[400,200,10,5],1) * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = RLPF.ar(sig,LFSaw.ar(4).exprange(0.001,1)*4000+40);
  Splay.ar(sig.flat,0.25,0.5);
};
~nois.play;
);" ],
[ 352.233763437, 'me', "(
~nois.quant=2;
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(0.2),[800,14000]);
  sig = CombN.ar(sig,1/4,1/[40,200,10,5],1) * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = RLPF.ar(sig,LFSaw.ar(4).exprange(0.001,1)*4000+40);
  Splay.ar(sig.flat,0.25,0.5);
};
~nois.play;
);" ],
[ 353.508916947, 'me', "(
~nois.quant=2;
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(0.2),[800,14000]);
  sig = CombN.ar(sig,1/4,1/[40,20,10,5],1) * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = RLPF.ar(sig,LFSaw.ar(4).exprange(0.001,1)*4000+40);
  Splay.ar(sig.flat,0.25,0.5);
};
~nois.play;
);" ],
[ 355.901876119, 'me', "(
~nois.quant=2;
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(0.2),[800,14000]);
  sig = CombN.ar(sig,1/4,1/[40,20,10,5],1) * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = RLPF.ar(sig,LFSaw.ar(44).exprange(0.001,1)*4000+40);
  Splay.ar(sig.flat,0.25,0.5);
};
~nois.play;
);" ],
[ 367.64960442, 'me', "(
~nois.quant=2;
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(0.2),[800,14000]);
  sig = CombN.ar(sig,1/4,1/[40,20,10,5],1) * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = RLPF.ar(sig,LFSaw.ar(111).exprange(0.001,1)*4000+40);
  Splay.ar(sig.flat,0.25,0.5);
};
~nois.play;
);" ],
[ 374.275184674, 'me', "(
~nois.quant=2;
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(0.2),[800,14000]);
  sig = CombN.ar(sig,1/4,1/[40,20,10,5],1) * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = RLPF.ar(sig,LFSaw.ar(1111).exprange(0.001,1)*4000+40);
  Splay.ar(sig.flat,0.25,0.5);
};
~nois.play;
);" ],
[ 378.633746923, 'me', "(
~nois.quant=2;
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(0.2),[800,14000]);
  sig = CombN.ar(sig,1/4,1/[40,20,10,5],1) * LFSaw.ar(4/[1,2,3,4]).exprange(0.001,1);
  sig = RLPF.ar(sig,LFSaw.ar(1111).exprange(0.001,1)*4000+40);
  Splay.ar(sig.flat,0.25,0.5);
};
~nois.play;
);" ],
[ 390.15985895, 'me', "(
~nois.quant=2;
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(0.8),[800,14000]);
  sig = CombN.ar(sig,1/4,1/[40,20,10,5],1) * LFSaw.ar(4/[1,2,3,4]).exprange(0.001,1);
  sig = RLPF.ar(sig,LFSaw.ar(1111).exprange(0.001,1)*4000+40);
  Splay.ar(sig.flat,0.25,0.5);
};
~nois.play;
);" ],
[ 416.059383594, 'me', "(
~hole.quant=2;
~hole.fadeTime=2;
~hole={
  var high,mid,low;
  var sig = e.ar;
  sig = Greyhole.ar(sig,0.5,0.5,8);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.1);
};
~hole.play;
);" ],
[ 424.823307671, 'me', "(
~hole.quant=2;
~hole.fadeTime=2;
~hole={
  var high,mid,low;
  var sig = e.ar;
  sig = Greyhole.ar(sig,0.5,0.5,8);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.25);
};
~hole.play;
);" ],
[ 448.322615305, 'me', "(
~nois.quant=2;
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(0.8),[800,14000]);
  sig = CombN.ar(sig,1/4,1/LFDNoise1.ar(1!4),1) * LFSaw.ar(4/[1,2,3,4]).exprange(0.001,1);
  sig = RLPF.ar(sig,LFSaw.ar(1111).exprange(0.001,1)*4000+40);
  Splay.ar(sig.flat,0.25,0.5);
};
~nois.play;
);" ],
[ 451.966747866, 'me', "thisProcess.stop;" ],
[ 452.446906851, 'me', "(
~nois.quant=2;
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(0.8),[800,14000]);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1!4),1) * LFSaw.ar(4/[1,2,3,4]).exprange(0.001,1);
  sig = RLPF.ar(sig,LFSaw.ar(1111).exprange(0.001,1)*4000+40);
  Splay.ar(sig.flat,0.25,0.5);
};
~nois.play;
);" ],
[ 458.086430825, 'me', "thisProcess.stop;" ],
[ 458.730149652, 'me', "(
~nois.quant=2;
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(0.8),[800,14000]);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1!4)+0.1,1) * LFSaw.ar(4/[1,2,3,4]).exprange(0.001,1);
  sig = RLPF.ar(sig,LFSaw.ar(1111).exprange(0.001,1)*4000+40);
  Splay.ar(sig.flat,0.25,0.5);
};
~nois.play;
);" ],
[ 461.311565197, 'me', "thisProcess.stop;" ],
[ 465.368926428, 'me', "(
~nois.quant=2;
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(0.8),[800,14000]);
  sig = CombN.ar(sig,1/4,LFDNoise0.ar(1!4)+0.1,1) * LFSaw.ar(4/[1,2,3,4]).exprange(0.001,1);
  sig = RLPF.ar(sig,LFSaw.ar(1111).exprange(0.001,1)*4000+40);
  Splay.ar(sig.flat,0.25,0.5);
};
~nois.play;
);" ],
[ 467.743594783, 'me', "thisProcess.stop;" ],
[ 468.385554369, 'me', "(
~nois.quant=2;
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(0.8),[800,14000]);
  sig = CombN.ar(sig,1/4,LFDNoise0.kr(1!4)+0.1,1) * LFSaw.ar(4/[1,2,3,4]).exprange(0.001,1);
  sig = RLPF.ar(sig,LFSaw.ar(1111).exprange(0.001,1)*4000+40);
  Splay.ar(sig.flat,0.25,0.5);
};
~nois.play;
);" ],
[ 471.618427874, 'me', "thisProcess.stop;" ],
[ 496.309246959, 'me', "(
~nois.quant=2;
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(0.8),[800,14000]);
  sig = CombN.ar(sig,1/4,TExpRand.ar(0.0001,1,Impulse.ar(1!4)),1) * LFSaw.ar(4/[1,2,3,4]).exprange(0.001,1);
  sig = RLPF.ar(sig,LFSaw.ar(1111).exprange(0.001,1)*4000+40);
  Splay.ar(sig.flat,0.25,0.5);
};
~nois.play;
);" ],
[ 506.551422771, 'me', "(
~nois.quant=2;
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(0.8),[800,14000]);
  sig = CombN.ar(sig,1/4,TExpRand.ar(0.0001,1,Impulse.ar(1!4)).lag(1),1) * LFSaw.ar(4/[1,2,3,4]).exprange(0.001,1);
  sig = RLPF.ar(sig,LFSaw.ar(1111).exprange(0.001,1)*4000+40);
  Splay.ar(sig.flat,0.25,0.5);
};
~nois.play;
);" ],
[ 519.253559898, 'me', "(
~hole.quant=2;
~hole.fadeTime=2;
~hole={
  var high,mid,low;
  var sig = e.ar;
  sig = Greyhole.ar(sig,0.5,0.5,8);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.015);
};
~hole.play;
);" ],
[ 548.977549343, 'me', "(
~nois.quant=2;
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(0.8),[800,14000]);
  sig = CombN.ar(sig,1/4,TExpRand.ar(0.0001,1,Impulse.ar(4!4)).lag(1/4),1) * LFSaw.ar(4/[1,2,3,4]).exprange(0.001,1);
  sig = RLPF.ar(sig,LFSaw.ar(1111).exprange(0.001,1)*4000+40);
  Splay.ar(sig.flat,0.25,0.5);
};
~nois.play;
);" ],
[ 553.37094194, 'me', "(
~nois.quant=2;
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(0.8),[800,14000]);
  sig = CombN.ar(sig,1/4,TExpRand.ar(0.0001,1,Impulse.ar(4!4)).lag(1/4),1) * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = RLPF.ar(sig,LFSaw.ar(1111).exprange(0.001,1)*4000+40);
  Splay.ar(sig.flat,0.25,0.5);
};
~nois.play;
);" ],
[ 557.861677639, 'me', "(
~nois.quant=2;
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(0.8),[800,14000]);
  sig = CombN.ar(sig,1/4,TExpRand.ar(0.0001,1,Impulse.ar(1/4!4)).lag(1/4),1) * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = RLPF.ar(sig,LFSaw.ar(1111).exprange(0.001,1)*4000+40);
  Splay.ar(sig.flat,0.25,0.5);
};
~nois.play;
);" ],
[ 567.855946254, 'me', "(
~nois.quant=2;
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(0.8),[800,14000]);
  sig = CombN.ar(sig,1/4,TExpRand.ar(0.0001,1,Impulse.ar(1/4!4)).lag(1/4),1) * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = RLPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*4000+40);
  Splay.ar(sig.flat,0.25,0.5);
};
~nois.play;
);" ],
[ 572.37660324, 'me', "(
~nois.quant=2;
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(0.8),[800,14000]);
  sig = CombN.ar(sig,1/4,TExpRand.ar(0.0001,1,Impulse.ar(1/4!4)).lag(1/4),1) * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = RLPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*14000+40);
  Splay.ar(sig.flat,0.25,0.5);
};
~nois.play;
);" ],
[ 588.182966318, 'me', "(
~nois.fadeTime=2;
~nois={
  var sig = BPF.ar(WhiteNoise.ar(0.8),[800,14000]);
  sig = CombN.ar(sig,1/4,TExpRand.ar(0.0001,1,Impulse.ar(4!4)).lag(1/4),1) * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = RLPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*14000+40);
  S