

p.push();


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=4;
~one={
    var base = [
        {TChoose.kr(Impulse.kr(1/8),[65,64,67])},
        {TChoose.kr(Impulse.kr(1/8),[60,61,72])},
        {TChoose.kr(Impulse.kr(1/8),[72,36,48])}
    ].midicps/2;
    var freq = Duty.kr(8*[1,2,3,4]/~tempo,0,Dseq([1,2,1.5,1.33333]*base,inf));
  var sig = Pluck.ar(BrownNoise.ar(1),Impulse.ar(8/[1,2,3,4]),2/freq,1/freq,[1,2,3,4]/4);
  sig = SinOsc.ar(SinOsc.ar(freq/32).range(freq/2,freq*2),mul:0.2)*sig;
  sig = CombL.ar(sig,2/freq,1/freq,1/2);
  Splay.ar(sig,0.15,0.75);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
