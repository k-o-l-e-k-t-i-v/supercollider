// History, as it was on Sat Jun 13 12:47:49 2015.

[
[ 0, 'me', "(
~dusts.quant=2;
~dusts.fadeTime=2;
~dusts={
  var sig = LFSaw.ar(50!2) * Decay.ar(Dust.ar(LFSaw.ar(1/4/fib(8)).exprange(0.001,1)),0.1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~dusts,postVol:true);
~dusts.play;
);" ],
[ 25.102377545, 'me', "(
~dusts.quant=2;
~dusts.fadeTime=2;
~dusts={
  var sig = WhiteNoise.ar(1!4) * Decay.ar(Dust.ar(LFSaw.ar(1/4/fib(8)).exprange(0.001,1)),0.1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~dusts,postVol:true);
~dusts.play;
);" ],
[ 41.830709782, 'me', "(
~dusts.quant=2;
~dusts.fadeTime=2;
~dusts={
  var sig = WhiteNoise.ar(1!4) * Decay.ar(Dust.ar(LFSaw.ar(1/4/fib(8)).exprange(0.001,4)),0.1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~dusts,postVol:true);
~dusts.play;
);" ],
[ 52.969392682, 'me', "(
~dusts.quant=2;
~dusts.fadeTime=2;
~dusts={
  var sig = WhiteNoise.ar(1!4) * Decay.ar(Dust.ar(LFSaw.ar(1/4/fib(8)).exprange(0.001,8)),0.1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~dusts,postVol:true);
~dusts.play;
);" ],
[ 58.930994738, 'me', "(
~dusts.quant=2;
~dusts.fadeTime=2;
~dusts={
  var sig = WhiteNoise.ar(1!4) * Decay.ar(Dust.ar(LFSaw.ar(1/4/fib(8)).exprange(0.001,32)),0.1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~dusts,postVol:true);
~dusts.play;
);" ],
[ 70.151935906, 'me', "(
~dusts.quant=2;
~dusts.fadeTime=2;
~dusts={
  var sig = WhiteNoise.ar(1!4) * Decay.ar(Dust.ar(LFSaw.ar(1/4/fib(8)).exprange(0.001,32)),0.2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~dusts,postVol:true);
~dusts.play;
);" ],
[ 87.081466005, 'me', "(
~dusts.quant=2;
~dusts.fadeTime=2;
~dusts={
  var sig = PinkNoise.ar(1!4) * Decay.ar(Dust.ar(LFSaw.ar(1/4/fib(8)).exprange(0.001,32)),0.2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~dusts,postVol:true);
~dusts.play;
);" ],
[ 101.060824526, 'me', "(
~dusts.quant=2;
~dusts.fadeTime=2;
~dusts={
  var sig = PinkNoise.ar(1!4) * Decay.ar(Dust.ar(LFSaw.ar(1/4/fib(8)).exprange(0.001,32)),0.2);
  sig = GVerb.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~dusts,postVol:true);
~dusts.play;
);" ],
[ 111.80814025, 'me', "(
~dusts.quant=2;
~dusts.fadeTime=2;
~dusts={
  var sig = WhiteNoise.ar(1!4) * Decay.ar(Dust.ar(LFSaw.ar(1/4/fib(8)).exprange(0.001,32)),0.2);
  sig = GVerb.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~dusts,postVol:true);
~dusts.play;
);" ],
[ 133.648874152, 'me', "(
~dusts.quant=2;
~dusts.fadeTime=2;
~dusts={
  var sig = WhiteNoise.ar(0.2!4) * Decay.ar(Dust.ar(LFSaw.ar(1/4/fib(8)).exprange(0.001,32)),0.2);
  sig = GVerb.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~dusts,postVol:true);
~dusts.play;
);" ],
[ 149.160889498, 'me', "(
~dusts.quant=2;
~dusts.fadeTime=2;
~dusts={
  var sig = WhiteNoise.ar(0.2!4) * Decay.ar(Dust.ar(LFSaw.ar(1/4/fib(8)).exprange(0.001,32)),0.2);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
    sig = GVerb.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~dusts,postVol:true);
~dusts.play;
);" ],
[ 161.269725646, 'me', "(
~dusts.quant=2;
~dusts.fadeTime=2;
~dusts={
  var sig = WhiteNoise.ar(0.2!4) * Decay.ar(Dust.ar(LFSaw.ar(1/4/fib(8)).exprange(0.001,32)),0.2);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
    sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~dusts,postVol:true);
~dusts.play;
);" ],
[ 205.848143259, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
    var sig = SinOsc.ar(50+((1..8)/10)) * Pulse.ar(1);
  sig = GVerb.ar(sig);
  Splay.ar(sig.flat,0.25,0.15);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 221.071994468, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
    var sig = SinOsc.ar(50+((1..8)/10)) * Pulse.ar(1);
  sig = GVerb.ar(sig);
  Splay.ar(sig.flat,0.25,0.005);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 245.55618435, 'me', "(
~dusts.quant=2;
~dusts.fadeTime=2;
~dusts={
  var sig = WhiteNoise.ar(0.2!4) * Decay.ar(Dust.ar(LFSaw.ar(1/4/fib(8)).exprange(0.001,32)),0.2);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
    sig = LPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50);
    sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~dusts,postVol:true);
~dusts.play;
);" ],
[ 281.920072959, 'me', "(
~dusts.quant=2;
~dusts.fadeTime=2;
~dusts={
  var sig = WhiteNoise.ar(0.2!4) * Decay.ar(Dust.ar(LFSaw.ar(4/fib(8)).exprange(0.001,32)),0.2);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
    sig = LPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50);
    sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~dusts,postVol:true);
~dusts.play;
);" ],
[ 290.563081186, 'me', "(
~dusts.quant=2;
~dusts.fadeTime=2;
~dusts={
  var sig = WhiteNoise.ar(0.2!4) * Decay.ar(Dust.ar(LFSaw.ar(4).exprange(0.001,32)),0.2);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
    sig = LPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50);
    sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~dusts,postVol:true);
~dusts.play;
);" ],
[ 299.547152838, 'me', "(
~dusts.quant=2;
~dusts.fadeTime=2;
~dusts={
  var sig = WhiteNoise.ar(0.2!4) * Decay.ar(Dust.ar(LFSaw.ar(1).exprange(0.001,32)),0.2);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
    sig = LPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50);
    sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~dusts,postVol:true);
~dusts.play;
);" ],
[ 335.701583365, 'me', "(
~high.quant=2;
~high.fadeTime=2;
~high={
    var sig = WhiteNoise.ar(1!2);
  sig = HPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*14000+50);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~high,postVol:true);
~high.play;
);" ],
[ 341.158794001, 'me', "(
~high.quant=2;
~high.fadeTime=2;
~high={
    var sig = WhiteNoise.ar(0.1!2);
  sig = HPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*14000+50);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~high,postVol:true);
~high.play;
);" ],
[ 371.840877822, 'me', "(
~flt.quant=2;
~flt.fadeTime=2;
~flt={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.1);
};
~flt.play;
);" ],
[ 373.779143206, 'me', "(
~high.quant=2;
~high.fadeTime=2;
~high={
    var sig = WhiteNoise.ar(0.1!2);
  sig = HPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*14000+50);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~high,postVol:true);
~high.play;
);" ],
[ 375.265370201, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
    var sig = SinOsc.ar(50+((1..8)/10)) * Pulse.ar(1);
  Splay.ar(sig.flat,0.25,0.005);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 376.177793185, 'me', "(
~dusts.quant=2;
~dusts.fadeTime=2;
~dusts={
  var sig = WhiteNoise.ar(0.2!4) * Decay.ar(Dust.ar(LFSaw.ar(1).exprange(0.001,32)),0.2);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
    sig = LPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~dusts,postVol:true);
~dusts.play;
);" ],
[ 384.27939038, 'me', "(
~flt.quant=2;
~flt.fadeTime=2;
~flt={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.1);
};
~flt.play;
);" ],
[ 389.654303336, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
    var sig = SinOsc.ar(50+((1..8)/10)) * Pulse.ar(1);
  Splay.ar(sig.flat,0.25,0.05);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 397.501775629, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
    var sig = SinOsc.ar(50+((1..8)/10)) * Pulse.ar(1);
  Splay.ar(sig.flat,0.25,0.15);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 407.325595933, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
    var sig = SinOsc.ar(50+((1..8)/10)) * Pulse.ar(2);
  Splay.ar(sig.flat,0.25,0.15);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 431.102356512, 'me', "(
~high.quant=2;
~high.fadeTime=2;
~high={
    var sig = WhiteNoise.ar(0.1!2);
  sig = HPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*14000+50);
    sig= sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~high,postVol:true);
