

p.push



// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=4;
~one={
    var rh = 4/[1,4,5];
  var sig = Pulse.ar(rh)+2;
  sig = Perlin3.ar(sig[0],sig[1],sig[2])**LFTri.ar(1/16,add:0.01,mul:2pi);
  sig = SinOsc.ar(sig.range(50,15000),sig,mul:0.25) * Pulse.ar(rh);
    sig = BPF.ar(sig,500) + (SinOsc.ar(50,Pulse.ar(rh))*Pulse.ar(rh));
  Splay.ar(sig,0.95,0.05);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
