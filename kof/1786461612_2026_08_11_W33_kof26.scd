p.push();



// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
  var base = 440 /.x [1,2,4,8] ;
  var mod = Duty.kr([4,8,7]/~tempo,0,Dseq([1,5/4,4/3,7/4,2].scramble,inf));
  var freq =  base  * mod;
  var sig = LFSaw.ar(freq,mul:0.2) * Decay.ar(Impulse.ar(1/2*[1,2,3,4]),0.75);
  Splay.ar(sig,0.0,0.5);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
