
s.reboot;

p.push();


// one synth ///////////////////////////////////////


(1..13).nthPrime

(
~one.ar(2);
~one.quant=8;
~one.fadeTime=0.1;
~one={
    var mod2 = Duty.kr([1,2,8]/~tempo,0,Dseq([60,48,62,64,72,71],inf));
    var base = Duty.kr(1/4/~tempo,0,Dseq([65,60,mod2],inf)).midicps*[1,8];
    var mod = Duty.kr([1,2,3]/4/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
    var sig = SinOsc.ar(base/mod*4/(1+(1/(1..13).nthPrime)).pow(2*LFSaw.kr(~tempo*4/[1,2,3]).range(0.5,4))) * Decay.ar(Impulse.ar(1/(4/(1..12).nthPrime+1).pow(2)),(1..12)/4) + CombN.ar(LFSaw.ar(base*mod/8,mul:0.1),1/50,1/60,1);
  Splay.ar(sig,0.15,0.15);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=24;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(50!2);
  Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
