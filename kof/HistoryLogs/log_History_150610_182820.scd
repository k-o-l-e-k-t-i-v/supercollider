// History, as it was on Wed Jun 10 18:28:20 2015.

[
[ 0, 'me', "(
~test.quant=2;
~test.fadeTime=2;
~test={
  var sig = LFSaw.ar(50!2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 2.544606254, 'me', "(
~test.quant=2;
~test.fadeTime=2;
~test={
  var sig = LFSaw.ar(50!2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 4.548145438, 'me', "(
~test.quant=2;
~test.fadeTime=2;
~test={
  var sig = LFSaw.ar(50!2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 7.518289983, 'me', "(
~test.quant=2;
~test.fadeTime=2;
~test={
  var sig = LFSaw.ar(50!2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.015);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 22.958379718, 'me', "(
~test.quant=2;
~test.fadeTime=2;
~test={
  var sig = LFSaw.ar(50!2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 30.339490688, 'me', "thisProcess.stop;" ],
[ 44.157726995, 'me', "(
~test.quant=2;
~test.fadeTime=2;
~test={
  var sig = LFSaw.ar(50!2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 53.382505657, 'me', "thisProcess.stop;" ],
[ 85.695556365, 'me', "(
~test.quant=2;
~test.fadeTime=2;
~test={
  var sig = LFSaw.ar(50!2) * LFSaw.ar(1/4).exprange(0.001,1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 94.364822724, 'me', "thisProcess.stop;" ],
[ 98.29519914, 'me', "thisProcess.stop;" ],
[ 106.141309039, 'me', "(
~test.quant=2;
~test.fadeTime=2;
~test={
  var sig = LFSaw.ar(4320!2) * LFSaw.ar(1/4).exprange(0.001,1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 109.099478633, 'me', "thisProcess.stop;" ],
[ 113.035492509, 'me', "(
~test.quant=2;
~test.fadeTime=2;
~test={
  var sig = LFSaw.ar(4320!2) * LFSaw.ar(1/4).exprange(0.001,1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 131.803462777, 'me', "(
~test.quant=2;
~test.fadeTime=2;
~test={
    var sig = LFSaw.ar(4320!2) * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 144.941729542, 'me', "thisProcess.stop;" ],
[ 183.347995203, 'me', "(
~testing.quant=2;
~testing.fadeTime=2;
~testing={
  var high,mid,low;
  var sig = m.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.1);
};
~testing.play;
);" ],
[ 184.816085404, 'me', "(
~test.quant=2;
~test.fadeTime=2;
~test={
    var sig = LFSaw.ar(4320!2) * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 192.677720074, 'me', "(
~test.quant=2;
~test.fadeTime=2;
~test={
    var sig = LFSaw.ar(4320!2) * LFSaw.ar(1/8/fib(8)).exprange(0.001,1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 200.277567167, 'me', "(
~test.quant=2;
~test.fadeTime=2;
~test={
    var sig = LFSaw.ar(4320*[1,2]) * LFSaw.ar(1/8/fib(8)).exprange(0.001,1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 207.334671188, 'me', "(
~test.quant=2;
~test.fadeTime=2;
~test={
    var sig = LFSaw.ar(4320*[1,1.5]) * LFSaw.ar(1/8/fib(8)).exprange(0.001,1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 216.920613687, 'me', "(
~test.quant=2;
~test.fadeTime=2;
~test={
    var sig = LFSaw.ar(4320*[1,1.5]) * LFSaw.ar(8/fib(8)).exprange(0.001,1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 229.867705808, 'me', "(
~test.quant=2;
~test.fadeTime=2;
~test={
    var sig = LFSaw.ar(432.0*[1,1.5]) * LFSaw.ar(8/fib(8)).exprange(0.001,1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 243.211032617, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = LFSaw.ar(43.20*[1,1.5]) * LFSaw.ar(8/fib(8)).exprange(0.001,1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 252.893280975, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = LFSaw.ar(43.20*[1,1.5]) * LFSaw.ar(1/8/fib(8)).exprange(0.001,1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 286.512095181, 'me', "~testing.stop(7);" ],
[ 292.103111531, 'me', "thisProcess.stop;" ],
[ 1018.07770836, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = LFSaw.ar(43.20*[1,1.5]) * LFSaw.ar(1/8/fib(8)).exprange(0.001,1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1033.928376583, 'me', "thisProcess.stop;" ],
[ 1067.591878518, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
  var sig = LFSaw.ar(50!2);
  sig = Greyhole.ar(sig);

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1069.698032686, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
  var sig = LFSaw.ar(500!2);
  sig = Greyhole.ar(sig);

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1072.300359335, 'me', "thisProcess.stop;" ],
[ 1124.568511704, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = LFSaw.ar(432/pi*((1..8)/10));
  sig = Greyhole.ar(sig);

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1127.278005584, 'me', "thisProcess.stop;" ],
[ 1210.30953365, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = LFSaw.ar(432/pi*((1..8)/10));
  sig = Greyhole.ar(sig);

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1213.796150328, 'me', "(
~test.fadeTime=4;
~test={
    var sig = LFSaw.ar(432/pi*((1..8)/100));
  sig = Greyhole.ar(sig);

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1214.436562812, 'me', "thisProcess.stop;" ],
[ 1249.447017768, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = LFSaw.ar(432/pi*((1..8)/100));
  sig = Greyhole.ar(sig,1,0.2,4)/8+sig;

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1252.583214842, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = LFSaw.ar(432/pi*((1..8)/100));
  sig = Greyhole.ar(sig,1,0.2,4)/8+sig;

  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1258.679168297, 'me', "thisProcess.stop;" ],
[ 1272.456513854, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = LFSaw.ar(432/pi*((1..8)/100));
  sig = Greyhole.ar(sig,0.1,2)/8+sig;

  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1275.815647145, 'me', "thisProcess.stop;" ],
[ 1283.43743093, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = LFSaw.ar(432/pi*((1..8)/100));
  //sig = Greyhole.ar(sig,0.1,2)/8+sig;

  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1288.280425391, 'me', "thisProcess.stop;" ],
[ 1292.465181486, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = LFSaw.ar(432/pi*((1..8)/10));
  //sig = Greyhole.ar(sig,0.1,2)/8+sig;

  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1294.737736739, 'me', "thisProcess.stop;" ],
[ 1316.831789503, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = SinOsc.ar(43.2*pi+((1..8)/10));
  //sig = Greyhole.ar(sig,0.1,2)/8+sig;

  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1322.877716437, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = SinOsc.ar(43.2*pi+((1..8)/100));
  //sig = Greyhole.ar(sig,0.1,2)/8+sig;

  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1326.928556105, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = SinOsc.ar(43.2*pi+((1..8)/10));
  //sig = Greyhole.ar(sig,0.1,2)/8+sig;

  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1339.670628975, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = SinOsc.ar(43.2*1.5pi+((1..8)/10));
  //sig = Greyhole.ar(sig,0.1,2)/8+sig;

  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1345.392271017, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = SinOsc.ar(43.2*1.25pi+((1..8)/10));
  //sig = Greyhole.ar(sig,0.1,2)/8+sig;

  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1353.675413711, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = SinOsc.ar(43.2*[1.25,1.5]*pi+((1..8)/10));
  //sig = Greyhole.ar(sig,0.1,2)/8+sig;

  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1364.089859634, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = SinOsc.ar(43.2*[1.25,1.5]*pi+((1..8)/10));
  sig = Greyhole.ar(sig,0.1,2)/8+sig;

  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1368.878919491, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = SinOsc.ar(43.2*[1.25,1.5]*pi+((1..8)/10));
  sig = Greyhole.ar(sig,1)/8+sig;

  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1394.912734213, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = SinOsc.ar(43.2*[1.25,1.5]*pi+((1..8)/10));
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)/4),1);
    sig = Greyhole.ar(sig,2)/8+sig;

  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1404.642029573, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = SinOsc.ar(43.2*[1.25,1.5]*pi+((1..8)/10));
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)/4),1);
    sig = Greyhole.ar(sig,2)/4+sig;

  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1409.400335156, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = SinOsc.ar(43.2*[1.25,1.5,1,1]*pi+((1..8)/10));
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)/4),1);
    sig = Greyhole.ar(sig,2)/4+sig;

  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1418.260064625, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = SinOsc.ar(43.2*[1.25,1.5,1,1]*pi+((1..8)/10));
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)/4),1);
    sig = Greyhole.ar(sig,2)/4+sig;

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1428.448504578, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = SinOsc.ar(43.2*2*[1.25,1.5,1,1]*pi+((1..8)/10));
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)/4),1);
    sig = Greyhole.ar(sig,2)/4+sig;

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1435.773468184, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = SinOsc.ar(43.2*[1.25,1.5,1,1]*pi+((1..8)/10));
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)/4),1);
    sig = Greyhole.ar(sig,2)/4+sig;

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1460.441195455, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = SinOsc.ar(43.2*[1.25,1.5,1,1]*pi+((1..8)/10));
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)/4),0.1);
    sig = Greyhole.ar(sig,1,4)/4+sig;

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1495.642367383, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = SinOsc.ar(43.2*[1.25,1.5,1,1]*pi+((1..8)/10));
    sig = CombN.ar(sig,1,LFDNoise1.ar(1!4).exprange(0.001,0.2));
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)/4),0.1);
    sig = Greyhole.ar(sig,1,4)/4+sig;

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1515.316077345, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = SinOsc.ar(43.2*[1.25,1.5,1,1]*pi+((1..8)/10));
    sig = CombN.ar(sig,1,LFDNoise1.ar(1!4).exprange(0.01,0.2));
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)/4),0.1);
    sig = Greyhole.ar(sig,1,4)/4+sig;

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1525.742359403, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = SinOsc.ar(43.2*[1.25,1.5,1,1]*pi+((1..8)/100));
    sig = CombN.ar(sig,1,LFDNoise1.ar(1!4).exprange(0.01,0.2));
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)/4),0.1);
    sig = Greyhole.ar(sig,2,4)/4+sig;

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1529.485570158, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = SinOsc.ar(43.2*[1.25,1.5,1,1]*pi+((1..8)/100));
    sig = CombN.ar(sig,1,LFDNoise1.ar(1!4).exprange(0.01,0.2));
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)/4),0.1);
    sig = Greyhole.ar(sig,2,4)/2+sig;

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1539.658097973, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = SinOsc.ar(43.2*[1.25,1.5,1,1]*pi+((1..8)/100));
    sig = CombN.ar(sig,1,LFDNoise1.ar(1!4).exprange(0.01,0.2));
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)/4),0.1);
    sig = Greyhole.ar(sig,2,0.01,8)/2+sig;

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1548.073134805, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = SinOsc.ar(43.2*[1.25,1.5,1,1]*pi+((1..8)/100));
    sig = CombN.ar(sig,1,LFDNoise1.ar(1!4).exprange(0.01,0.2));
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)/4),0.1);
    sig = Greyhole.ar(sig,4,0.01,8)/2+sig;

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1556.38665557, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = SinOsc.ar(43.2*[1.25,1.5,1,1]*pi+((1..8)/100));
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)/4),0.1);
    sig = Greyhole.ar(sig,4,0.01,8)/2+sig;
    sig = CombN.ar(sig,1,LFDNoise1.ar(1!4).exprange(0.01,0.2));

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1561.607794922, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = SinOsc.ar(43.2*[1.25,1.5,1,1]*pi+((1..8)/100));
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)/4),0.1);
    sig = Greyhole.ar(sig,4,0.01,8)/2+sig;
    sig = CombN.ar(sig,1,LFDNoise1.ar(1!4).exprange(0.01,0.2));

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1572.947102045, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = SinOsc.ar(43.2*[1.25,1.5,1,1]*pi+((1..8)/100));
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)/4),0.1);
    sig = Greyhole.ar(sig,4,0.01,8)/2+sig;
    sig = CombN.ar(sig,1,LFDNoise1.ar(1!4).exprange(0.01,0.2).round(0.02));

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1578.005046933, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = SinOsc.ar(43.2*[1.25,1.5,1,1]*pi+((1..8)/100));
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)/4),0.1);
    sig = Greyhole.ar(sig,4,0.01,8)/2+sig;
    sig = CombN.ar(sig,1,LFDNoise1.ar(1!4).exprange(0.01,0.2).round(0.02));

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1585.861543502, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = SinOsc.ar(43.2*[1.25,1.5,1,1]*pi+((1..8)/100));
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)/4),0.1);
    sig = Greyhole.ar(sig,1,0.01,8)/2+sig;
    sig = CombN.ar(sig,4,LFDNoise1.ar(1!4).exprange(0.01,0.2).round(0.02));

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1598.101225898, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = SinOsc.ar(43.2*[1.25,1.5,1,1]*pi+((1..8)/100));
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)/4),0.1);
    sig = Greyhole.ar(sig,1,0.01,8)/2+sig;
    sig = CombN.ar(sig,4,LFDNoise1.ar(8!4).exprange(0.01,0.2).round(0.02));

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1603.390573148, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = SinOsc.ar(43.2*[1.25,1.5,1,1]*pi+((1..8)/100));
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)/4),0.1);
    sig = Greyhole.ar(sig,1,0.01,8)/2+sig;
    sig = CombN.ar(sig,4,LFDNoise1.ar(8!4).exprange(0.01,0.02).round(0.02));

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1605.628640522, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = SinOsc.ar(43.2*[1.25,1.5,1,1]*pi+((1..8)/100));
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)/4),0.1);
    sig = Greyhole.ar(sig,1,0.01,8)/2+sig;
    sig = CombN.ar(sig,4,LFDNoise1.ar(8!4).exprange(0.001,0.02).round(0.02));

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1619.577561922, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = SinOsc.ar(43.2*[1.25,1.5,1,1]*pi+((1..8)/100));
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)/4),0.2);
    sig = Greyhole.ar(sig,1,0.01,8)/2+sig;
    sig = CombN.ar(sig,4,LFDNoise1.ar(8!4).exprange(0.001,0.02).round(0.02));

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1623.772039633, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = SinOsc.ar(43.2*[1.25,1.5,1,1]*pi+((1..8)/100));
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)/4),0.2);
    sig = Greyhole.ar(sig,1,0.01,8)/2+sig;
    sig = CombN.ar(sig,4,LFDNoise1.ar(8!4).exprange(0.001,0.02).round(0.02));

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1629.552241277, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = SinOsc.ar(43.2*[1.25,1.5,1,1]*pi+((1..8)/100));
  sig = sig * Decay.ar(Impulse.ar(1/8,(0..3)/4),0.2);
    sig = Greyhole.ar(sig,1,0.01,8)/2+sig;
    sig = CombN.ar(sig,4,LFDNoise1.ar(8!4).exprange(0.001,0.02).round(0.02));

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1633.768609367, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = SinOsc.ar(43.2*[1.25,1.5,1,1]*pi+((1..8)/100));
  sig = sig * Decay.ar(Impulse.ar(1/8,(0..3)/4),1.5);
    sig = Greyhole.ar(sig,1,0.01,8)/2+sig;
    sig = CombN.ar(sig,4,LFDNoise1.ar(8!4).exprange(0.001,0.02).round(0.02));

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1642.44549812, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = SinOsc.ar(43.2*[1.25,1.5,1,1]*pi+((1..8)/100));
  sig = sig * Decay.ar(Impulse.ar(1/8,(0..3)/4),1.5);
    sig = Greyhole.ar(sig,1,0.01,8)/2+sig;
    sig = CombN.ar(sig,4,LFDNoise1.ar(8!4).exprange(0.001,0.02).round(0.02));

  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1650.837276838, 'me', "thisProcess.stop;" ],
