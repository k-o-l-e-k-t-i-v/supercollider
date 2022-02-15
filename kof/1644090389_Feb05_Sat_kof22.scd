

p.push();


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


// two synth ///////////////////////////////////////

(
~two.ar(2);
~two.quant=24;
~two.fadeTime=4;
~two={
  var sig = SinOsc.ar(60!2);
  Splay.ar(sig,0.5,0.25);
};
~two.play;
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;



// three synth ///////////////////////////////////////

p.bpm(121.35/2)

(
~three.ar(2);
~three.quant=8;
~three.fadeTime=0.4;
~three={
    var base = Duty.kr(4/~tempo/[1,3,5,7].nthPrime,0,Dseq([60,65,67,48],inf)).midicps  ;
    var mod = Duty.kr(4/~tempo/[1,2,3,4],0,Dseq([1,2,1.5,1.33333,2,1.25,15/8],inf));
    var sig = SinOsc.ar( [50,60] , SinOsc.ar([5,6] / 120 * ~tempo) * Pulse.ar(~tempo/[1,1.5]) *2pi );
    var puls = DelayN.ar(LFPulse.ar(~tempo*2/[4,3,2,1]),(1/[160,240,36,3]));
    sig = CombC.ar(sig*puls,1/~tempo,1/4/base/mod/~tempo,~tempo);
    sig = LeakDC.ar(sig);
    sig = LPF.ar(sig,1800) + HPF.ar(sig,8000);
  Splay.ar(sig,1,0.255);
};
~three.play;
);
~three.stop(64);




~three.clear;
~three.pause;
~three.resume;
