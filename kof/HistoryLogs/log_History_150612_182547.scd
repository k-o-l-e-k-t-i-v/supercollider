// History, as it was on Fri Jun 12 18:25:47 2015.

[
[ 0, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 40.065900401, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  sig = BPF.ar(sig,50+SinOsc.kr(1).range(-5,5));
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 49.100395925, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  sig = BPF.ar(sig,50+SinOsc.kr(1).range(-5,500));
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 68.680888453, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  sig = BPF.ar(sig,50+SinOsc.kr(1).range(-5,500));
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 76.470840381, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2);
  sig = sig * LFSaw.ar(4).exprange(0.001,1);
  sig = BPF.ar(sig,50+SinOsc.kr(1).range(-5,500));
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 195.292273351, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2);
  sig = sig * (1-LFSaw.ar(4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(2).range(-5,5000));
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 208.725372838, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2);
  sig = sig * (1-LFSaw.ar(4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).range(-5,5000));
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 224.977345306, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2);
  sig = sig * (1-LFSaw.ar(4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,5000));
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 251.799899287, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2);
  sig = sig * (1-LFSaw.ar(4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,5000));
  sig = sig + (SinOsc.ar(75,mul:0.2)*Pulse.ar(2));
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 262.736876967, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2);
  sig = sig * (1-LFSaw.ar(4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,5000));
  sig = sig + (SinOsc.ar(90,mul:0.2)*Pulse.ar(2));
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 269.742705689, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2);
  sig = sig * (1-LFSaw.ar(4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,5000));
  sig = sig + (SinOsc.ar(90,mul:0.2)*Pulse.ar(1));
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 278.844462293, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2);
  sig = sig * (1-LFSaw.ar(4).exprange(0.001,1));
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 286.31944512, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2);
  sig = sig * (1-LFSaw.ar(4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,5000));
  sig = sig + (SinOsc.ar(90,mul:0.12)*Pulse.ar(1/fib(8)));
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 301.897702487, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2);
  sig = sig * (1-LFSaw.ar(4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,5000));
  sig = sig + HPF.ar((SinOsc.ar(90,mul:0.12)*Pulse.ar(1/fib(8))),50);
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 307.475649672, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2);
  sig = sig * (1-LFSaw.ar(4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,5000));
  sig = sig + HPF.ar((SinOsc.ar(9000,mul:0.12)*Pulse.ar(1/fib(8))),50);
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 320.526866991, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2);
  sig = sig * (1-LFSaw.ar(4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,5000));
  sig = sig + HPF.ar((SinOsc.ar(9000/([1,2,4,8]*pi),mul:0.12)*Pulse.ar(1/fib(8))),50);
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 325.775777895, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2);
  sig = sig * (1-LFSaw.ar(4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,5000));
  sig = sig + HPF.ar((SinOsc.ar(9000/([1,2,4,8]*pi),mul:0.012)*Pulse.ar(1/fib(8))),50);
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 360.497751222, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2);
  sig = sig * (1-LFSaw.ar(4).exprange(0.001,1));
  sig = CombN.ar(sig,1,LFNoise1.ar(1!4).exprange(0.0002,2),4);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 365.459086528, 'me', "thisProcess.stop;" ],
