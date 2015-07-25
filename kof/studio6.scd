

(
  p=ProxySpace.push(s.reboot);
  e=ProxySubmix.new(\filter);
);



// freq synth ///////////////////////////////////////

(
~freq.quant=1;
~freq.fadeTime=4.02;
~freq={
    var sig = [] ++ LFSaw.ar(432.0/8) ++ WhiteNoise.ar(0.3) ++ LFSaw.ar(4320*2+SinOsc.ar(11).range(0,-4000),mul:0.1) ++ BrownNoise.ar(0.5);
    sig = LPF.ar(sig,[8000,800,80,18000].scramble);
    sig = Select.ar(LFSaw.ar(1/8).range(0,sig.size+0.1),sig);
    //sig = sig * EnvGen.ar(Env([0,1,0],[0.005,0.05],[3,-3]),Impulse.ar(1/4,(0..3)/4));
    
    sig + Impulse.ar(11);
    sig = GVerb.ar(sig,10);
  Mix.ar(sig) * 0.15;
};
e.addMix(~freq,postVol:true);
~freq.play;
);

~freq.stop(7);
~freq.clear;



// imp synth ///////////////////////////////////////

(
~imp.quant=1;
~imp.fadeTime=0.02;
~imp={
  var sig = Impulse.ar([1,1/2,1/4]/8)*80;
  sig = RLPF.ar(sig,[432]);
  Mix.ar(sig) * 0.5;
};
e.addMix(~imp,postVol:true);
~imp.play;
);
~imp.stop(7);
~imp.clear;
