// History, as it was on Sun Jun 14 17:27:48 2015.

[
[ 0, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=2;
~poiu={
  var sig = SinOsc.ar(4320/([1,2,4,8]*pi),mul:0.2);
  sig = sig * SinOsc.ar(1/fib(8)).exprange(0.0001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~poiu.play;
);" ],
[ 46.784608306, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=2;
~poiu={
  var sig = SinOsc.ar([60,65].midicps/((1/[1,2,4,8]+1)*pi),mul:0.2);
  sig = sig * SinOsc.ar(1/fib(8)).exprange(0.0001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~poiu.play;
);" ],
[ 57.51445472, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=2;
~poiu={
  var sig = SinOsc.ar([60,65].midicps*2/((1/[1,2,4,8]+1)*pi),mul:0.2);
  sig = sig * SinOsc.ar(1/fib(8)).exprange(0.0001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~poiu.play;
);" ],
[ 61.56316484, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=2;
~poiu={
  var sig = SinOsc.ar([60,65].midicps*4/((1/[1,2,4,8]+1)*pi),mul:0.2);
  sig = sig * SinOsc.ar(1/fib(8)).exprange(0.0001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~poiu.play;
);" ],
[ 72.134266895, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=2;
~poiu={
  var sig = SinOsc.ar([60,63].midicps*4/((1/[1,2,4,8]+1)*pi),mul:0.2);
  sig = sig * SinOsc.ar(1/fib(8)).exprange(0.0001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~poiu.play;
);" ],
[ 79.771162085, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=2;
~poiu={
  var sig = SinOsc.ar([60,63,65,67].midicps*4/((1/[1,2,4,8]+1)*pi),mul:0.2);
  sig = sig * SinOsc.ar(1/fib(8)).exprange(0.0001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~poiu.play;
);" ],
[ 90.886105718, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=2;
~poiu={
  var sig = SinOsc.ar([60,63,65,67].midicps*4/((1/[1,2,4,8]+1)*pi),mul:0.5);
  sig = sig * SinOsc.ar(1/fib(8)).exprange(0.0001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~poiu.play;
);" ],
[ 111.819573416, 'me', "(
~fil.quant=2;
~fil.fadeTime=2;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.5);
};
~fil.play;
);" ],
[ 125.659451274, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = SinOsc.ar([60,63,65,67].midicps*2/((1/[1,2,4,8]+1)*pi),mul:0.5);
  sig = sig * SinOsc.ar(1/fib(8)).exprange(0.0001,1);
  
  Splay.ar(sig.flat,0.25,0.5);
};
~poiu.play;
);" ],
[ 139.960676415, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = SinOsc.ar([60,63,65,67].midicps*4*1.5/((1/[1,2,4,8]+1)*pi),mul:0.5);
  sig = sig * SinOsc.ar(1/fib(8)).exprange(0.0001,1);
  
  Splay.ar(sig.flat,0.25,0.5);
};
~poiu.play;
);" ],
[ 144.467893187, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = SinOsc.ar([60,63,65,67].midicps*4*1.25/((1/[1,2,4,8]+1)*pi),mul:0.5);
  sig = sig * SinOsc.ar(1/fib(8)).exprange(0.0001,1);
  
  Splay.ar(sig.flat,0.25,0.5);
};
~poiu.play;
);" ],
[ 149.765100673, 'me', "(
~fil.quant=2;
~fil.fadeTime=2;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.25);
};
~fil.play;
);" ],
[ 174.163157379, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar([60,63,65,67].midicps*4*1.25/((1/[1,2,4,8]+1)*pi),mul:0.5);
  sig = Resonz.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+100) * SinOsc.ar(1/fib(8)).exprange(0.0001,1);
  
  Splay.ar(sig.flat,0.25,0.5);
};
~poiu.play;
);" ],
[ 183.0203669, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar([60,63,65,67].midicps*4*1.25/((1/[1,2,4,8]+1)*pi),mul:0.5);
  sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*10000+100) * SinOsc.ar(1/fib(8)).exprange(0.0001,1);
  
  Splay.ar(sig.flat,0.25,0.5);
};
~poiu.play;
);" ],
[ 204.725241538, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar([60,63,65,67].midicps*4*1.25/((1/[1,2,4,8]+1)*pi),mul:0.5);
  sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*1000+100) * SinOsc.ar(1/fib(8)).exprange(0.0001,1);
  
};
~poiu.play;
);" ],
[ 214.061398119, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar([60,63,65,67].midicps*4*1.5/((1/[1,2,4,8]+1)*pi),mul:0.5);
  sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*1000+100) * SinOsc.ar(1/fib(8)).exprange(0.0001,1);
  
  Splay.ar(sig.flat,0.25,0.5);
};
~poiu.play;
);" ],
[ 218.410326275, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar([60,63,65,67].midicps*4*1/((1/[1,2,4,8]+1)*pi),mul:0.5);
  sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*1000+100) * SinOsc.ar(1/fib(8)).exprange(0.0001,1);
  
  Splay.ar(sig.flat,0.25,0.5);
};
~poiu.play;
);" ],
[ 226.486004556, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar([60,63,65,67].midicps*2*1/((1/[1,2,4,8]+1)*pi),mul:0.5);
  sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*1000+100) * SinOsc.ar(1/fib(8)).exprange(0.0001,1);
  
  Splay.ar(sig.flat,0.25,0.5);
};
~poiu.play;
);" ],
[ 237.346630731, 'me', "(
~fil.quant=2;
~fil.fadeTime=2;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.25);
};
~fil.play;
);" ],
[ 249.975022088, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar([60,63,65,67].midicps*[1,2,4]*1/((1/[1,2,4,8]+1)*pi),mul:0.5);
  sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*1000+100) * SinOsc.ar(1/fib(8)).exprange(0.0001,1);
  
  Splay.ar(sig.flat,0.25,0.5);
};
~poiu.play;
);" ],
[ 260.85208587, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar([60,63,65,67].midicps*[1,2,4]*[1,1.5]/((1/[1,2,4,8]+1)*pi),mul:0.5);
  sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*1000+100) * SinOsc.ar(1/fib(8)).exprange(0.0001,1);
  
  Splay.ar(sig.flat,0.25,0.5);
};
~poiu.play;
);" ],
[ 265.517568935, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar([60,63,65,67].midicps*[1,2,4]*[1,1.5,1.25,1.125]/((1/[1,2,4,8]+1)*pi),mul:0.5);
  sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*1000+100) * SinOsc.ar(1/fib(8)).exprange(0.0001,1);
  
  Splay.ar(sig.flat,0.25,0.5);
};
~poiu.play;
);" ],
[ 285.410957078, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar([60,63,65,67].midicps*[1,2,4]*[1,1.5,1.25,1.125]/((1/[1,2,4,8]+1)*pi),mul:0.5);
  sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*2000+100) * SinOsc.ar(1/fib(8)).exprange(0.0001,1);
  
  Splay.ar(sig.flat,0.25,0.5);
};
~poiu.play;
);" ],
[ 298.243426394, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar([60,63,65,67].midicps*[1,2,4]*[1,1.5,1.25,1.125]/((1/[1,2,4,8]+1)*pi),mul:0.5);
  sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*2000+100) * SinOsc.ar(1/fib(8)).exprange(0.0001,1);
  sig = sig * LFPulse.ar(4);
  Splay.ar(sig.flat,0.25,0.5);
};
~poiu.play;
);" ],
[ 312.397047488, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar([60,63,65,67].midicps*[1,2,4]*[1,1.5,1.25,1.125]/((1/[1,2,4,8]+1)*pi),mul:0.5);
  sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*2000+100) * SinOsc.ar(1/fib(8)).exprange(0.0001,1);
  sig = sig * LFPulse.ar(8);

  Splay.ar(sig.flat,0.25,0.5);
};
~poiu.play;
);" ],
[ 327.249268476, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar([60,63,65,67].midicps*[1,2,4]*[1,1.5,1.25,1.125]/((1/[1,2,4,8]+1)*pi),mul:0.5);
  sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*2000+100) * SinOsc.ar(1/fib(8)).exprange(0.0001,1);
  sig = sig * LFPulse.ar(50);

  Splay.ar(sig.flat,0.25,0.5);
};
~poiu.play;
);" ],
[ 335.434100148, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar([60,63,65,67].midicps*[1,2,4]*[1,1.5,1.25,1.125]/((1/[1,2,4,8]+1)*pi),mul:0.5);
  sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*2000+100) * SinOsc.ar(1/fib(8)).exprange(0.0001,1);
  sig = sig * LFPulse.ar(1/fib(8));

  Splay.ar(sig.flat,0.25,0.5);
};
~poiu.play;
);" ],
[ 349.290685395, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar([60,63,65,67].midicps*[1,2,4]*[1,1.5,1.25,1.125]/((1/[1,2,4,8]+1)*pi),mul:0.5);
  sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*2000+100) * SinOsc.ar(1/fib(8)).exprange(0.0001,1);
  sig = sig * LFPulse.ar(1/fib(8));
  sig = sig * Pulse.ar(4/fib(4));

  Splay.ar(sig.flat,0.25,0.5);
};
~poiu.play;
);" ],
[ 363.925561849, 'me', "(
~fil.quant=2;
~fil.fadeTime=2;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.15);
};
~fil.play;
);" ],
[ 372.533653186, 'me', "(
~fil.quant=2;
~fil.fadeTime=2;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.15);
};
~fil.play;
);" ],
[ 387.084527872, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar([60,63,65,67].midicps*4*[1,1.5,1.25,1.125]/((1/[1,2,4,8]+1)*pi),mul:0.5);
  sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*2000+100) * SinOsc.ar(1/fib(8)).exprange(0.0001,1);
  sig = sig * LFPulse.ar(1/fib(8));
  sig = sig * Pulse.ar(4/fib(4));

  Splay.ar(sig.flat,0.25,0.5);
};
~poiu.play;
);" ],
[ 417.507195557, 'me', "(
~poiy.quant=2;
~poiy.fadeTime=2;
~poiy={
    var sig = LFSaw.ar([60,63,65,67].midicps*2*[1,1.5,1.25,1.125]/((1/[1,2,4,8]+1)*pi),mul:0.5);
  sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*2000+100) * SinOsc.ar(1/fib(8)).exprange(0.0001,1);
  sig = sig * LFPulse.ar(1/fib(8));
  sig = sig * Pulse.ar(4/fib(4));

  Splay.ar(sig.flat,0.25,0.5);
};
~poiy.play;
);" ],
[ 457.244710587, 'me', "(
~popo.quant=2;
~popo.fadeTime=2;
~popo={
    var sig = LFSaw.ar([60,63,65,67].midicps*8*[1,1.5,1.25,1.125]/((1/[1,2,4,8]+1)*pi),mul:0.5);
  sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*2000+100) * SinOsc.ar(1/fib(8)).exprange(0.0001,1);
  sig = sig * LFPulse.ar(2/fib(8));
  sig = sig * Pulse.ar(2/fib(4));
  Splay.ar(sig.flat,0.25,0.15);
};
~popo.play;
);" ],
[ 471.811518886, 'me', "(
~fil.quant=2;
~fil.fadeTime=2;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),1/2,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.15);
};
~fil.play;
);" ],
[ 478.318349405, 'me', "(
~fil.quant=2;
~fil.fadeTime=2;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),1/2,1/3,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.15);
};
~fil.play;
);" ],
[ 494.88496529, 'me', "(
~fil.quant=2;
~fil.fadeTime=2;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/4,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.15);
};
~fil.play;
);" ],
[ 498.800983602, 'me', "(
~fil.quant=2;
~fil.fadeTime=2;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/4,1/4);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.15);
};
~fil.play;
);" ],
[ 501.39736843, 'me', "(
~fil.quant=2;
~fil.fadeTime=2;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/4);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/4,1/4);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.15);
};
~fil.play;
);" ],
[ 505.737609661, 'me', "(
~fil.quant=2;
~fil.fadeTime=2;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/4,1/4);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/4,1/4);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.15);
};
~fil.play;
);" ],
[ 510.514440845, 'me', "(
~fil.quant=2;
~fil.fadeTime=2;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/4,1/4);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/3,1/3);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/4,1/4);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.15);
};
~fil.play;
);" ],
[ 530.128919964, 'me', "(
~fil.quant=2;
~fil.fadeTime=2;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/4,1/4);
  mid = CompanderD.ar(BPF.ar(sig,10000*LFSaw.ar(1/4).exprange(0.001,1) + 1000,2),4/3,1/3,1/3);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/4,1/4);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.15);
};
~fil.play;
);" ],
[ 542.73543513, 'me', "(
~fil.quant=2;
~fil.fadeTime=2;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,[10,11]);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/4,1/4);
  mid = CompanderD.ar(BPF.ar(sig,10000*LFSaw.ar(1/4).exprange(0.001,1) + 1000,2),4/3,1/3,1/3);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/4,1/4);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.15);
};
~fil.play;
);" ],
[ 556.406526628, 'me', "(
~fil.quant=2;
~fil.fadeTime=2;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,[10,11]*2);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/4,1/4);
  mid = CompanderD.ar(BPF.ar(sig,10000*LFSaw.ar(1/4).exprange(0.001,1) + 1000,2),4/3,1/3,1/3);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/4,1/4);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.15);
};
~fil.play;
);" ],
[ 567.456517121, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,[10,11]*2);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/4,1/4);
  mid = CompanderD.ar(BPF.ar(sig,10000*LFSaw.ar(1/4).exprange(0.001,1) + 1000,2),4/3,1/3,1/3);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.15);
};
~fil.play;
);" ],
[ 695.575472158, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,[10,11]*2);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/4,1/4);
  mid = CompanderD.ar(BPF.ar(sig,10000*LFSaw.ar(1/4).exprange(0.001,1) + 1000,2),4/3,1/3,1/3);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.00015);
};
~fil.play;
);" ],
[ 705.863100008, 'me', "(
~popo.quant=2;
~popo.fadeTime=2;
~popo={
    var sig = LFSaw.ar([60,63,65,67].midicps*8*[1,1.5,1.25,1.125]/((1/[1,2,4,8]+1)*pi),mul:0.5);
  sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*2000+100) * SinOsc.ar(1/fib(8)).exprange(0.0001,1);
  sig = sig * LFPulse.ar(2/fib(8));
  sig = sig * Pulse