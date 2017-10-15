
p.push();
p.bpm(88);


// noises_of_the_noon synth ///////////////////////////////////////

(
~noises_of_the_noon.ar(2);
~noises_of_the_noon.clock = p.clock;
~noises_of_the_noon.quant=4;
~noises_of_the_noon.fadeTime=1;
~noises_of_the_noon={
    var mod = Duty.kr([1,4,16]*4/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
    var f = 110/mod*(2**([102,304,600,1100]/1200));
    var t = LFSaw.ar(f,SinOsc.kr(~tempo/32/[1,2,3])).range(0,2pi);
    var x = t.cos * LFNoise2.kr(~tempo/160!12).range(1/3,4);
    var y = t.sin * LFNoise2.kr(~tempo/160!12).range(1/3,4);
    var z = SinOsc.ar(~tempo/16/(1..12)).range(0,8pi);
  var sig = Perlin3.ar(x,y,z)*SinOsc.ar(f);
//  sig = Resonz.ar(sig,f,0.42);
  sig = Normalizer.ar(sig);
  Splay.ar(sig,1,0.45);
};
~noises_of_the_noon.play;
);
~noises_of_the_noon.stop(4);
~noises_of_the_noon.clear;
~noises_of_the_noon.pause;
~noises_of_the_noon.resume;


(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
)
