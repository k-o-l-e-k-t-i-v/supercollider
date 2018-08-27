

p.push();


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=8;
~one={
  var sig = WhiteNoise.ar(LFSaw.ar(1/[1,2,3,4])/2) * Pulse.ar(1);
  Splay.ar(sig,0.05,0.015,SinOsc.kr([1,2,3,4]*2));
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
)
