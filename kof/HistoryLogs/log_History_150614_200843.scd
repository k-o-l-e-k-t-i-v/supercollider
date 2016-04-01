// History, as it was on Sun Jun 14 20:08:43 2015.

[
[ 0, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = LFSaw.ar(50!2);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 33.587648672, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = LFSaw.ar(50!2);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 97.678173027, 'me', "thisProcess.stop;" ],
[ 137.273852578, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = LFSaw.ar(50!2);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 162.075499787, 'me', "thisProcess.stop;" ],
[ 185.203541112, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.1);
};
~test.play;
);" ],
[ 186.267108715, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = LFSaw.ar(50!2);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 205.918980177, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = LFSaw.ar(50*[1,2,4,8]);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 209.688759709, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = LFSaw.ar(50*[1,2,4,8]);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 236.713078536, 'me', "thisProcess.stop;" ],
[ 299.677390231, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar(60+(1..8));
  sig = sig * Pulse.ar(2);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 309.607611172, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar(60+(1..8));
  sig = sig * Pulse.ar(4);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 314.119006413, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar(60+(1..8));
  sig = sig * Pulse.ar(4/fib(8));
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 332.346616303, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar(70+(1..8));
  sig = sig * Pulse.ar(4/fib(8));
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 344.36448627, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar(70*[1.5,1]+(1..8));
  sig = sig * Pulse.ar(4/fib(8));
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 346.738389468, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar(70*[1.5,1]+(1..8));
  sig = sig * Pulse.ar(2/fib(8));
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 349.25705469, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.1);
};
~test.play;
);" ],
[ 354.017057611, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar(70*[1.5,1]+(1..8));
  sig = sig * Pulse.ar(2/fib(8));
  Splay.ar(sig.flat,0.25,0.15);
};
~test.play;
);" ],
[ 359.832756065, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.4);
};
~test.play;
);" ],
[ 368.108024515, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.14);
};
~test.play;
);" ],
[ 378.074473847, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar(70*[1.5,1]+(1..8));
  sig = sig * Pulse.ar(4/fib(8));
  Splay.ar(sig.flat,0.25,0.15);
};
~test.play;
);" ],
[ 381.17925242, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar(70*[1.5,1]+(1..8));
  sig = sig * Pulse.ar(4/fib(8));
  Splay.ar(sig.flat,0.25,0.35);
};
~test.play;
);" ],
[ 394.638287442, 'me', "~test.stop(7);" ],
[ 396.313252886, 'me', "~test.stop(7);" ],
[ 437.477416027, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar(70*[1.5,1]+(1..8));
  sig = sig * Pulse.ar(1/fib(8));
  Splay.ar(sig.flat,0.25,0.35);
};
~test.play;
);" ],
[ 450.479453606, 'me', "thisProcess.stop;" ],
[ 522.368485378, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar(70*[1.5,1]+(1..8));
  sig = sig * Pulse.ar(4/fib(8));
  Splay.ar(sig.flat,0.25,0.35);
};
~test.play;
);" ],
[ 533.904792653, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar(70*[1.5,1]+(1..8));
  sig = sig * Pulse.ar(4/fib(8));
  Splay.ar(sig.flat,0.25,0.15);
};
~test.play;
);" ],
[ 542.736153742, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.14);
};
~test.play;
);" ],
[ 555.706220857, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar(70*[1.5,1]+(1..8));
  sig = sig * Pulse.ar(2/fib(8));
  Splay.ar(sig.flat,0.25,0.15);
};
~test.play;
);" ],
[ 577.994226006, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar(70*[1.5,1]+(1..8));
  sig = sig * Pulse.ar(1/fib(8));
  Splay.ar(sig.flat,0.25,0.15);
};
~test.play;
);" ],
[ 585.945474353, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar(70*[1.5,1]+(1..8));
  sig = sig * Pulse.ar(2/fib(8));
  Splay.ar(sig.flat,0.25,0.15);
};
~test.play;
);" ],
[ 635.927644687, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = LFSaw.ar(500*[1,1.5],mul:0.2);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 639.51883696, 'me', "~test.stop(7);" ],
[ 646.753808411, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar(70*[1.5,1]+(1..8));
  sig = sig * Pulse.ar(2/fib(8));
  Splay.ar(sig.flat,0.25,0.00015);
};
~test.play;
);" ],
[ 656.043323384, 'me', "thisProcess.stop;" ],
[ 656.265491036, 'me', "thisProcess.stop;" ],
[ 747.860253904, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = LFSaw.ar([60,63,65,72]/([1,1.5]*pi),mul:0.2);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.15);
};
~test.play;
);" ],
[ 767.93244257, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = LFSaw.ar([60,63,65,72]/([1,1.5,1.25]*pi),mul:0.2);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.15);
};
~test.play;
);" ],
[ 779.285374731, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = LFSaw.ar([60,63,65,72].midicps/([1,1.5,1.25,2]*pi),mul:0.2);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.15);
};
~test.play;
);" ],
[ 800.612981903, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = LFSaw.ar([60,63,65,72].midicps*2/([1,1.5,1.25,2]*pi),mul:0.2);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.15);
};
~test.play;
);" ],
[ 806.055201166, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = LFSaw.ar([60,63,65,72].midicps*4/([1,1.5,1.25,2]*pi),mul:0.2);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
};
~test.play;
);" ],
[ 812.127707445, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = LFSaw.ar([60,63,65,72].midicps*4/([1,1.5,1.25,2]*pi),mul:0.2);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 822.392207203, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63,65,72].midicps*4/([1,1.5,1.25,2]*pi),mul:0.2);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 835.488806743, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.24);
};
~test.play;
);" ],
[ 839.342851559, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar(70*[1.5,1]+(1..8));
  sig = sig * Pulse.ar(2/fib(8));
  Splay.ar(sig.flat,0.25,0.00015);
};
~test.play;
);" ],
[ 849.268532468, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63,65,72].midicps*2/([1,1.5,1.25,2]*pi),mul:0.2);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 886.860754488, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63,65,72].midicps*2*1.5/([1,1.5,1.25,2]*pi),mul:0.2);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 894.693361201, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63,65,72].midicps*2*1.25/([1,1.5,1.25,2]*pi),mul:0.2);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 901.659899482, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63,65,72].midicps*4*1.25/([1,1.5,1.25,2]*pi),mul:0.2);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 906.759427074, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63,65,72].midicps*4*1.25/([1,1.5,1.25,2]*pi),mul:0.5);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 923.863663635, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63,65,72].midicps*4*1.25/([1,1.5,1.25,2]*pi),mul:0.75);

  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 932.203085077, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63,65,72].midicps*4*1.5/([1,1.5,1.25,2]*pi),mul:0.75);

  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 941.919897371, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63,65,72].midicps*4*1.25/([1,1.5,1.25,2]*pi),mul:0.75);

  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 955.990601795, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63,65,72].midicps*4*1.5/([1,1.5,1.25,2]*pi),mul:0.75);

  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 966.089196422, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63,65,72].midicps*4*1.125/([1,1.5,1.25,2]*pi),mul:0.75);

  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 976.680990657, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63,65,72].midicps*4*1.25/([1,1.5,1.25,2]*pi),mul:0.75);

  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 988.001105258, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63,65,72].midicps*4*1.25/([1,1.5,1.25,2]*pi),mul:0.5);

  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 993.330531831, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63,65,72].midicps*[2,4]*1.25/([1,1.5,1.25,2]*pi),mul:0.5);

  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 1002.910883139, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63,65,72].midicps*[1,2,4]*1.25/([1,1.5,1.25,2]*pi),mul:0.5);

  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 1005.304486958, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63,65,72].midicps*[1,2,4,8]*1.25/([1,1.5,1.25,2]*pi),mul:0.5);

  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 1018.316116823, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63,65,72].midicps*[1,2,4,8]*1.25/([1,1.5,1.25,2]*0.5pi),mul:0.5);

  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 1025.580586958, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63,65,72].midicps*[1,2,4,8]*1.25/([1,1.5,1.25,2]*0.75pi),mul:0.5);

  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 1029.217823356, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63,65,72].midicps*[1,2,4,8]*1.25/([1,1.5,1.25,2]*0.5pi),mul:0.5);

  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 1035.370509273, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63,65,72].midicps*[1,2,4,8]*1.25/([1,1.5,1.25,2]*0.5pi),mul:0.75);

  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 1046.59383348, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63,65,72].midicps*[1,2,4,8]*1.5/([1,1.5,1.25,2]*0.5pi),mul:0.75);

  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 1049.818257689, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63,65,72].midicps*[1,2,4,8]*1/([1,1.5,1.25,2]*0.5pi),mul:0.75);

  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 1059.949676975, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63,64,72].midicps*[1,2,4,8]*1/([1,1.5,1.25,2]*0.5pi),mul:0.75);

  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 1066.61969709, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63,65,72].midicps*[1,2,4,8]*1/([1,1.5,1.25,2]*0.5pi),mul:0.75);

  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 1070.746078285, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63,65,72].midicps*[1,2,4,8]*1/([1,1.5,1.25,2]*0.25pi),mul:0.75);

  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 1073.490177356, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63,65,72].midicps*[1,2,4,8]*1/([1,1.5,1.25,2]*0.25pi),mul:0.5);

  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 1083.969874828, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63,65,72].midicps*[1,2,4,8]*1/([1,1.5,1.25,2]*0.25pi),mul:0.5);

  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.0005);
};
~test.play;
);" ],
[ 1097.672395713, 'me', "~test.stop(7);" ],
[ 1139.84649154, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.24);
};
~test.play;
);" ],
[ 1141.218385146, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = WhiteNoise.ar(0.01!2);
  sig = sig * Pulse.ar(4/fib(8));
  Splay.ar(sig.flat,0.25,0.15);
};
~test.play;
);" ],
[ 1189.274606663, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = WhiteNoise.ar(0.01!2);
  sig = CombN.ar(sig,1,MouseX.kr(0.001,0.2),2);
  sig = sig * Pulse.ar(4/fib(8));
  Splay.ar(sig.flat,0.25,0.15);
};
~test.play;
);" ],
[ 1218.754437068, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = HPF.ar(WhiteNoise.ar(0.01!2),4000);
  sig = CombN.ar(sig,1,MouseX.kr(0.001,0.2),2);
  sig = sig * Pulse.ar(4/fib(8));
  Splay.ar(sig.flat,0.25,0.15);
};
~test.play;
);" ],
[ 1223.773380634, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.4);
};
~test.play;
);" ],
[ 1229.286025326, 'me', "thisProcess.stop;" ],
[ 1251.746403223, 'me', "thisProcess.stop;" ],
[ 1253.108597911, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = HPF.ar(WhiteNoise.ar(0.01!2),4000);
  sig = CombN.ar(sig,1,MouseX.kr(0.001,0.2),2);
  sig = sig * Pulse.ar(4/fib(8));
  Splay.ar(sig.flat,0.25,0.15);
};
~test.play;
);" ],
[ 1343.765725332, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = HPF.ar(WhiteNoise.ar(0.01!2),4000);
  sig = CombN.ar(sig,1,MouseX.kr(0.001,0.2),2);
  sig = sig * Pulse.ar(4/fib(8));
  Splay.ar(sig.flat,0.25,0.15);
};
~test.play;
);" ],
[ 1348.06115826, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = HPF.ar(WhiteNoise.ar(0.01!2),4000);
  sig = CombN.ar(sig,1,MouseX.kr(0.0001,0.2),2);
  sig = sig * Pulse.ar(4/fib(8));
  Splay.ar(sig.flat,0.25,0.15);
};
~test.play;
);" ],
[ 1366.399971272, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.14);
};
~test.play;
);" ],
[ 1373.163523477, 'me', "thisProcess.stop;" ],
[ 1388.509981931, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63,65,72].midicps*1/([1,1.5,1.25,2]*0.25pi),mul:0.25);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.0005);
};
~test.play;
);" ],
[ 1394.846099277, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63,65,72].midicps*1/([1,1.5,1.25,2]*0.25pi),mul:0.25);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.005);
};
~test.play;
);" ],
[ 1396.954876191, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63,65,72].midicps*1/([1,1.5,1.25,2]*0.25pi),mul:0.25);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.05);
};
~test.play;
);" ],
[ 1506.631572049, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63,65-12,72].midicps/([1,1.5,1.25,2]*0.25pi),mul:0.25);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.005);
};
~test.play;
);" ],
[ 1517.6271943, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63-12,65-12,72].midicps/([1,1.5,1.25,2]*0.25pi),mul:0.25);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.005);
};
~test.play;
);" ],
[ 1522.897165221, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63-12,65-12,72].midicps*2/([1,1.5,1.25,2]*0.25pi),mul:0.25);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.005);
};
~test.play;
);" ],
[ 1558.884019216, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63-12,65-12,72].midicps*2/([1,1.5,1.25,2]*0.25pi),mul:0.25);
  sig = Resonz.ar(sig,MouseX.kr(0,1)*14000+50);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.005);
};
~test.play;
);" ],
[ 1594.810952333, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63-12,65-12,72].midicps*2/([1,1.5,1.25,2]*0.25pi),mul:0.25);
  sig = Resonz.ar(sig,MouseX.kr(0,1)*14000+50) + BPF.ar(sig,MouseY.kr(0,1)*14000+50);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.005);
};
~test.play;
);" ],
[ 1606.723685404, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63-12,65-12,72].midicps*2/([1,1.5,1.25,2]*0.25pi),mul:0.25);
  sig = Resonz.ar(sig,MouseX.kr(0,1)*14000+50) + BPF.ar(sig,MouseY.kr(0,1)*14000+50);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.05);
};
~test.play;
);" ],
[ 1634.320245881, 'me', "(
~test.quant=2;
~test={
  var sig = SinOsc.ar([60,63-12,65-12,72].midicps*2/([1,1.5,1.25,2]*0.25pi),mul:0.25);
  sig = Resonz.ar(sig,MouseX.kr(0,1)*14000+50) + BPF.ar(sig,MouseY.kr(0,1)*14000+50);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.45);
};
~test.play;
);" ],
[ 1660.620052098, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63-12,65-12,72].midicps*2/([1,1.5,1.25,2]*0.25pi),mul:0.25);
  sig = Resonz.ar(sig,MouseX.kr(0,1)*14000+50) + BPF.ar(sig,MouseY.kr(0,1)*14000+50);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.75);
};
~test.play;
);" ],
[ 1676.528060876, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63-12,65-12,72].midicps*2/([1,1.5,1.25,2]*0.25pi),mul:0.25);
  sig = Resonz.ar(sig,MouseX.kr(0,1)*14000+50) + BPF.ar(sig,MouseY.kr(0,1)*14000+50);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 1690.110156262, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63+12,65-12,72].midicps*2/([1,1.5,1.25,2]*0.25pi),mul:0.25);
  sig = Resonz.ar(sig,MouseX.kr(0,1)*14000+50) + BPF.ar(sig,MouseY.kr(0,1)*14000+50);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 1692.854874035, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63+12,65+12,72].midicps*2/([1,1.5,1.25,2]*0.25pi),mul:0.25);
  sig = Resonz.ar(sig,MouseX.kr(0,1)*14000+50) + BPF.ar(sig,MouseY.kr(0,1)*14000+50);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 1724.348644457, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63+12,65+24,72].midicps*2/([1,1.5,1.25,2]*0.25pi),mul:0.25);
  sig = Resonz.ar(sig,MouseX.kr(0,1)*14000+50) + BPF.ar(sig,MouseY.kr(0,1)*14000+50);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 1730.403927778, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63+12,65+24,72].midicps*2/([1,1.5,1.25,2].scramble*0.25pi),mul:0.25);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 1733.481281519, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63+12,65+24,72].midicps*2/([1,1.5,1.25,2].scramble*0.5pi),mul:0.25);
  sig = Resonz.ar(sig,MouseX.kr(0,1)*14000+50) + BPF.ar(sig,MouseY.kr(0,1)*14000+50);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 1773.386603206, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63+12,65+24,72].midicps*2/([1,1.5,1.25,2].scramble*0.75pi),mul:0.25);
  sig = Resonz.ar(sig,MouseX.kr(0,1)*14000+50) + BPF.ar(sig,MouseY.kr(0,1)*14000+50);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 1779.23471863, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63+12,65+24,72].midicps*2/([1,1.5,1.25,2].scramble*0.5pi),mul:0.25);
  sig = Resonz.ar(sig,MouseX.kr(0,1)*14000+50) + BPF.ar(sig,MouseY.kr(0,1)*14000+50);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 1795.131330202, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = HPF.ar(WhiteNoise.ar(0.01!2),4000);
  sig = CombN.ar(sig,1,MouseX.kr(0.0001,0.2),2);
  sig = sig * Pulse.ar(4/fib(8));
  Splay.ar(sig.flat,0.25,0.15);
};
~test.play;
);" ],
[ 1807.615834082, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = HPF.ar(WhiteNoise.ar(0.01!2),4000);
  sig = CombN.ar(sig,1,MouseX.kr(0.0001,0.2),2);
  sig = sig * Pulse.ar(4/fib(8));
  Splay.ar(sig.flat,0.25,0.015);
};
~test.play;
);" ],
[ 1808.759614816, 'me', "thisProcess.stop;" ],
[ 1811.925151398, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63+12,65+24,72].midicps*2/([1,1.5,1.25,2].scramble*0.5pi),mul:0.25);
  sig = Resonz.ar(sig,MouseX.kr(0,1)*14000+50) + BPF.ar(sig,MouseY.kr(0,1)*14000+50);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 1887.873950811, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63+12,65+24,72].midicps*4/([1,1.5,1.25,2].scramble*0.5pi),mul:0.25);
  sig = Resonz.ar(sig,MouseX.kr(0,1)*14000+50) + BPF.ar(sig,MouseY.kr(0,1)*14000+50);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 1930.324405795, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.24);
};
~test.play;
);" ],
[ 1934.528663717, 'me', "thisProcess.stop;" ],
[ 1938.453526412, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63+12,65+24,72].midicps*4/([1,1.5,1.25,2].scramble*0.5pi),mul:0.25);
  sig = Resonz.ar(sig,MouseX.kr(0,1)*14000+50) + BPF.ar(sig,MouseY.kr(0,1)*14000+50);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
);" ],
[ 1969.166764273, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63+12,65+24,72].midicps*4/([1,1.5,1.25,2].scramble*0.5pi),mul:0.25);
  sig = Resonz.ar(sig,MouseX.kr(0,1)*14000+50) + BPF.ar(sig,MouseY.kr(0,1)*14000+50);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.005);
};
~test.play;
);" ],
[ 1996.248676103, 'me', "(
~anotherOne.quant=2;
~anotherOne.fadeTime=5;
~anotherOne={
  var sig = LFSaw.ar(50!2);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~anotherOne.play;
);" ],
[ 2013.578285046, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.14);
};
~test.play;
);" ],
[ 2018.504023682, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = LFSaw.ar(50!2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~hiss.play;
);" ],
[ 2028.996800688, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.014);
};
~test.play;
);" ],
[ 2035.552346328, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.0014);
};
~test.play;
);" ],
[ 2047.561282185, 'me', "(
~anotherOne.quant=2;
~anotherOne.fadeTime=5;
~anotherOne={
  var sig = LFSaw.ar(50!2);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.0005);
};
~anotherOne.play;
);" ],
[ 2054.019007449, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63+12,65+24,72].midicps*4/([1,1.5,1.25,2].scramble*0.5pi),mul:0.25);
  sig = Resonz.ar(sig,MouseX.kr(0,1)*14000+50) + BPF.ar(sig,MouseY.kr(0,1)*14000+50);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.005);
};
~test.play;
);" ],
[ 2058.815912484, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = HPF.ar(WhiteNoise.ar(0.01!2),4000);
  sig = CombN.ar(sig,1,MouseX.kr(0.0001,0.2),2);
  sig = sig * Pulse.ar(4/fib(8));
  Splay.ar(sig.flat,0.25,0.00015);
};
~test.play;
);" ],
[ 2106.180786692, 'me', "thisProcess.stop;" ],
[ 2117.376464591, 'me', "(
~anotherOne.quant=2;
~anotherOne.fadeTime=5;
~anotherOne={
  var sig = LFSaw.ar(50!2);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.0005);
};
~anotherOne.play;
);" ],
[ 2134.000675724, 'me', "thisProcess.stop;" ],
[ 2144.234528039, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar([60,63+12,65+24,72].midicps*4/([1,1.5,1.25,2].scramble*0.5pi),mul:0.25);
  sig = Resonz.ar(sig,MouseX.kr(0,1)*14000+50) + BPF.ar(sig,MouseY.kr(0,1)*14000+50);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(s