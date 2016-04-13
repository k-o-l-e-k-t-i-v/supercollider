


// dusts synth ///////////////////////////////////////

(
~dusts.quant=2;
~dusts.fadeTime=2;
~dusts={
    var sig = SinOsc.ar(4320/[1,2,4,8,16,32]) * Decay.ar(Dust.ar(LFSaw.ar(1/4/fib(5)).exprange(0.001,32)),0.122);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = LPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*4000+50);
  Splay.ar(sig.flat,0.25,0.5);
};
~dusts.play;
);
~dusts.stop(7);



// saw synth ///////////////////////////////////////

(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar(60+((1..8))) * Pulse.ar(4);
  Splay.ar(sig.flat,0.25,0.15);
};
~saw.play;
);
~saw.stop(0.1);



// high synth ///////////////////////////////////////

(
~high.quant=2;
~high.fadeTime=2;
~high={
    var sig = WhiteNoise.ar(0.1!2);
  sig = HPF.ar(sig,LFSaw.ar(4).exprange(0.001,1)*14000+50);
    sig= sig * (1-LFSaw.ar(4/fib(8)).exprange(0.001,1));
  Splay.ar(sig.flat,0.25,0.25);
};
~high.play;
);
~high.stop(7);


// flt filter ///////////////////////////////////////

(
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
);
~flt.stop(7);
