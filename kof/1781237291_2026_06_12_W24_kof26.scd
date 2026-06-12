s.boot();
p=ProxySpace.push();


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
  var base = Duty.kr(4/~tempo,0,Dseq([1,2,1.5,1.33333],inf)) * [50,5000];
  var sig = SinOsc.ar(base*([1,5,8]/12+1**2)) * LFSaw.ar(4/[1,2,3]);
  sig = CombN.ar(sig,1,1/4*[1,2,3],1);
  sig = GVerb.ar(sig,60,3)/8+sig;
  Splay.ar(sig,0.05,0.35);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
