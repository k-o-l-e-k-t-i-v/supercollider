p.push();
p.bpm(70)


// tape synth ///////////////////////////////////////

(
~tape.ar(2);
~tape.clock = p.clock;
~tape.quant=4;
~tape.fadeTime=4;
~tape={
  var mod = Duty.kr(4/~tempo*[1,2,3],0,Dseq([1,2,1.5,1.33333],inf));
  var f = 60.midicps  + SinOsc.kr([50,60,70],mul:0.1) / mod;
  var sig = WhiteNoise.ar(0.1!3);
  sig = LocalIn.ar(3) + (sig*Pulse.ar(4));
  sig = LeakDC.ar(sig);
  //sig = LPF.ar(sig,f*8);
  //sig = Normalizer.ar(sig);
  sig = Perlin3.ar(Resonz.ar(sig[0],f,LFNoise1.kr(~tempo/16).range(0.12,0.9)),Resonz.ar(sig[1],f*2,LFNoise1.kr(~tempo/16).range(0.2,0.9)),Resonz.ar(sig[2],f*1.5,LFNoise1.kr(~tempo/16).range(0.2,0.9)));
  sig = Resonz.ar(sig,f);
  sig = CompanderD.ar(sig,3/4,1/2,1);
  sig = HPF.ar(sig,5);
  sig = DelayL.ar((sig*1.01).softclip,1/f,1/f);
  
  LocalOut.ar(sig);
  sig = sig * (LFTri.kr(~tempo/4/[1,2,3])**2);
  Splay.ar(sig,0.75,0.5,SinOsc.kr(7.9));
};
~tape.play;
);
~tape.stop(4);
~tape.clear;
~tape.pause;
~tape.resume;
