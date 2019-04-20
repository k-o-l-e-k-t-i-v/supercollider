
s.boot;
p.push();

b=Buffer.alloc(s,512,1);
a=Array.fill(512,{|i|sin(i/512*2pi) + rrand(-0.5,0.5)});
b=Buffer.sendCollection(s,a,1,0);

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=4;
~one={
    var mid = 93.75+(SinOsc.ar(8)/8)*4;
  var sig = Osc.ar(b,mid*[1,2,1.5,1/2,4,8,1/4,8,16]+SinOsc.kr(1/16/[1,2,3,4,6,7,8]));
  sig = MoogVCF.ar(sig,mid*[1,2,4,8,16,32],0.94/[1,2,3,4,5,6,7]);
  sig = sig * (LFTri.ar(1/4/(1..16))**2);
  Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

48000/512
