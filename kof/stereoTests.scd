
p.push();


b= Buffer.alloc(s,2,48000);

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=0.1;
~one={
    var phase = SinOsc.kr(1/[30,30.1]).range(0,pi);
    var am = LFSaw.ar(1/[60,61]).range(0.00001,0.5);
  var sig = LFTri.ar([50,49]) * BrownNoise.ar(1);
  sig = BufDelayL.ar(b.bufnum,sig,SinOsc.ar([50,50.01],phase,mul:am,add:0.5) );
  sig = LPF.ar(sig,1900);
  Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