[ 1656.016803716, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = LFSaw.ar(43.2*[1.25,1.5,1,1]*pi+((1..8)/100));
  sig = sig * Decay.ar(Impulse.ar(1/8,(0..3)/4),1.5);
    sig = Greyhole.ar(sig,1,0.01,8)/2+sig;
    sig = CombN.ar(sig,4,LFDNoise1.ar(8!4).exprange(0.001,0.02).round(0.02));

  Splay.ar(sig.flat,0.25,0.075);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1659.238693441, 'me', "thisProcess.stop;" ],
[ 1659.98838311, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = LFSaw.ar(43.2*[1.25,1.5,1,1]*pi+((1..8)/100));
  sig = sig * Decay.ar(Impulse.ar(1/8,(0..3)/4),1.5);
    sig = Greyhole.ar(sig,1,0.01,8)/2+sig;
    sig = CombN.ar(sig,4,LFDNoise1.ar(8!4).exprange(0.001,0.02).round(0.02));

  Splay.ar(sig.flat,0.25,0.075);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1666.072132274, 'me', "thisProcess.stop;" ],
[ 1669.8166887, 'me', "(
~test.quant=2;
~test.fadeTime=4;
~test={
    var sig = LFSaw.ar(43.2*[1.25,1.5,1,1]*pi+((1..8)/100));
  sig = sig * Decay.ar(Impulse.ar(1/8,(0..3)/4),1.5);
    sig = CombN.ar(sig,4,LFDNoise1.ar(8!4).exprange(0.001,0.02).round(0.02));

  Splay.ar(sig.flat,0.25,0.075);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1676.413963489, 'me', "thisProcess.stop;" ],
[ 1757.119931002, 'me', "(
~a.fadeTime = 2;
~a={
	var sig,f,s;

	sig=SinOsc.ar(((60+[0,5,7,11,-12,-24,-48,-36,4,-7,-14]).scramble.midicps)*(1.00001**(1..9)));
	sig = sig * LFTri.ar(1/fib(12)).range(1,0);
	sig = LPF.ar(sig,LFSaw.ar(4/fib(