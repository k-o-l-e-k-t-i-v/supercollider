s.boot;
p=ProxySpace.push();


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
  var sig = SinOsc.ar([50,60],Pulse.ar(0.432*4));
  Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

// two synth ///////////////////////////////////////

(
~two.ar(2);
~two.quant=20;
~two.fadeTime=2;
~two={
  var sig = VarSaw.ar(300/(2**([1,5,8]/12+1))) * LFSaw.ar(0.432/[4,2,1]);
  Splay.ar(sig,0.5,0.25);
};
~two.play;
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;
