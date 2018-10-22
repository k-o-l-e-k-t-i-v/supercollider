p.push();
s.latency=0.2;

Tdef(\reb,{loop{~one.rebuild;16.wait;}}).play;

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=4;
~one.fadeTime=5;
~one={
    var detune = LFTri.kr(1/4/[1,2,3])**3*4;
  var f = [48,60,72].midicps * { ([3,5,7,11].log2 *.x [1,2,4] /.x [1.5,1,1,1,2,4,4/3]).choose}!3;
  var sig = LFPulse.ar(f+SinOsc.kr([3,4,5],mul:detune),mul:1/[1,2,3]) * FSinOsc.ar(f+SinOsc.kr([4,5,6].scramble,mul:detune),mul:1/[1,2,3]) + VarSaw.ar(f.scramble+SinOsc.kr([5,3,1],mul:detune),mul:1/[1,2,3]);
  sig = sig * LFTri.ar(2/[1,2,3])**2 + (Perlin3.ar(sig[0]+1,sig[1]/4+1,sig[2]+1/2+LFSaw.kr(1/30,mul:0.1))/8);
  sig = CombN.ar(sig,1,[1,1.01],4);
  sig = MoogVCF.ar(Normalizer.ar(Resonz.ar(sig,f,LFNoise2.kr(1/2!3).range(0.1,0.9))),f*2,LFNoise2.kr(1/4!3).exprange(0.1,0.4));
  sig = LeakDC.ar(sig).softclip;
  sig = LPF.ar(sig,f*2);
  Splay.ar(sig,0.5,0.5);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
