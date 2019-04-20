

p.push();
p.bpm(88);

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=8;
~one.fadeTime=0.4;
~one={
    var mod = Duty.kr(16/~tempo,0,Dseq([1,2,1.5,1.33333],inf)) ;
  var sig = SinOsc.ar([60,~tempo/4.1,60.001],LFNoise1.kr(~tempo/7.5)**0.2*8pi)+LFSaw.ar(~tempo/4,mul:0.5)+ Pulse.ar(~tempo+SinOsc.kr(~tempo/[4,5,6],mul:0.81)) + 1;
  sig = Perlin3.ar(sig[0],sig[1],sig[2]);
  sig = LeakDC.ar(sig);
  sig = PitchShift.ar(sig,~tempo/8,[4,8,mod]/4,0.151,LFSaw.ar(~tempo/4).range(0.001,0.2)) * [1,1,LFTri.ar(~tempo/16)];
  sig = PitchShift.ar(sig,~tempo/16,4/[4,8,mod],0.051,LFSaw.ar(~tempo/4).range(0.001,0.2)) * [1,1,LFTri.ar(~tempo/16)];
  sig = PitchShift.ar(sig,~tempo/32,[4,8,mod],0.151,LFSaw.ar(~tempo/4).range(0.001,0.2)) * [1,1,LFTri.ar(~tempo/16)];

  sig = Pulse.ar(sig.range(33,55).lag(1/(1..10)))/5 + SinOsc.ar(sig.range(33,55),pi)/4 + sig;
  sig = MoogVCF.ar(sig,500/mod,0.05)*4;
  Splay.ar(sig,0.337,0.05,LFCub.ar(7.51)/4,false);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
