
p.push();
p.bpm(93.5);

// test synth ///////////////////////////////////////

(
~test.ar(2);
~test.quant=4;
~test.fadeTime=0.2;
~test={
    var phase = BrownNoise.kr(pi);
    var detune = SinOsc.ar((1..10),mul:0.06);
    var f = 220 * Duty.kr(16/~tempo/[1,2,4],0,Dseq((2**([102,1100,600,804,600,303]/1200).pyramid.scramble),inf)) + SinOsc.kr([4,5,6],mul:0.06);
    var sig2;
  var sig = [
  SinOsc.ar(f+detune[0],phase),
  LFSaw.ar(f+detune[1],phase),
  LFPulse.ar(f+detune[2],phase),
  Pulse.ar(f+detune[3],phase),
  VarSaw.ar(f+detune[4],phase),
  WhiteNoise.ar(1),
  ];
  sig = sig * LFNoise1.kr(~tempo/16!sig.size);
  sig = SelectX.ar(LFTri.ar(~tempo/[1,2,3])*sig.size,sig);
  //sig = Resonz.ar(sig,f,LFNoise1.kr(1/16/[1,2,3]).range(0.2,0.5));
  sig2 = LPF.ar(sig,f*2);
  sig = Normalizer.ar(sig) * (LFTri.ar(~tempo/16/[1,2,3])**2);
  sig = MoogFF.ar(sig,f*([1,2,4].reciprocal+1),LFNoise2.kr(1/16/[1,2,3]).range(0.15,3.5)) + (sig2*Pulse.ar(2*~tempo/[1,2,3])) ;
  sig = Vibrato.ar(sig,[5,6,7],0.1);
  sig = sig * (LFTri.ar(~tempo/[1,2,3])**2);
  sig = CombC.ar(sig,1/2,4/f,1/2);
  sig = LPF.ar(sig,f*2); 
  Splay.ar(sig,0.75,0.85);
};
~test.play;
);
~test.stop(4);
~test.clear;
~test.pause;
~test.resume;