~high.play;
);" ],
[ 444.692739162, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
    var sig = SinOsc.ar(60+((1..8)/10)) * Pulse.ar(2);
  Splay.ar(sig.flat,0.25,0.15);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 450.645379118, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
    var sig = SinOsc.ar(60+((1..8)/100)) * Pulse.ar(2);
  Splay.ar(sig.flat,0.25,0.15);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 491.00569204, 'me', "(
~dusts.quant=2;
~dusts.fadeTime=2;
~dusts={
    var sig = SinOsc.ar(432*[1,2,4,8,16,32]) * Decay.ar(Dust.ar(LFSaw.ar(1).exprange(0.001,32)),0.2);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
    sig = LPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~dusts,postVol:true);
~dusts.play;
);" ],
[ 505.736775612, 'me', "(
~dusts.quant=2;
~dusts.fadeTime=2;
~dusts={
    var sig = SinOsc.ar(432*[1,2,4,8,16,32]) * Decay.ar(Dust.ar(LFSaw.ar(1/4).exprange(0.001,32)),0.2);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
    sig = LPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~dusts,postVol:true);
~dusts.play;
);" ],
[ 509.96831673, 'me', "(
~dusts.quant=2;
~dusts.fadeTime=2;
~dusts={
    var sig = SinOsc.ar(432*[1,2,4,8,16,32]) * Decay.ar(Dust.ar(LFSaw.ar(1/4).exprange(0.001,32)),0.12);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
    sig = LPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~dusts,postVol:true);
~dusts.play;
);" ],
[ 515.818362211, 'me', "(
~dusts.quant=2;
~dusts.fadeTime=2;
~dusts={
    var sig = SinOsc.ar(432*[1,2,4,8,16,32]) * Decay.ar(Dust.ar(LFSaw.ar(1/4).exprange(0.001,32)),0.012);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
    sig = LPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~dusts,postVol:true);
~dusts.play;
);" ],
[ 523.372941141, 'me', "(
~dusts.quant=2;
~dusts.fadeTime=2;
~dusts={
    var sig = SinOsc.ar(432*[1,2,4,8,16,32]) * Decay.ar(Dust.ar(LFSaw.ar(1/4).exprange(0.001,32)),0.022);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
    sig = LPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~dusts,postVol:true);
~dusts.play;
);" ],
[ 537.901302512, 'me', "(
~dusts.quant=2;
~dusts.fadeTime=2;
~dusts={
    var sig = SinOsc.ar(432*[1,2,4,8,16,32]) * Decay.ar(Dust.ar(LFSaw.ar(1/4).exprange(0.001,32)),0.022);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = LPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~dusts,postVol:true);
~dusts.play;
);" ],
[ 556.331143821, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar(60+((1..8))) * Pulse.ar(2);
  Splay.ar(sig.flat,0.25,0.15);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 570.387970872, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar(60+((1..8))) * Pulse.ar(4);
  Splay.ar(sig.flat,0.25,0.15);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 588.638568428, 'me', "(
~dusts.quant=2;
~dusts.fadeTime=2;
~dusts={
    var sig = SinOsc.ar(4320/[1,2,4,8,16,32]) * Decay.ar(Dust.ar(LFSaw.ar(1/4).exprange(0.001,32)),0.022);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = LPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~dusts,postVol:true);
~dusts.play;
);" ],
[ 603.164681508, 'me', "(
~dusts.quant=2;
~dusts.fadeTime=2;
~dusts={
    var sig = SinOsc.ar(4320/[1,2,4,8,16,32]) * Decay.ar(Dust.ar(LFSaw.ar(1/4/fib(5)).exprange(0.001,32)),0.022);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = LPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~dusts,postVol:true);
~dusts.play;
);" ],
[ 620.759767185, 'me', "(
~dusts.quant=2;
~dusts.fadeTime=2;
~dusts={
    var sig = SinOsc.ar(4320/[1,2,4,8,16,32]) * Decay.ar(Dust.ar(LFSaw.ar(1/4/fib(5)).exprange(0.001,32)),0.122);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = LPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~dusts,postVol:true);
~dusts.play;
);" ],
[ 634.222673963, 'me', "(
~dusts.quant=2;
~dusts.fadeTime=2;
~dusts={
    var sig = SinOsc.ar(4320/[1,2,4,8,16,32]) * Decay.ar(Dust.ar(LFSaw.ar(1/4/fib(5)).exprange(0.001,32)),0.122);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = LPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*16000+50);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~dusts,postVol:true);
