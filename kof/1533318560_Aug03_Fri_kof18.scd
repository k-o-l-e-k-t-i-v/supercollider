p.push();


// highDetune synth ///////////////////////////////////////

(
~highDetune.ar(2);
~highDetune.clock = p.clock;
~highDetune.quant=2;
~highDetune.fadeTime=4;
~highDetune={
    var linear = Duty.kr(15/~tempo*[1,2,4],0,Dseq([1,2,1.5,1.33333],inf));
    var detune = SinOsc.kr([4,5,6])*2;
  var sig = SinOsc.ar(1/16.001/[1,2,3]).range(0,1);
  var sig2 = FSinOsc.ar([220,220.32,221/1.5]*2/linear/(2**([0,3,5,7,12]/12))+detune);
  sig = SelectX.ar(sig*sig2.size,sig2);
  Splay.ar(sig,0.5,0.25);
};
~highDetune.play;
);
~highDetune.stop(4);
~highDetune.clear;
~highDetune.pause;
~highDetune.resume;
