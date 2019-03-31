




p.push();


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=4;
~one={
    var mel = Duty.kr(16/~tempo*[1,2,3],0,Dseq((2..8).log2,inf));
  var sig = SinOsc.ar([[50,51],1000.01/mel,1/4])*LFTri.ar(1/16).exprange(0.1,4)+1;
  var side;
  sig = Perlin3.ar(sig[0],sig[1],sig[2]);
  sig = HPF.ar(sig,22);
  side = sig * LFTri.ar([4,4.01]);
  sig = MoogVCF.ar(sig,[1500,3000]/mel,LFTri.ar(1/4).range(0.1,0.9));
  sig = sig + (AllpassC.ar(side,2/(1..8),1/(1..8),1/4)/(2..9));
  sig = LPF.ar(sig,8000);
  Splay.ar(sig,0.05,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