~dusts.play;
);" ],
[ 639.827148369, 'me', "(
~dusts.quant=2;
~dusts.fadeTime=2;
~dusts={
    var sig = SinOsc.ar(4320/[1,2,4,8,16,32]) * Decay.ar(Dust.ar(LFSaw.ar(1/4/fib(5)).exprange(0.001,32)),0.122);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = LPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*4000+50);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~dusts,postVol:true);
~dusts.play;
);" ],
[ 655.150285014, 'me', "(
~high.fadeTime=2;
~high={
    var sig = WhiteNoise.ar(0.1!2);
  sig = HPF.ar(sig,LFSaw.ar(4).exprange(0.001,1)*14000+50);
    sig= sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~high,postVol:true);
~high.play;
);" ],
[ 665.011940464, 'me', "(
~high.quant=2;
~high.fadeTime=2;
~high={
    var sig = WhiteNoise.ar(0.1!2);
  sig = HPF.ar(sig,LFSaw.ar(4).exprange(0.001,1)*14000+50);
    sig= sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~high,postVol:true);
~high.play;
);" ],
[ 673.161778026, 'me', "(
~high.quant=2;
~high.fadeTime=2;
~high={
    var sig = WhiteNoise.ar(0.1!2);
  sig = HPF.ar(sig,LFSaw.ar(4).exprange(0.001,1)*14000+50);
    sig= sig * (1-LFSaw.ar(4/fib(8)).exprange(0.001,1));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~high,postVol:true);
~high.play;
);" ],
[ 682.16049516, 'me', "(
~high.quant=2;
~high.fadeTime=2;
~high={
    var sig = WhiteNoise.ar(0.1!2);
  sig = HPF.ar(sig,LFSaw.ar(4).exprange(0.001,1)*14000+50);
    sig= sig * (1-LFSaw.ar(4/fib(8)).exprange(0.001,1));
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~high,postVol:true);
~high.play;
);" ],
[ 687.650610194, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar(60+((1..8))) * Pulse.ar(4);
  Splay.ar(sig.flat,0.25,0.0015);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 693.614016205, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar(60+((1..8))) * Pulse.ar(4);
  Splay.ar(sig.flat,0.25,0.15);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 698.757955132, 'me', "(
~flt.quant=2;
~flt.fadeTime=2;
~flt={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.1);
};
~flt.play;
);" ],
[ 703.760739023, 'me', "(
~flt.quant=2;
~flt.fadeTime=2;
~flt={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/1.5,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.1);
};
~flt.play;
);" ],
[ 708.05419022, 'me', "(
~flt.quant=2;
~flt.fadeTime=2;
~flt={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/1.25,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.1);
};
~flt.play;
);" ],
[ 710.965816919, 'me', "(
~flt.quant=2;
~flt.fadeTime=2;
~flt={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/0.25,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.1);
};
~flt.play;
);" ],
[ 714.945103879, 'me', "(
~flt.quant=2;
~flt.fadeTime=2;
~flt={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/0.5,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.1);
};
~flt.play;
);" ],
[ 718.16633991, 'me', "(
~flt.quant=2;
~flt.fadeTime=2;
~flt={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/0.5,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/0.5,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.1);
};
~flt.play;
);" ],
[ 725.121780212, 'me', "(
~flt.quant=2;
~flt.fadeTime=2;
~flt={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/3,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/0.5,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.1);
};
~flt.play;
);" ],
[ 736.552104523, 'me', "(
~flt.quant=2;
~flt.fadeTime=2;
~flt={
  var high,mid,low;
  var sig = e.ar;
    sig = GVerb.ar(sig,[10,11]);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/3,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/0.5,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.1);
};
~flt.play;
);" ],
[ 745.536509855, 'me', "(
~flt.quant=2;
~flt.fadeTime=2;
~flt={
  var high,mid,low;
  var sig = e.ar;
    sig = GVerb.ar(sig,[10,11]);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/3,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/0.5,1/2);
  sig = (high+mid+low).flat;
    Splay.ar(sig,0.25,0.1,SinOsc.ar(1));
};
~flt.play;
);" ],
[ 750.374459536, 'me', "(
~flt.quant=2;
~flt.fadeTime=2;
~flt={
  var high,mid,low;
  var sig = e.ar;
    sig = GVerb.ar(sig,[10,11]);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/3,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/0.5,1/2);
  sig = (high+mid+low).flat;
    Splay.ar(sig,0.25,0.1,SinOsc.kr(1));
};
~flt.play;
);" ],
[ 759.391939422, 'me', "(
~flt.quant=2;
~flt.fadeTime=2;
~flt={
  var high,mid,low;
  var sig = e.ar;
    sig = GVerb.ar(sig,[10,11]);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/3,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/0.5,1/2);
  sig = (high+mid+low).flat;
    Splay.ar(sig,0.05,0.1,SinOsc.kr(1));
};
~flt.play;
);" ],
[ 764.719905516, 'me', "(
~flt.quant=2;
~flt.fadeTime=2;
~flt={
  var high,mid,low;
  var sig = e.ar;
    sig = GVerb.ar(sig,[10,11]);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/3,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/0.5,1/2);
  sig = (high+mid+low).flat;
    Splay.ar(sig,0.5,0.1,SinOsc.kr(1));
};
~flt.play;
);" ],
[ 775.978594811, 'me', "(
~flt.quant=2;
~flt.fadeTime=2;
~flt={
  var high,mid,low;
  var sig = e.ar;
    sig = GVerb.ar(sig,[10,11]);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/3,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/0.5,1/2);
  sig = (high+mid+low).flat;
    Splay.ar(sig,0.5,0.1,SinOsc.kr(11));
};
~flt.play;
);" ],
[ 779.242894755, 'me', "(
~flt.quant=2;
~flt.fadeTime=2;
~flt={
  var high,mid,low;
  var sig = e.ar;
    sig = GVerb.ar(sig,[10,11]);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/3,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/0.5,1/2);
  sig = (high+mid+low).flat;
    Splay.ar(sig,0.5,0.1);
};
~flt.play;
);" ],
[ 789.466389898, 'me', "~saw.stop(0.1);" ],
[ 797.301191143, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar(60+((1..8))) * Pulse.ar(4);
  Splay.ar(sig.flat,0.25,0.00015);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 808.802243434, 'me', "(
~high.quant=2;
~high.fadeTime=16;
~high={
    var sig = WhiteNoise.ar(0.1!2);
  sig = HPF.ar(sig,LFSaw.ar(4).exprange(0.001,1)*14000+50);
    sig= sig * (1-LFSaw.ar(4/fib(8)).exprange(0.001,1));
  Splay.ar(sig.flat,0.25,0.00025);
};
e.addMix(~high,postVol:true);
~high.play;
);" ],
[ 819.540366711, 'me', "(
~dusts.quant=2;
~dusts.fadeTime=16;
~dusts={
    var sig = SinOsc.ar(4320/[1,2,4,8,16,32]) * Decay.ar(Dust.ar(LFSaw.ar(1/4/fib(5)).exprange(0.001,32)),0.122);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = LPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*4000+50);
  Splay.ar(sig.flat,0.25,0.000000015);
};
e.addMix(~dusts,postVol:true);
~dusts.play;
);" ],
];