[ 375.45879447, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2);
  sig = sig * (1-LFSaw.ar(4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,5000));
  sig = sig + HPF.ar((SinOsc.ar(9000/([1,2,4,8]*pi),mul:0.012)*Pulse.ar(1/fib(8))),50);
  sig = CombN.ar(sig,1,LFNoise1.ar(1!4).exprange(0.0002,2),4)/8+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 386.486090084, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2);
  sig = sig * (1-LFSaw.ar(4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,5000));
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 387.385097872, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2);
  sig = sig * (1-LFSaw.ar(4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,5000));
  sig = sig + HPF.ar((SinOsc.ar(9000/([1,2,4,8]*pi),mul:0.012)*Pulse.ar(1/fib(8))),50);
  sig = CombN.ar(sig,1,LFNoise1.ar(1!4).exprange(0.0002,2).round(0.002),4)/8+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 413.633399463, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2);
  sig = sig * (1-LFSaw.ar(4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,5000));
  sig = sig + HPF.ar((SinOsc.ar(9000/([1,2,4,8]*pi),mul:0.012)*Pulse.ar(1/fib(8))),50);
  sig = CombN.ar(sig,1,LFNoise1.ar(1!4).exprange(0.0002,2).round(0.002),4)/8+sig;
  sig = Greyhole.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 424.531753075, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2);
  sig = sig * (1-LFSaw.ar(4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,5000));
  sig = sig + HPF.ar((SinOsc.ar(9000/([1,2,4,8]*pi),mul:0.012)*Pulse.ar(1/fib(8))),50);
  sig = CombN.ar(sig,1,LFNoise1.ar(1!4).exprange(0.0002,2).round(0.002),4)/8+sig;
  sig = Greyhole.ar(sig)/2+sig;
  Splay.ar(sig.flat,0.25,0.35);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 448.731510497, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2);
  sig = sig * (1-LFSaw.ar(4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,5000));
  sig = sig + HPF.ar((SinOsc.ar(9000/([1,2,4,8]*pi),mul:0.012)*Pulse.ar(1/fib(8))),50);
  sig = CombN.ar(sig,1,LFNoise1.ar(4!4).exprange(0.0002,2).round(0.002),4)/8+sig;
  sig = Greyhole.ar(sig)/2+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.35);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 455.875573265, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2);
  sig = sig * (1-LFSaw.ar(4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,5000));
  sig = sig + HPF.ar((SinOsc.ar(9000/([1,2,4,8]*pi),mul:0.012)*Pulse.ar(1/fib(8))),50);
  sig = CombN.ar(sig,1,LFNoise1.ar(4!4).exprange(0.0002,2).round(0.002),2)/8+sig;
  sig = Greyhole.ar(sig)/2+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.35);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 460.92814822, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2);
  sig = sig * (1-LFSaw.ar(4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,5000));
  sig = sig + HPF.ar((SinOsc.ar(9000/([1,2,4,8]*pi),mul:0.012)*Pulse.ar(1/fib(8))),50);
  sig = CombN.ar(sig,1,LFNoise1.ar(4!4).exprange(0.0002,2).round(0.002),2)/8+sig;
  sig = Greyhole.ar(sig)/3+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.35);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 462.970015217, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2);
  sig = sig * (1-LFSaw.ar(4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,5000));
  sig = sig + HPF.ar((SinOsc.ar(9000/([1,2,4,8]*pi),mul:0.012)*Pulse.ar(1/fib(8))),50);
  sig = CombN.ar(sig,1,LFNoise1.ar(4!4).exprange(0.0002,2).round(0.002),2)/8+sig;
  sig = Greyhole.ar(sig)/3+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2)/2;
  Splay.ar(sig.flat,0.25,0.35);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 469.309263564, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2);
  sig = sig * (1-LFSaw.ar(4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,5000));
  sig = sig + HPF.ar((SinOsc.ar(9000/([1,2,4,8]*pi),mul:0.012)*Pulse.ar(1/fib(8))),50);
  sig = CombN.ar(sig,1,LFNoise1.ar(4!4).exprange(0.0002,2).round(0.002),2)/8+sig;
  sig = Greyhole.ar(sig)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.35);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 482.444361251, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2);
  sig = sig * (1-LFSaw.ar(4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,5000));
  sig = sig + HPF.ar((SinOsc.ar(9000/([1,2,4,8]*pi),mul:0.012)*Pulse.ar(1/fib(8))),50);
  sig = CombN.ar(sig,1,LFNoise1.ar(4!4).exprange(0.0002,2).round(0.002),2)/8+sig;
  sig = Limiter.ar(sig);
  sig = Greyhole.ar(sig)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.35);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 489.764280756, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2);
  sig = sig * (1-LFSaw.ar(4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,5000));
  sig = sig + HPF.ar((SinOsc.ar(9000/([1,2,4,8]*pi),mul:0.012)*Pulse.ar(1/fib(8))),50);
  sig = CombN.ar(sig,1,LFNoise1.ar(4!4).exprange(0.0002,2).round(0.002),2)/8+sig;
  sig = Limiter.ar(sig.softclip);
  sig = Greyhole.ar(sig)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.35);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 495.02115796, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2);
  sig = sig * (1-LFSaw.ar(4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,5000));
  sig = sig + HPF.ar((SinOsc.ar(9000/([1,2,4,8]*pi),mul:0.012)*Pulse.ar(1/fib(8))),50);
  sig = CombN.ar(sig,1,LFNoise1.ar(4!4).exprange(0.0002,2).round(0.002),2)/8+sig;
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = Greyhole.ar(sig)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.35);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 500.864726049, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2);
  sig = sig * (1-LFSaw.ar(4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,5000));
  sig = sig + HPF.ar((SinOsc.ar(9000/([1,2,4,8]*pi),mul:0.012)*Pulse.ar(1/fib(8))),50);
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = CombN.ar(sig,1,LFNoise1.ar(4!4).exprange(0.0002,2).round(0.002),2)/8+sig;
  sig = Greyhole.ar(sig)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.35);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 524.086637346, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2);
  sig = sig * (1-LFSaw.ar(4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,5000));
  sig = sig + HPF.ar((SinOsc.ar(9000/([1,2,4,8]*pi),mul:0.012)*Pulse.ar(1/fib(8))),50);
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = CombN.ar(sig,1,LFNoise1.ar(4!4).exprange(0.0002,2).round(0.002),2)/8+sig;
  sig = sig * Pulse.ar(4);
  sig = Greyhole.ar(sig)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.35);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 536.575139795, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2);
  sig = sig * (1-LFSaw.ar(4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,5000));
  sig = sig + HPF.ar((SinOsc.ar(9000/([1,2,4,8]*pi),mul:0.012)*Pulse.ar(1/fib(8))),50);
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = CombN.ar(sig,1,LFNoise1.ar(4!4).exprange(0.0002,2).round(0.002),2)/8+sig;
  sig = Greyhole.ar(sig)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.35);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 545.720223688, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2);
  sig = sig * (1-LFSaw.ar(4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,5000));
  sig = sig + HPF.ar((SinOsc.ar(9000/([1,2,4,8]*pi),mul:0.012)*Pulse.ar(1/fib(8))),50);
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = CombN.ar(sig,1,LFNoise1.ar(4!4).exprange(0.0002,2).round(0.002),2)/8+sig;
  sig = Greyhole.ar(sig,0.1,0,2)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.35);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 551.843934039, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2);
  sig = sig * (1-LFSaw.ar(4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,5000));
  sig = sig + HPF.ar((SinOsc.ar(9000/([1,2,4,8]*pi),mul:0.012)*Pulse.ar(1/fib(8))),50);
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = CombN.ar(sig,1,LFNoise1.ar(4!4).exprange(0.0002,2).round(0.002),2)/8+sig;
  sig = Greyhole.ar(sig,0.25,0,2)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.35);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 555.792805431, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2);
  sig = sig * (1-LFSaw.ar(4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,5000));
  sig = sig + HPF.ar((SinOsc.ar(9000/([1,2,4,8]*pi),mul:0.012)*Pulse.ar(1/fib(8))),50);
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = CombN.ar(sig,1,LFNoise1.ar(4!4).exprange(0.0002,2).round(0.002),2)/8+sig;
  sig = Greyhole.ar(sig,0.25,0,2,0.02)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.35);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 560.261314336, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2);
  sig = sig * (1-LFSaw.ar(4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,5000));
  sig = sig + HPF.ar((SinOsc.ar(9000/([1,2,4,8]*pi),mul:0.012)*Pulse.ar(1/fib(8))),50);
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = CombN.ar(sig,1,LFNoise1.ar(4!4).exprange(0.0002,2).round(0.002),2)/8+sig;
  sig = Greyhole.ar(sig,0.25,0,2,0.04)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.35);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 562.3203013, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2);
  sig = sig * (1-LFSaw.ar(4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,5000));
  sig = sig + HPF.ar((SinOsc.ar(9000/([1,2,4,8]*pi),mul:0.012)*Pulse.ar(1/fib(8))),50);
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = CombN.ar(sig,1,LFNoise1.ar(4!4).exprange(0.0002,2).round(0.002),2)/8+sig;
  sig = Greyhole.ar(sig,0.25,0,1,0.04)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.35);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 564.479922618, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2);
  sig = sig * (1-LFSaw.ar(4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,5000));
  sig = sig + HPF.ar((SinOsc.ar(9000/([1,2,4,8]*pi),mul:0.012)*Pulse.ar(1/fib(8))),50);
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = CombN.ar(sig,1,LFNoise1.ar(4!4).exprange(0.0002,2).round(0.002),2)/8+sig;
  sig = Greyhole.ar(sig,0.25,0.9,1,0.04)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.35);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 569.711255284, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2);
  sig = sig * (1-LFSaw.ar(4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,5000));
  sig = sig + HPF.ar((SinOsc.ar(9000/([1,2,4,8]*pi),mul:0.012)*Pulse.ar(1/fib(8))),50);
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = CombN.ar(sig,1,LFNoise1.ar(4!4).exprange(0.0002,2).round(0.002),2)/8+sig;
  sig = Greyhole.ar(sig,0.5,0.9,1,0.04)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.35);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 577.544302646, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2);
  sig = sig * (1-LFSaw.ar(4).exprange(0.001,1));
  sig = sig + HPF.ar((SinOsc.ar(9000/([1,2,4,8]*pi),mul:0.012)*Pulse.ar(1/fib(8))),50);
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = CombN.ar(sig,1,LFNoise1.ar(4!4).exprange(0.0002,2).round(0.002),2)/8+sig;
  //sig = Greyhole.ar(sig,0.5,0.9,1,0.04)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.35);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 590.112184578, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2);
  sig = sig * (1-LFSaw.ar(4).exprange(0.001,1));
  sig = BPF.ar(sig,50*1.5+SinOsc.kr(1/8/fib(8)).exprange(50.01,5000));
  sig = sig + HPF.ar((SinOsc.ar(9000/([1,2,4,8]*pi),mul:0.012)*Pulse.ar(1/fib(8))),50);
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = CombN.ar(sig,1,LFNoise1.ar(4!4).exprange(0.0002,2).round(0.002),2)/8+sig;
  sig = Greyhole.ar(sig,0.5,0.9,1,0.04)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.35);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 595.295635435, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2);
  sig = sig * (1-LFSaw.ar(4).exprange(0.001,1));
  sig = BPF.ar(sig,50*1.25+SinOsc.kr(1/8/fib(8)).exprange(50.01,5000));
  sig = sig + HPF.ar((SinOsc.ar(9000/([1,2,4,8]*pi),mul:0.012)*Pulse.ar(1/fib(8))),50);
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = CombN.ar(sig,1,LFNoise1.ar(4!4).exprange(0.0002,2).round(0.002),2)/8+sig;
  sig = Greyhole.ar(sig,0.5,0.9,1,0.04)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.35);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 601.463033671, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2*1.5);
  sig = sig * (1-LFSaw.ar(4).exprange(0.001,1));
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = CombN.ar(sig,1,LFNoise1.ar(4!4).exprange(0.0002,2).round(0.002),2)/8+sig;
  sig = Greyhole.ar(sig,0.5,0.9,1,0.04)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.35);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 613.302779536, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2*1.25);
  sig = sig * (1-LFSaw.ar(4).exprange(0.001,1));
  sig = BPF.ar(sig,50*1.25+SinOsc.kr(1/8/fib(8)).exprange(50.01,5000));
  sig = sig + HPF.ar((SinOsc.ar(9000/([1,2,4,8]*pi),mul:0.012)*Pulse.ar(1/fib(8))),50);
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = CombN.ar(sig,1,LFDNoise1.ar(1/4!4).exprange(0.0002,2).round(0.002),2)/8+sig;
  sig = Greyhole.ar(sig,0.5,0.9,1,0.04)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.35);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 622.686904975, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2*1.5);
  sig = sig * (1-LFSaw.ar(4).exprange(0.001,1));
  sig = BPF.ar(sig,50*1.25+SinOsc.kr(1/8/fib(8)).exprange(50.01,5000));
  sig = sig + HPF.ar((SinOsc.ar(9000/([1,2,4,8]*pi),mul:0.012)*Pulse.ar(1/fib(8))),50);
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = CombN.ar(sig,1,LFDNoise1.ar(1/4!4).exprange(0.0002,2).round(0.002),2)/8+sig;
  sig = Greyhole.ar(sig,0.5,0.9,1,0.04)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.35);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 670.076651009, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2*1.5);
  sig = sig * (1-LFSaw.ar(4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,15000));
  sig = sig + HPF.ar((SinOsc.ar(9000/([1,2,4,8]*pi),mul:0.012)*Pulse.ar(1/fib(8))),50);
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = CombN.ar(sig,1,LFDNoise1.ar(1/4!4).exprange(0.0002,2).round(0.002),2)/8+sig;
  sig = Greyhole.ar(sig,0.5,0.9,1,0.04)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.35);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 673.29708174, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2*1.5);
  sig = sig * (1-LFSaw.ar(1/4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,15000));
  sig = sig + HPF.ar((SinOsc.ar(9000/([1,2,4,8]*pi),mul:0.012)*Pulse.ar(1/fib(8))),50);
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = CombN.ar(sig,1,LFDNoise1.ar(1/4!4).exprange(0.0002,2).round(0.002),2)/8+sig;
  sig = Greyhole.ar(sig,0.5,0.9,1,0.04)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.35);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 678.204643225, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2*1.5);
  sig = sig * (1-LFSaw.ar(1/4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,15000));
  sig = sig + HPF.ar((SinOsc.ar(5000/([1,2,4,8]*pi),mul:0.012)*Pulse.ar(1/fib(8))),50);
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = CombN.ar(sig,1,LFDNoise1.ar(1/4!4).exprange(0.0002,2).round(0.002),2)/8+sig;
  sig = Greyhole.ar(sig,0.5,0.9,1,0.04)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.35);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 680.297053724, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2*1.5);
  sig = sig * (1-LFSaw.ar(1/4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,15000));
  sig = sig + HPF.ar((SinOsc.ar(15000/([1,2,4,8]*pi),mul:0.012)*Pulse.ar(1/fib(8))),50);
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = CombN.ar(sig,1,LFDNoise1.ar(1/4!4).exprange(0.0002,2).round(0.002),2)/8+sig;
  sig = Greyhole.ar(sig,0.5,0.9,1,0.04)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.35);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 685.065904511, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2*1.5);
  sig = sig * (1-LFSaw.ar(1/4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,15000));
  sig = sig + HPF.ar((SinOsc.ar(15000/([1,2,4,8]*pi),mul:0.012)*Pulse.ar(1/4/fib(8))),50);
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = CombN.ar(sig,1,LFDNoise1.ar(1/4!4).exprange(0.0002,2).round(0.002),2)/8+sig;
  sig = Greyhole.ar(sig,0.5,0.9,1,0.04)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.35);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 693.29966879, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2*1.5);
  sig = sig * (1-LFSaw.ar(1/4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,15000));
  sig = sig + HPF.ar((SinOsc.ar(15000/([1,2,4,8]*pi),mul:0.012)*Pulse.ar(1/4/fib(8))),50);
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = CombN.ar(sig,1,LFDNoise1.ar(1/4!4).exprange(0.0002,2).round(0.002),2)/8+sig;
  sig = Greyhole.ar(sig,0.5,0.9,1,0.04)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.35);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 704.368787414, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2*1.5);
  sig = sig * (1-LFSaw.ar(1/4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,15000/2));
  sig = sig + HPF.ar((SinOsc.ar(15000/([1,2,4,8]*pi),mul:0.012)*Pulse.ar(1/4/fib(8))),50);
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = CombN.ar(sig,1,LFDNoise1.ar(1/4!4).exprange(0.0002,2).round(0.002),2)/8+sig;
  sig = Greyhole.ar(sig,0.5,0.9,1,0.04)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.35);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 707.066610176, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2*1.25);
  sig = sig * (1-LFSaw.ar(1/4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,15000/2));
  sig = sig + HPF.ar((SinOsc.ar(15000/([1,2,4,8]*pi),mul:0.012)*Pulse.ar(1/4/fib(8))),50);
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = CombN.ar(sig,1,LFDNoise1.ar(1/4!4).exprange(0.0002,2).round(0.002),2)/8+sig;
  sig = Greyhole.ar(sig,0.5,0.9,1,0.04)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.35);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 710.958537658, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2*1.125);
  sig = sig * (1-LFSaw.ar(1/4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,15000/2));
  sig = sig + HPF.ar((SinOsc.ar(15000/([1,2,4,8]*pi),mul:0.012)*Pulse.ar(1/4/fib(8))),50);
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = CombN.ar(sig,1,LFDNoise1.ar(1/4!4).exprange(0.0002,2).round(0.002),2)/8+sig;
  sig = Greyhole.ar(sig,0.5,0.9,1,0.04)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.35);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 713.383299394, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2*1.25);
  sig = sig * (1-LFSaw.ar(1/4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,15000/2));
  sig = sig + HPF.ar((SinOsc.ar(15000/([1,2,4,8]*pi),mul:0.012)*Pulse.ar(1/4/fib(8))),50);
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = CombN.ar(sig,1,LFDNoise1.ar(1/4!4).exprange(0.0002,2).round(0.002),2)/8+sig;
  sig = Greyhole.ar(sig,0.5,0.9,1,0.04)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.35);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 714.964594912, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2*1.5);
  sig = sig * (1-LFSaw.ar(1/4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,15000/2));
  sig = sig + HPF.ar((SinOsc.ar(15000/([1,2,4,8]*pi),mul:0.012)*Pulse.ar(1/4/fib(8))),50);
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = CombN.ar(sig,1,LFDNoise1.ar(1/4!4).exprange(0.0002,2).round(0.002),2)/8+sig;
  sig = Greyhole.ar(sig,0.5,0.9,1,0.04)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.35);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 724.683457974, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2*1);
  sig = sig * (1-LFSaw.ar(1/4).exprange(0.001,1));
  sig = sig + HPF.ar((SinOsc.ar(15000/([1,2,4,8]*pi),mul:0.012)*Pulse.ar(1/4/fib(8))),50);
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = CombN.ar(sig,1,LFDNoise1.ar(1/4!4).exprange(0.0002,2).round(0.002),2)/8+sig;
  sig = Greyhole.ar(sig,0.5,0.9,1,0.04)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.35);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 726.754596582, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2*4);
  sig = sig * (1-LFSaw.ar(1/4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,15000/2));
  sig = sig + HPF.ar((SinOsc.ar(15000/([1,2,4,8]*pi),mul:0.012)*Pulse.ar(1/4/fib(8))),50);
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = CombN.ar(sig,1,LFDNoise1.ar(1/4!4).exprange(0.0002,2).round(0.002),2)/8+sig;
  sig = Greyhole.ar(sig,0.5,0.9,1,0.04)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.35);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 728.814149435, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2*1.5);
  sig = sig * (1-LFSaw.ar(1/4).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,15000/2));
  sig = sig + HPF.ar((SinOsc.ar(15000/([1,2,4,8]*pi),mul:0.012)*Pulse.ar(1/4/fib(8))),50);
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = CombN.ar(sig,1,LFDNoise1.ar(1/4!4).exprange(0.0002,2).round(0.002),2)/8+sig;
  sig = Greyhole.ar(sig,0.5,0.9,1,0.04)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.35);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 742.487627046, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2*[1,1.5,1.25,4]);
  sig = sig * (1-LFSaw.ar(1/4/fib(4)).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,15000/2));
  sig = sig + HPF.ar((SinOsc.ar(15000/([1,2,4,8]*pi),mul:0.012)*Pulse.ar(1/4/fib(8))),50);
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = CombN.ar(sig,1,LFDNoise1.ar(1/4!4).exprange(0.0002,2).round(0.002),2)/8+sig;
  sig = Greyhole.ar(sig,0.5,0.9,1,0.04)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.35);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 765.894514901, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2*[1,1.5,1.25,4]);
  sig = sig * (1-LFSaw.ar(1/4/fib(4)).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,15000/2));
  sig = sig + HPF.ar((SinOsc.ar(15000/([1,2,4,8]*pi),mul:0.012)*Pulse.ar(1/4/fib(8))),50);
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = CombN.ar(sig,1,LFDNoise1.ar(1/4!4).exprange(0.0002,2).round(0.002),2)/2+sig;
  sig = Greyhole.ar(sig,0.5,0.9,1,0.04)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 782.951742254, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2*[1,1.5,1.25,4]);
  sig = sig * (1-LFSaw.ar(1/4/fib(4)).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,15000/2));
  sig = sig + HPF.ar((SinOsc.ar(5000/([1,2,4,8]*pi),mul:0.012)*Pulse.ar(1/4/fib(8))),50);
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = CombN.ar(sig,1,LFDNoise1.ar(1/4!4).exprange(0.0002,2).round(0.002),2)/2+sig;
  sig = Greyhole.ar(sig,0.5,0.9,1,0.04)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 806.54099702, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2*[1,1.5,1.25,4]);
  sig = sig * (1-LFSaw.ar(1/4/fib(4)).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,15000/2));
  sig = sig + HPF.ar((SinOsc.ar(5000/([1,2,4,8]*pi),mul:0.012)*Pulse.ar(4/fib(8))),50);
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = CombN.ar(sig,1,LFDNoise1.ar(1/4!4).exprange(0.0002,2).round(0.002),2)/2+sig;
  sig = Greyhole.ar(sig,0.5,0.9,1,0.04)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 816.3346705, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2*[1,1.5,1.25,4]);
  sig = sig * (1-LFSaw.ar(1/4/fib(4)).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,15000/2));
  sig = sig + HPF.ar((SinOsc.ar(5000/([1,2,4,8]*pi),mul:0.02)*Pulse.ar(2/fib(8))),50);
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = CombN.ar(sig,1,LFDNoise1.ar(1/4!4).exprange(0.0002,2).round(0.002),2)/2+sig;
  sig = Greyhole.ar(sig,0.5,0.9,1,0.04)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 827.239580166, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2*[1,1.5,1.25,4]);
  sig = sig * (1-LFSaw.ar(1/4/fib(4)).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,15000/2));
  sig = sig + HPF.ar((SinOsc.ar(5000/([1,2,4,8]*pi),mul:0.04)*Pulse.ar(2/fib(8))),50);
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = CombN.ar(sig,1,LFDNoise1.ar(1/4!4).exprange(0.0002,2).round(0.002),2)/2+sig;
  sig = Greyhole.ar(sig,0.5,0.9,1,0.04)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 832.189075077, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2*[1,1.5,1.25,4]*1.5);
  sig = sig * (1-LFSaw.ar(1/4/fib(4)).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,15000/2));
  sig = sig + HPF.ar((SinOsc.ar(5000/([1,2,4,8]*pi),mul:0.04)*Pulse.ar(2/fib(8))),50);
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = CombN.ar(sig,1,LFDNoise1.ar(1/4!4).exprange(0.0002,2).round(0.002),2)/2+sig;
  sig = Greyhole.ar(sig,0.5,0.9,1,0.04)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 838.498000947, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2*[1,1.5,1.25,4]*1.25);
  sig = sig * (1-LFSaw.ar(1/4/fib(4)).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,15000/2));
  sig = sig + HPF.ar((SinOsc.ar(5000/([1,2,4,8]*pi),mul:0.04)*Pulse.ar(2/fib(8))),50);
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = CombN.ar(sig,1,LFDNoise1.ar(1/4!4).exprange(0.0002,2).round(0.002),2)/2+sig;
  sig = Greyhole.ar(sig,0.5,0.9,1,0.04)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 843.517116035, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2*[1,1.5,1.25,4]*1.125);
  sig = sig * (1-LFSaw.ar(1/4/fib(4)).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,15000/2));
  sig = sig + HPF.ar((SinOsc.ar(5000/([1,2,4,8]*pi),mul:0.04)*Pulse.ar(2/fib(8))),50);
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = CombN.ar(sig,1,LFDNoise1.ar(1/4!4).exprange(0.0002,2).round(0.002),2)/2+sig;
  sig = Greyhole.ar(sig,0.5,0.9,1,0.04)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 848.40787519, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2*[1,1.5,1.25,4]);
  sig = sig * (1-LFSaw.ar(1/4/fib(4)).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,15000/2));
  sig = Greyhole.ar(sig,0.5,0.9,1,0.04)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 860.827392929, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2*[1,1.5,1.25,4]);
  sig = sig * (1-LFSaw.ar(1/4/fib(4)).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,15000/2));
  sig = sig + HPF.ar((SinOsc.ar(5000/([1,2,4,8]*pi),mul:0.004)*Pulse.ar(2/fib(8))),50);
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = CombN.ar(sig,1,LFDNoise1.ar(1/4!4).exprange(0.0002,2).round(0.002),2)/2+sig;
  sig = Greyhole.ar(sig,0.5,0.9,1,0.04)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 915.956344797, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2*[1,1.5,1.25,4]);
  sig = sig * (1-LFSaw.ar(1/4/fib(4)).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,15000/2));
  sig = sig + HPF.ar((SinOsc.ar(5000/([1,2,4,8]*pi),mul:0.004)*Pulse.ar(2/fib(8))),50);
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = sig + (WhiteNoise.ar(0.1!2) * Pulse.ar(4/fib(8)));
  sig = CombN.ar(sig,1,LFDNoise1.ar(1/4!4).exprange(0.0002,2).round(0.002),2)/2+sig;
  sig = Greyhole.ar(sig,0.5,0.9,1,0.04)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 923.023940239, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2*[1,1.5,1.25,4]);
  sig = sig * (1-LFSaw.ar(1/4/fib(4)).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,15000/2));
  sig = sig + HPF.ar((SinOsc.ar(5000/([1,2,4,8]*pi),mul:0.004)*Pulse.ar(2/fib(8))),50);
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = sig + (WhiteNoise.ar(0.1!2) * Pulse.ar(2/fib(8)));
  sig = CombN.ar(sig,1,LFDNoise1.ar(1/4!4).exprange(0.0002,2).round(0.002),2)/2+sig;
  sig = Greyhole.ar(sig,0.5,0.9,1,0.04)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 933.8160634, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2*[1,1.5,1.25,4]);
  sig = sig * (1-LFSaw.ar(1/4/fib(4)).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,15000/2));
  sig = sig + HPF.ar((SinOsc.ar(5000/([1,2,4,8]*pi),mul:0.004)*Pulse.ar(2/fib(8))),50);
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = sig + (WhiteNoise.ar(0.1!2) * Pulse.ar(2/fib(8)));
  sig = CombN.ar(sig,1,LFDNoise1.ar(1/4!4).exprange(0.002,2).round(0.002),2)/2+sig;
  sig = Greyhole.ar(sig,0.5,0.9,1,0.04)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 956.959854625, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2*[1,1.5,1.25,4]);
  sig = sig * (1-LFSaw.ar(1/4/fib(4)).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,15000/2));
  sig = sig + HPF.ar((SinOsc.ar(5000/([1,2,4,8]*pi),mul:0.004)*Pulse.ar(2/fib(8))),50);
  sig = sig + (PinkNoise.ar(0.1!2) * Pulse.ar(2/fib(8)));
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = CombN.ar(sig,1,LFDNoise1.ar(1/4!4).exprange(0.002,2).round(0.002),2)/2+sig;
  sig = Greyhole.ar(sig,0.5,0.9,1,0.04)/3+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 971.104591215, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2*[1,1.5,1.25,4]);
  sig = sig * (1-LFSaw.ar(1/4/fib(4)).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,15000/2));
  sig = sig + HPF.ar((SinOsc.ar(5000/([1,2,4,8]*pi),mul:0.004)*Pulse.ar(2/fib(8))),50);
  sig = sig + (PinkNoise.ar(0.1!2) * Pulse.ar(2/fib(8)));
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = CombN.ar(sig,1,LFDNoise1.ar(1/4!4).exprange(0.002,2).round(0.002),2)/2+sig;
  sig = Greyhole.ar(sig)/2+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1072.632915111, 'me', "(
~meta.quant=2;
~meta.fadeTime=2;
~meta={
  var sig = LFSaw.ar(50!2*[1,1.5,1.25,4]);
  sig = sig * (1-LFSaw.ar(1/4/fib(4)).exprange(0.001,1));
  sig = BPF.ar(sig,50+SinOsc.kr(1/8/fib(8)).exprange(50.01,15000/2));
  sig = sig + HPF.ar((SinOsc.ar(5000/([1,2,4,8]*pi),mul:0.004)*Pulse.ar(2/fib(8))),50);
  sig = sig + (PinkNoise.ar(0.1!2) * Pulse.ar(2/fib(8)));
  sig = Limiter.ar(sig.softclip.distort.distort);
  sig = CombN.ar(sig,1,LFDNoise1.ar(1/4!4).exprange(0.02,2).round(0.002),2)/2+sig;
  sig = Greyhole.ar(sig)/2+sig;
  sig = CompanderD.ar(sig/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~meta,postVol:true);
~meta.play;
);" ],
[ 1077.016316072, 'me', "~meta.stop(60);" ],
];